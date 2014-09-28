require_relative 'message_log'
require_relative 'help'
require_relative 'csv'

class CLI

  attr_reader :message, :input, :help, :csv_obj

  def initialize
    @input = ''
    @message = MessageLog.new
    @help = Help.new
    @csv_obj = Csv.new
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
          csv_obj.load_file
        when find
          find1, attribute1, criteria1 = @input.split
          csv_obj.find_by_first_name(criteria1)
        when queue_count_check
          puts csv_obj.queue_count
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

  def find
    input[0...4].downcase == 'find'
  end
end
