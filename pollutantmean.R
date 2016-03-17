pollutantmean = function(directory = "~/specdata/", pollutant, id=1:332){
    #get a list of all files in specdata directory
    files = list.files(directory)
    #this will hold the matching rows
    all_rows = vector()
    for (i in id){
        #read matching files
        file_raw = read.csv(paste(directory,files[i],sep = "/"))
        #create a logical vector that corresponds to rows containing NA values
        bad = is.na(file_raw[,pollutant])
        #select rows that do not contain NA values
        file = file_raw[!bad,]
        #store all 'good' rows of pollutant
        all_rows = append(all_rows,file[,pollutant])    
    }
    #find well, the mean!
    mean(all_rows)
}
