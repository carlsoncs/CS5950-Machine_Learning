# This ruby program is used to preprocess the data from the
# NewsGroups set.


  Dir.foreach('/path/to/dir') do |item|
      next if item == '.' or item == '..'
      # do work on real items
    end