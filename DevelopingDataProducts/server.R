library(shinyapps)
library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

        mpgprediction <- reactive({
                mpg_model <- lm(mpg ~ cyl + wt, data = mtcars)
                x <- predict(mpg_model, newdata = data.frame(cyl = input$cyl, wt = input$wt))
                return(x[1])
        })
        output$mpgprediction <- renderText(sprintf("Prediction: %.1f MPG", mpgprediction()))
        output$graph_mpg <- renderPlot({
                
                mtcars_data <- mtcars
                mtcars_data$data_source = "Motor Trend"
                selected_car <- data.frame(mpg = mpgprediction(), cyl = input$cyl, disp = 1,
                                           hp = 1, drat = 1, wt = input$wt, qsec = 1, vs = 1,
                                           am = 1, gear = 1, carb = 1, data_source = "Prediction")
                mtcars_data <- rbind(mtcars_data, selected_car)
                rownames(mtcars_data)[nrow(mtcars_data)] <- "user"
                xfactor <- (max(mtcars_data$wt) - min(mtcars_data$wt)) * 0.025
                yfactor <- (max(mtcars_data$cyl) - min(mtcars_data$cyl)) * 0.25
                mtcars_data$cyl <- as.factor(mtcars_data$cyl)
                graph_1 <- ggplot(mtcars_data, aes(x = wt, y = mpg, color = cyl, shape = data_source)) +
                        annotate("rect", xmin = selected_car$wt - xfactor, ymin = selected_car$mpg - yfactor,
                                 xmax = selected_car$wt + xfactor, ymax = selected_car$mpg + yfactor,
                                 alpha = 0.3, fill = "blue") +
                        annotate("text", x = selected_car$wt + xfactor, y = selected_car$mpg + yfactor, label = "Car Selection") +
                        geom_point(size = 5, alpha = 0.75) + xlab("Weight") + ylab("MPG") +
                        ggtitle("Prediction of MPG based on Engine Cylinder Count and Weight\n") +
                        theme_bw()
                print(graph_1)
        })
})