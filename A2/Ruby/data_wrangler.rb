require 'rubygems'
require 'csv'

class DataWrangler

  @virginica=[]
  @setosa=[]
  @versicolor=[]

  @iris_test=[]
  @iris_train=[]

  @iris_categories=[]

  @training_iterator=["Iris-virginica", "Iris-versicolor", "Iris-setosa"]

  # First Read the CSV into memory.  Create three arrays.

 CSV.foreach('iris_data.csv', :headers=>TRUE) do |row|
   temp_hash={row.headers[0].to_sym=>row[0].to_f, row.headers[1].to_sym=>row[1].to_f,
              row.headers[2].to_sym=>row[2].to_f, row.headers[3].to_sym=>row[3].to_f, row.headers[4].to_sym=>row[4]}
   if(temp_hash[:Species] == "Iris-virginica")
      @virginica.push(temp_hash)
   elsif(temp_hash[:Species] == "Iris-setosa")
     @setosa.push(temp_hash)
   else
     @versicolor.push(temp_hash)
   end
 end

  # Next separate out some training and testing data.

  @versicolor.pop(5).map {|entry| @iris_test.push(entry)}
  @virginica.pop(5).map {|entry| @iris_test.push(entry)}
  @setosa.pop(5).map {|entry| @iris_test.push(entry)}

  CSV.open('iris_test.csv', 'wb') do |line|

    @iris_test.each do |entry|
      print_string=String.new('')
      entry.each_value do |value|
        print_string << "#{value},"
      end
      line << [print_string]
    end
  end

  @virginica.collect {|row| @iris_train.push(row)}
  @versicolor.collect {|row| @iris_train.push(row)}
  @setosa.collect {|row| @iris_train.push(row)}



  @iris_train[0].each_key { |key| @iris_categories.push("'#{key.to_s}'")} # Generated a "categories" iterator


  @training_iterator.each do |iris_species|

    temp_clone = Marshal.load(Marshal.dump(@iris_train))

    temp_clone.each do |entry|
      if entry[:Species].eql?(iris_species)
      else
        entry[:Species] = "other"
      end
    end

    count=0
    CSV.open("#{iris_species}_train.csv", 'w') do |line|

      temp_clone.each do |entry|
        write_string=String.new('')
        entry.values.each do |value|
          write_string << "#{value},"
        end
        line << [write_string]
      end
    end

  end





end