
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
library(ggplot2)

predictMix <- function(x, mu, pct, n) {
  
  sd <- mu/sqrt(40)
  
  dtotal <- dnorm(x, mu[1], sd[1]) * pct[1] + 
    dnorm(x, mu[2], sd[2]) * pct[2] + 
    dnorm(x, mu[3], sd[3]) * pct[3]
  
  probn <- (dnorm(x, mu, sd) * pct) / dtotal
  probn[n]
}

shinyServer(
  function(input, output) {
    lambda <- c(0.1, 0.05, 0.0286)
    runs <- c(1000, 830, 500)
    sims <- 40
    pct <- runs / sum(runs)
    
    mu <- 1/lambda
    sd <- lambda/sqrt(sims)
    
    sample_means <- c(replicate(runs[1], (mean(rexp(sims, lambda[1])))),
                          replicate(runs[2], (mean(rexp(sims, lambda[2])))),
                          replicate(runs[3], (mean(rexp(sims, lambda[3])))))
    
    output$newDens <- renderPlot({
      ggplot(as.data.frame(sample_means), aes(x=sample_means)) + 
        geom_density(colour="blue") +
        geom_histogram(alpha = .20, binwidth = 1, colour = "black",
                       aes(y = ..density..)) +
        geom_vline(xintercept=input$obsval, colour="red")
      })
    output$oobsval <- renderPrint({input$obsval})
    output$oprob1 <- renderPrint({predictMix(input$obsval, mu, pct, 1)}) 
    output$oprob2 <- renderPrint({predictMix(input$obsval, mu, pct, 2)}) 
    output$oprob3 <- renderPrint({predictMix(input$obsval, mu, pct, 3)}) 
    
#    output$prob1 <- renderPrint({predictMix(x, mu, pct, n)})   
#    output$prob1 <- renderPrint({probn[1]})
#    output$oid1 <- renderPrint({input$id1})
#    output$oid2 <- renderPrint({input$id2})
  }
)
