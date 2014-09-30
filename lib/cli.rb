require_relative 'message_log'
require_relative 'help'
require_relative 'csv'
require_relative 'find'
require_relative 'results_queue'
require_relative 'input_checker'
require 'pry'

class CLI

  attr_reader :message, :input, :help, :csv, :find, :queue, :input_checker

  def initialize(input_stream, output_stream)
    @input   = ''
    @message = MessageLog.new
    @help    = Help.new
    @csv     = Csv.new
    @queue   = ResultsQueue.new
    @find    = Find.new
    @input_stream  = input_stream
    @output_stream = output_stream
  end

  def repl_loop
    @output_stream.puts message.user_start
    @input_checker = InputChecker.new(@input)
    until input_checker.quit
      @input = @input_stream.gets.strip.downcase
      input_checker.pass_input(@input)
      case
      when input_checker.check_help
        @output_stream.puts help.help_intro
      when input_checker.quit
        @output_stream.puts message.goodbye
      when input_checker.load_check
        @find = Find.new(csv.load_file(input.split[1]))
      when input_checker.find_check
        inputs = @input.split
        find1 = inputs.first
        attribute1 = inputs[1]
        criteria1 = inputs[2..-1].join(' ')
        @queue = ResultsQueue.new(find.find_by(attribute1, criteria1))
      when input_checker.queue_count_check
        @output_stream.puts queue.count
      when input_checker.queue_clear_check
        queue.clear
      when input_checker.queue_print_check
        queue.print_queue
      when input_checker.queue_sort_check
        queue.sort_queue(input.split.last)
      when input_checker.queue_save_check
        csv.save_queue(@input.split[2])
      end
    end
  end
end
