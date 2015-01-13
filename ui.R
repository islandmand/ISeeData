library(shiny)

# Define UI for random distribution application 
shinyUI(fluidPage(
    
  # APP title and brif info
 titlePanel("I See Data"),
 p("This is a simple web APP built by",a("Shiny",href="http://www.rstudio.com/shiny"),"(a web application framework for R). "),
 p("After uploading a CSV dataset, the APP will display the dataset in a table view, and show the data structure and data summary as well. "),
  
 # sidebar layout
 # sidebar panel with file uploading and choosing the numer of displayed observations
  sidebarLayout(
    sidebarPanel(width=3,
      fileInput("file","Choose a CSV File", accept=c('text/csv','text/comma-separated-values,text/plain','.csv')),
      tags$hr(),
      checkboxInput("header","Header",TRUE),
      radioButtons("sep","Separator",c(Comma=',',Semicolon=';',Tab='\t')),

      tags$hr(),
      
     numericInput("num","Number of observations to view:",10)
      ),
    
    # Show a tabset that includes the table view and summary of data
    mainPanel(
      tabsetPanel(type = "tabs",
        tabPanel(p(textOutput("dim")),title="Data", tableOutput("data")),
        tabPanel("Structure", verbatimTextOutput("structure")),
        tabPanel("Summary", verbatimTextOutput("summary"))
      )
    )
  )
))
