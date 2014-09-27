class Help

  def help_intro
    "Here is a list of all the commands at your disposal. Type help <command> to view what it does.\n
    -load <filename>\n
    -queue count\n
    -queue clear\n
    -queue print by <attribute>\n
    -queue attribute by\n
    -queue save to <filename.csv>\n
    -find <attribute> <criteria>\n"
  end

  def load
    "Load <filename> allows you to load a file."
  end

  def queue_count
    "Queue count tells you how many records are in the current queue."
  end

  def queue_clear
    "Queue clear empties the current queue."
  end

  def queue_print
    "Queue print prints out a data table of the current queue."
  end

  def queue_attribute
    "Queue print by: <attribute> will print the data table sorted by a specific attribute such as zipcode."
  end

  def save_file
    "Queue save to <filename.csv> will export the current queue to the specified filename as a CSV."
  end

  def find_critera
    "find <attribute> <criteria> will load the queue with all records matching the criteria for the given attribute."
  end

end
