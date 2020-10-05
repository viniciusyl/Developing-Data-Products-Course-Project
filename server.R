

library(shiny)
library(plotly)
library(stringr)
library(tidyverse)

shinyServer(function(input, output){
        
        output$plot1 = renderPlotly({
                
                inputy = input$INPUTY
                inputx = input$INPUTX
                
                model1 = lm(mtcars[, inputy] ~ mtcars[, inputx], data = mtcars)
                
                plot_1 = plot_ly(mtcars,
                                 x = mtcars[, inputx],
                                 y = mtcars[, inputy],
                                 text = rownames(mtcars))
                plot_1 = plot_1 %>% add_markers()
                plot_1 = plot_1 %>% add_trace(x = ~ mtcars[, inputx],
                                              y = fitted.values(model1),
                                              mode = "lines")
                plot_1 = plot_1 %>% layout(
                        title = str_c(inputy, " vs. ", inputx),
                        xaxis = list(title = inputx),
                        yaxis = list(title = inputy),
                        showlegend = F
                )
                
        })
        
})
