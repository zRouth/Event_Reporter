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
      @output_stream.print ">"
      @input = @input_stream.gets.strip.downcase
      input_check.pass_input(@input)
      case
      when input_check.help? then @output_stream.puts help.help_select(input)
      when input_check.quit? then @output_stream.puts message.goodbye
      when input_check.load? then @find = Find.new(csv.load_file(input.split[1]))
      when input_check.find? then find_attendee
      when input_check.find_and?    then find_attendee_two_attributes
      when input_check.queue_count? then @output_stream.puts queue.count
      when input_check.queue_clear? then queue.clear
      when input_check.queue_print? then @output_stream.puts queue.format_queue
      when input_check.queue_sort?  then queue.sort_queue(input.split.last)
                                         @output_stream.puts queue.format_queue
      when input_check.queue_save?  then queue.save_queue(@input.split[-1])
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

  def find_attendee_two_attributes
    string1, string2 = @input.split("and ")
    attribute1 = string1.split[1]
    criteria1 = string1.split[2..-1].join(" ")
    attribute2 = string2.split[0]
    criteria2 = string2.split[1..-1].join(" ")
    @queue = ResultsQueue.new(find.find_by(attribute1, criteria1))
    @queue.search_twice(attribute2, criteria2)
  end
end
