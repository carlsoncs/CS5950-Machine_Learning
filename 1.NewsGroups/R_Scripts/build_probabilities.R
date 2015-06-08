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
  
  DATA_PATH='/Users/christopher/Documents/WMU_Classes/CS5950/CS5950-Machine_Learning/1.NewsGroups/Pre-Processed_Data/'
  RAW_DATA_PATH = '/Users/christopher/Documents/WMU_Classes/CS5950/CS5950-Machine_Learning/1.NewsGroups/Data/20news-bydate-train/'
  
  ## list.files lists the names of files found given a path.  
  
  categories.files=list.files(path=DATA_PATH)
	
  categories <- gsub(".csv", "", categories.files) 
  
  ## Prepend the path to each file
  
  categories.raw.files = categories.files
  
  categories.raw.files = lapply(categories, function(x) paste(RAW_DATA_PATH, x, sep=''))
  categories.files = lapply(categories.files, function(x) paste(DATA_PATH, x, sep='')) 
  
  categories.words = lapply(categories.files, function(x) read.csv(x,header=TRUE, sep=','))
	
	names(categories.words) = categories
	
	for( i in 1:length(categories.words) )
	{
		categories.values[[i]] = categories.words[[i]]$Frequency
		categories.words[[i]] = categories.words[[i]]$Word
	}

	for( i in 1:length(categories.words) )
	{
		names(categories.values[[i]]) = categories.words[[i]]
	}

	categories.probabilities = lapply(categories.raw.files, function(x) length(list.files(x)))
	total_files = sum(unlist(categories.probabilities))
	total_files = total_files + 0.001
	
	categories.probabilities = lapply(categories.probabilities, function(x) x/total_files)
	
	
	
	
	
	
	
	