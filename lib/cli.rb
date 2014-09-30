require_relative 'message_log'
require_relative 'help'
require_relative 'csv'
require_relative 'find'
require_relative 'results_queue'
require_relative 'input_checker'
require 'pry'

class CLI

  attr_reader :message, :input, :help, :csv, :find, :queue, :input_check

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

  def welcome_user
    @output_stream.puts message.user_start
    @input_check = InputChecker.new(@input)
    repl_loop
  end

  def repl_loop
    until input_check.quit?
      @input = @input_stream.gets.strip.downcase
      input_check.pass_input(@input)
      case
      when input_check.help? then @output_stream.puts help.help_intro
      when input_check.quit? then @output_stream.puts message.goodbye
      when input_check.load? then @find = Find.new(csv.load_file(input.split[1]))
      when input_check.find? then find_attendee
      when input_check.queue_count? then @output_stream.puts queue.count
      when input_check.queue_clear? then queue.clear
      when input_check.queue_print? then queue.print_queue
      when input_check.queue_sort? then queue.sort_queue(input.split.last)
      when input_check.queue_save? then queue.save_queue(@input.split[-1])
      end
    end
  end

  def find_attendee
    inputs = @input.split
    find1 = inputs.first
    attribute1 = inputs[1]
    criteria1 = inputs[2..-1].join(' ')
    @queue = ResultsQueue.new(find.find_by(attribute1, criteria1))
  end

end
