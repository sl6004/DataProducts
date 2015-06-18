
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(
  
  pageWithSidebar(
    
    headerPanel("A Simple Shiny App to Predict Your Car's Miles Per Gallon"),
    
    sidebarPanel
    (
      h4('Please enter your data below\n'),
      checkboxGroupInput("am","Transmission Type (Select only one type)",c('Automatic ("0")'=0,'Manual ("1")'=1)),
      numericInput('wt','Weight*1000lb (min=1,max=6,step=0.5)',0,min=1,max=6,step=0.5),
      numericInput('hp','Horse Power (min=52, max=335, step=10)', 52, min=52, max=335, step=10),
      submitButton('Submit')
    ),
    
    
    mainPanel(
      
      tabsetPanel (
        id="tabs",
        
        tabPanel
        ("Application Information",
         
         h4('This is a simple Shiny App using multivariate Regression model to predict car fuel efficiency - Mileage Per Gallon (MPG).'),
         h4('Based on the previously analysis we have selected the model requires three major variables: transmission type, weight, and horse power.'),
         h4('To use this application, please enter these three required variables on the left panel, and click the "Submit" botton when you are done.  The App may take a few seconds to calculate after data submitted'),
         h4('Please be patient and navigate to "Results" tab (on the top) to view the corresponding prediction results.'),
         p(strong(em("For more information, please visit:",a("http://rpubs.com/sl6004/shinydoc",href="http://rpubs.com/sl6004/shinydoc"))))     
        ),
        
        tabPanel("Results", 
                 
                 h3('Results of the Prediction'),
                 h4('Transmission Type you have entered:'),
                 verbatimTextOutput("id1"),
                 h4('Weight (per 1000lb) you have entered:'),
                 verbatimTextOutput("id2"),
                 h4('Horse Power you have entered:'),
                 verbatimTextOutput("id3"),
                 h4('The Predicted MPG for your car'),
                 verbatimTextOutput("prediction")
        )
      )
    )
  )
) 