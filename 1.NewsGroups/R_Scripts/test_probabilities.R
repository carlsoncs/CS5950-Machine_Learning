  # This program uses the 20-NewsGroups data to to build an email
  # classifier.  It is entirely using naive Bayesian methodology.
  
  ## Libraries
  library(stringr)
  library(tm)
  library(iterators)

  
  ## Functions
	get_probability <- function(frequency_list, word, category)
	{
		prob = frequency_list[[category]][word]
		return(prob)
	
	}
	


  ## Constants
  
  TEST_DATA='/Users/christopher/Documents/WMU_Classes/CS5950/CS5950-Machine_Learning/1.NewsGroups/Data/20news-bydate-Test/'
  
  
  
  #####					 Main Logic 							#####
  
  
  ## Read each test document into memory.
  test.files = list.files(TEST_DATA)
  test.files = lapply(test.files, function(x) paste0(TEST_DATA, x))
  
  
  ## Determine the word frequency matrix for the document.
	for( i in 1:length(test.files))
	{
		cat_files = list.files(test.files[[i]])
		
		for( j in 1:length(cat_files))
		{
			temp = readlines(cat_files[[j]])
			test.words = split(
		
		}
	}
	
	## Determine the overall probability that this document belongs to each category.
	
	
	## Select and categorize the file as the maximum of the probability list.  
	
	
	
	
	
	