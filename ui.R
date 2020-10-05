
library(shiny)
library(stringr)
library(plotly)

shinyUI(fluidPage(
        titlePanel(
                "Developing Data Products Course Project - Analyses of famous mtcars dataset"
        ),
        sidebarLayout(
                sidebarPanel(
                        selectInput(
                                "INPUTY",
                                label = h3("Select the first variable: "),
                                choices = list(
                                        "Miles/(US) gallon" = "mpg",
                                        "Number of cylinders" = "cyl",
                                        "Gross horsepower" = "hp",
                                        "Weight" = "wt",
                                        "1/4 mile time" = "qsec"
                                ),
                                selected = "mpg"
                        ),
                        selectInput(
                                "INPUTX",
                                label = h3("Select the second variable: "),
                                choices = list(
                                        "Miles/(US) gallon" = "mpg",
                                        "Number of cylinders" = "cyl",
                                        "Gross horsepower" = "hp",
                                        "Weight" = "wt",
                                        "1/4 mile time" = "qsec"
                                ),
                                selected = "hp"
                        ),
                        submitButton("Submit")
                ),
                mainPanel(
                        p("This web app was create based in the famous",
                          span("mtcars R dataset", style = "color:blue"),
                          " to accomplish the Developing Data Products Course."),
                        p("The goal of this panel is understand the relationship of some variables of the dataset, build with actual values for some types of cars."),
                        p("Please, select two variables in the sidebar panel to visualize their relationship."),
                        plotlyOutput("plot1"))
        )
))