complete = function(directory="~/specdata/", id=1:332){
    #This will hold the corresponding IDs
    id_col= vector()
    #This will hold the no. of complete cases
    nobs_col = vector()
    files = list.files(directory)
    for(i in id){
        #Read in each files
        monitor_file = read.csv(paste(directory, files[i], sep = "/"))
        #Find the complete cases
        good = complete.cases(monitor_file)
        #count the no. of complete cases
        nrows = nrow(monitor_file[good,])
        #store no. of complete cases in all files
        nobs_col = rbind(nobs_col,nrows)
        #store the corresponding IDs of each file
        id_col= rbind(id_col, i)
        
    }
    #create the final data frame with id and nobs columns
    df = data.frame(id=id_col, nobs=nobs_col, row.names = NULL)
    return(df)
}