class InputChecker
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def pass_input(input)
    @input = input
  end

  def queue_count_check
    input == 'queue count'
  end

  def check_help
    input == 'h' || input == 'help'
  end

  def quit
    input == 'q' || input == 'quit'
  end

  def load_check
    @input.split[0] == 'load'
  end

  def find_check
    input[0...4] == 'find'
  end

  def queue_clear_check
    input == 'queue clear'
  end

  def queue_print_check
    input == 'queue print'
  end

  def queue_sort_check
    word1, word2, word3 = @input.split
    word1 == 'queue' && word2 =='print' && word3 == 'by'
  end

  def queue_save_check
    word1, word2 = @input.split
    word1 == 'queue' && word2 =='save'
  end

end
