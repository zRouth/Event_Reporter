class ResultsQueue
  attr_reader :results

  def initialize(results)
    @results = results
  end

  def count
    results.count
  end

  def clear
    @results = []
  end

end
