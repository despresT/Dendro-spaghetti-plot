increment_data <- read.table("tree rings increment.txt",sep=";",h=T) #for prepare the data, you will need to have a data frame with the core increment starting from the past (DBH = 0 mm) to the present (time where I sampled the tree, in 2011 in this example). At each time step, you add the tree ring length (in mm here). Because trees have not the same age, there is a lot of NA value and the length of the data frame is equal to the year of the oldest trees (here it was a tree not show in this sub-sample).


pdf("Multiplot radial growth sugar maple between 150 and 160 years old.pdf", width=12, height=8) #to save the plot as PDF

    # the 3 following code line are just to help to generate the graphic frame
    increment_data_unique <- as.data.frame(increment_data[,1])
    increment_data_unique <- as.data.frame(increment_data_unique[complete.cases(increment_data_unique), ])
    increment_data_unique <- rbind(0,increment_data_unique)

plot(as.numeric(rownames(increment_data_unique))-1,increment_data_unique[[1]],xlab="Age [in years]",ylab="radial growth [in mm]",main="Radial growth of 19 Sugar maple between 150 and 160 years old overall sample plot",type="n",ylim=c(0,250),xlim=c(0,165)) #generate just the frame of the graphic to have all the same scale

for (i in 1:dim(increment_data)[2]) { #for loop to draw one by one, each line of tree increments, starting all in age 0

    increment_data_unique <- as.data.frame(increment_data[,i])
    increment_data_unique <- as.data.frame(increment_data_unique[complete.cases(increment_data_unique), ]) #remove all the NA value
    increment_data_unique <- rbind(0,increment_data_unique) # add the 0 mm of DBH to start all tree at 0 years-old, 0 DBH
    par(new=TRUE) #allow to combine plots
    plot(as.numeric(rownames(increment_data_unique))-1,increment_data_unique[[1]],xlab="Age [in years]",ylab="radial growth [in mm]",main="Radial growth of 19 Sugar maple between 150 and 160 years old overall sample plot",type="l",ylim=c(0,250),xlim=c(0,165)) #draw the plots for a single tree.
    #then restart the loop with the next tree, etc.
}
dev.off() # save the graphic in your directory
