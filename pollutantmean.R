pollutantmean <- function(directory, pollutant, id = 1:332) {
        files_full<-list.files(directory, full.names=TRUE) #list all files in directory
        my_data<-data.frame() # instantiate datafrom
        for(i in 1:length(id)) # for every file specified
                {
                my_data<-rbind(my_data ,read.csv(files_full[id[i]])) #selct the file by index of ID
                       
                }
        my_data_subset<-my_data[,pollutant] # onlt look at the specified pollutant
        return(mean(my_data_subset, na.rm=TRUE)) # return the mean excluding NA Values

}