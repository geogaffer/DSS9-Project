
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Proportions in a multipopulation mixture"),
  
  # Sidebar 
  sidebarPanel(
    h2('Parameters'),
#    numericInput('id1', 'Numeric input, label id1', 0, min=0, max=10, step=1),
    sliderInput('obsval', 'Observed value for source prediction', 
                value=40, min=1, max=100, step=1),
    h5('simulation mixture'),
    h5('1/lambda1 = 10  runs = 1000  43%'),
    h5('1/lambda2 = 20  runs =  830  36%'),
    h5('1/lambda3 = 35  runs =  500  21%')
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    h3('Simulated sample distribution(s)'),
    plotOutput('newDens'),
     h4('Your observed value is:'),
     verbatimTextOutput("oobsval"),
     h4('Estimated probability of populations 1, 2 and 3:'),
     verbatimTextOutput("oprob1"),
     verbatimTextOutput("oprob2"),
     verbatimTextOutput("oprob3")
  )
))
