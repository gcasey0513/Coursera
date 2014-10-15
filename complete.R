complete <- function(directory, id = 1:332) {
        files_full<-list.files(directory, full.names=TRUE) #list all files in directory
        my_data2<-data.frame() # instantiate datafrom
        
        for(i in 1:length(id)) # for every file specified
                {
                my_data<-read.csv(files_full[id[i]]) #selct the file by index of ID
                my_data2<-rbind(my_data2, c(id[i], sum(complete.cases(my_data))))       
                }
        colnames(my_data2)<-c("id","nobs")
        return(my_data2) # return the dataframe

}