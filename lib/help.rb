class Help

  def help_select(input)
    case
      when input == 'h' || input == 'help' then help_intro
      when input.split[1] == 'load' then load_description
      when input.split[1] == 'queue' && input.split[2] == 'count' then queue_count
      when input.split[1] == 'queue' && input.split[2] == 'clear' then queue_clear
      when input.split[1] == 'queue' && input.split[2] == 'print' && input.split[3] == 'by' then queue_print_attribute
      when input.split[1] == 'queue' && input.split[2] == 'print' then queue_print
      when input.split[1] == 'queue' && input.split[2] == 'save' then save_file
      when input.split[1] == 'find' && input.split[2] == '<attribute>' then find_criteria
    end
  end

  def help_intro
    "Here is a list of all the commands at your disposal. Type help <command> to view what it does.\n
    -help
    -load <filename>
    -queue count
    -queue clear
    -queue print
    -queue print by <attribute>
    -queue save to <filename.csv>
    -find <attribute> <criteria>"
  end

  def load_description
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

  def queue_print_attribute
    "Queue print by <attribute> will print the data table sorted by a specific attribute such as zipcode."
  end

  def save_file
    "Queue save to <filename.csv> will export the current queue to the specified filename as a CSV."
  end

  def find_criteria
    "Find <attribute> <criteria> will load the queue with all records matching the criteria for the given attribute."
  end

end
