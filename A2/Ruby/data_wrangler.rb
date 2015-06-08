require 'rubygems'
require 'rserve'
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

 CSV.foreach('/home/christopher/Documents/WMU Classes/CS5950_Machine_Learning/CS5950-Machine_Learning/A2/Ruby/iris_data.csv', :headers=>TRUE) do |row|
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

  @iris_test.push(@versicolor.pop(5))
  @iris_test.push(@virginica.pop(5))
  @iris_test.push(@setosa.pop(5))

  @virginica.collect {|row| @iris_train.push(row)}
  @versicolor.collect {|row| @iris_train.push(row)}
  @setosa.collect {|row| @iris_train.push(row)}


  @iris_train[0].each_key { |key| @iris_categories.push("'#{key.to_s}'")} # Generated a "categories" iterator


  # Now start by training a "General Linear Model"

  @training_iterator.each do |iris_species|
    petal_widths=[]
    petal_lengths=[]
    sepal_widths=[]
    sepal_lengths=[]
    species=[]

    @iris_train.collect do |observation|
      petal_widths.push(observation[:Petal_Width])
      petal_lengths.push(observation[:Petal_Length])
      sepal_widths.push(observation[:Sepal_Width])
      sepal_lengths.push(observation[:Sepal_Length])

      if iris_species == observation[:Species]
        species.push(observation[:Species])
      else
        species.push('other')
      end
    end



    species.map! {|name| "'#{name}'"}

    count=0
    train_csv=CSV.open("/home/christopher/Documents/WMU Classes/CS5950_Machine_Learning/CS5950-Machine_Learning/A2/Ruby/#{iris_species}_train.csv", 'wb') do |line|

      if count==0
        line << [@iris_categories.to_csv(:row_sep=>FALSE)]
        count+=1
      else

      end


    end
    # test_csv=CSV.open("/home/christopher/Documents/WMU Classes/CS5950_Machine_Learning/CS5950-Machine_Learning/A2/Ruby/#{iris_species}_test.csv", 'wb') do |line|
    #   if count==0
    #     @iris_test[0].each_key {|key| line << key}
    #   else
    #     @iris_test.each do |row|
    #       line << row
    #     end
    #   end
    # end
  end





end