class InputChecker
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def pass_input(input)
    @input = input
  end

  def queue_count?
    input == 'queue count'
  end

  def help?
    input.split[0] == 'h' || input.split[0] == 'help'
  end

  def quit?
    input == 'q' || input == 'quit'
  end

  def load?
    input.split[0] == 'load'
  end

  def find?
    input[0...4] == 'find'
  end

  def queue_clear?
    input == 'queue clear'
  end

  def queue_print?
    input == 'queue print'
  end

  def queue_sort?
    word1, word2, word3 = @input.split
    word1 == 'queue' && word2 =='print' && word3 == 'by'
  end

  def queue_save?
    word1, word2 = @input.split
    word1 == 'queue' && word2 =='save'
  end

end
