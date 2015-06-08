  ## The goal of this script is to build the initial probabilities for the 
  ## frequency of messages belonging to a particular group, and the probabilities
  ## of particular words occurring within each group.  I also hope to do a few things
  ## to remove words that will probably unhelpful predictors, (two letter words, 
  ## three letter words?).
  
  ## Libraries
  library(stringr)
  library(tm)
  
  ## Functions
  

	
  
  ## Constants
  
  PATH="data/20news-bydate-train/"	
  
  ## List Dirs returns the directory names given a path.  Recursive=TRUE
  ## will only list files.  It will automatically recurse into directories 
  ## to retrieve the file names contained within.
  
  categories=list.dirs(path=PATH, recursive=FALSE)
  
	categories<- gsub(PATH, "", categories)	
  categories <- gsub("/", "", categories) # For some Reason the final slash isnt getting
  																				# deleted.
  categories
  length(categories)		## just for my own comfort, ensure there are in fact 20 categories.
  
  categories.files = categories
  
  for( i in 1:length(categories) )
  {
  	categories.files[i] = paste(PATH,categories.files[i], "/", sep="")
  }
  
  categories.nfiles = numeric(20)
  
  for(i in 1:length(categories))
  {
  	categories.nfiles[i] = length(list.files(categories.files[i]))
	}
	categories.nfiles
	total.files = sum(categories.nfiles)
	total.files
	
	categories.probabilities = numeric(20)
	
	for(i in 1:length(categories))
	{
		categories.probabilities[i] = categories.nfiles[i]/total.files
	}
	
	categories.probabilities  ## finally, we have one of the measures we need to comupute
														## Bayesian probabilities on the files.
		
		
														
	## Now on to determining the relative probabilities for each word found in each category.
	
	## First we need to be able to access each file in each category for processing:
	
	
	
	for(i in 1:length(categories) )
	{
		temp = list()
		temp = list.files(categories.files[i])
		
		for( j in 1:length(temp))
		{
			file = paste(categories.files[i], temp[j], sep="")
			contents = paste(readLines(file), collapse=" ")
			
		}
		
		
	}
	

	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	