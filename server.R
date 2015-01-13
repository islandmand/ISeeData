library(shiny)

shinyServer(function(input,output){
    
    # get the uploaded dataset
    dataUpload<-reactive({
        inFile<-input$file
        if(is.null(inFile))
        return(NULL)
        read.csv(inFile$datapath,header=input$header,sep=input$sep)
    
    })
    
    # dimensions of the dataset
    output$dim<-renderText({
    	paste("This dataset has:",dim(dataUpload())[1],"observations over ",dim(dataUpload())[2],"variables.")
    	
    })
    #generate an HTML table view of the data
    output$data<-renderTable({
        head(dataUpload(),n=input$num)
    })
    
    # generate the structure of the dataset
    output$structure<-renderPrint({
         str(dataUpload())
    })
    
    #generate a summary of the data
        output$summary<-renderPrint({
            dataset<-dataUpload()
            summary(dataset)
    })
    
	
})