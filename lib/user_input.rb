class UserInput

  attr_reader :input

  def initialize(stdin = $stdin)
    @input = ''
    @stdin = stdin
  end

  def get
    @input = @stdin.gets.strip
  end

  
end
