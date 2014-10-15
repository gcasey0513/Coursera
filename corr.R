corr <- function(directory, threshold = 0) {
        
        threshold_df<-subset(complete(directory), nobs >= threshold)
        
        files_full<-list.files(directory, full.names=TRUE) #list all files in directory
        
        my_vector<-c()
        if(nrow(threshold_df) > 0)
        {
                for(i in 1:nrow(threshold_df)) # for every file specified
                {
                        my_data<-read.csv(files_full[threshold_df$id[i]]) #selct the file by index of ID
                        #my_data2<-my_data[complete.cases(my_data),]
                        my_vector<-c(my_vector, as.vector(cor(my_data$sulfate, my_data$nitrate, use = "na.or.complete")))
                }          
        }
        return (my_vector) # return the correlation vector
        
}