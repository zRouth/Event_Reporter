require_relative 'message_log'
require_relative 'help'
require_relative 'csv'

class CLI

  attr_reader :message, :input, :help, :csv

  def initialize
    @input = ''
    @message = MessageLog.new
    @help = Help.new
    @csv = Csv.new
  end

  def repl_loop
    puts message.user_start
      @input = gets.strip
      case
      when check_help
        puts help.help_intro
      when quit
        puts message.goodbye
      when load
        csv.load_file
      end
  end

  def check_help
    input == 'h' || input == 'help'
  end

  def quit
    input == 'q' || input == 'quit'
  end

  def load
    input == 'load'
  end
end
