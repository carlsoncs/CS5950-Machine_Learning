require 'rinruby'
require 'csv'

class DataWrangler

  @virginica=[]
  @setosa=[]
  @versicolor=[]

  @iris_test=[]
  @iris_train=[]

  @training_iterator=["Iris-virginica", "Iris-versicolor", "Iris-setosa"]

  # First Read the CSV into memory.  Create three arrays.

 CSV.foreach('/home/christopher/Documents/WMU Classes/CS5950_Machine_Learning/CS5950-Machine_Learning/A2/Ruby/iris_data.csv', :headers=>TRUE) do |row|
   temp_hash={row.headers[0].to_sym=>row[0].to_f, row.headers[1].to_sym=>row[1].to_i,
              row.headers[2].to_sym=>row[2].to_f, row.headers[3].to_sym=>row[3].to_i, row.headers[4].to_sym=>row[4]}
   if(temp_hash[:Species] == "Iris-virginica")
      @virginica.push(temp_hash)
   elsif(temp_hash[:Species] == "Iris-setosa")
     @setosa.push(temp_hash)
   else
     @versicolor.push(temp_hash)
   end
 end

  # Next separate out some training and testing data.

  @iris_test.push(@versicolor.pop(5))
  @iris_test.push(@virginica.pop(5))
  @iris_test.push(@setosa.pop(5))

  @virginica.collect {|row| @iris_train.push(row)}
  @versicolor.collect {|row| @iris_train.push(row)}
  @setosa.collect {|row| @iris_train.push(row)}


  # Now start by training a "General Linear Model"

  @training_iterator.each do |iris_species|
    


  end



end