corr = function(directory="~/specdata/", threshold=0){
    #This will hold the corresponding IDs
    cor_vector= vector(length = 0,mode = "numeric" )
    #get the list of files
    files = list.files(directory)
    for(i in 1:332){
        #Read in each files
        monitor_file = read.csv(paste(directory, files[i], sep = "/"))
        #Find the complete cases
        good = complete.cases(monitor_file)
        good_file = monitor_file[good,]
        #count the no. of complete cases
        n_rows = nrow(good_file)
        #Do this if there are enough complete cases
        if(n_rows>threshold){
            #find correlation between sulfate and nitrate
            sulf_nit = cor(good_file[,2], good_file[,3])
            #append the result to the vector
            cor_vector = append(cor_vector, sulf_nit)
        }
        #skip the files if there are not enough complete cases
        if(n_rows<threshold) {
            next()
        }
       
    }
    return(cor_vector)
}