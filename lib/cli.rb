require_relative 'message_log'
require_relative 'help'
require_relative 'csv'
require_relative 'find'
require_relative 'results_queue'

class CLI

  attr_reader :message, :input, :help, :csv, :find, :queue

  def initialize
    @input = ''
    @message = MessageLog.new
    @help = Help.new
    @csv = Csv.new
  end

  def repl_loop
    puts message.user_start
      until quit
        @input = gets.strip
        case
        when check_help
          puts help.help_intro
        when quit
          puts message.goodbye
        when load_check
          @find = Find.new(csv.load_file)
        when find_check
          find1, attribute1, criteria1 = @input.split
          @queue = ResultsQueue.new(find.find_by(attribute1, criteria1))
        when queue_count_check
          puts queue.count
        when queue_clear_check
          queue.clear
        end
      end
  end

  def queue_count_check
    input.downcase == 'queue count'
  end

  def check_help
    input.downcase == 'h' || input.downcase == 'help'
  end

  def quit
    input.downcase == 'q' || input.downcase == 'quit'
  end

  def load_check
    input.downcase == 'load'
  end

  def find_check
    input[0...4].downcase == 'find'
  end

  def queue_clear_check
    input.downcase == 'queue clear'
  end

end
