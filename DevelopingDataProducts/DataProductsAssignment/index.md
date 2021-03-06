---
title       : MPG Predictor Application
subtitle    : Developing Data Products Assignment
author      : Alvin Goh
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## MPG Predictor Application

- An application is built to estimate miles per gallon.
- This is done using vehicle weight and number of cylinders.
- The application is interactive and updates based on user's inputs (via slider).

---

## Data used for Application

The `mtcars` dataset is used to create a regression model that estimates miles per gallon based on vehicle weight and number of cylinders.

- Variable mpg is miles per gallon of vehicle.
- Variable wt is weight of vehicle in thousands of pounds.
- Variable cyl is the number of cylinders in vehicles engine.

---

## Application is Based on This Model
 

```r
model <- lm(mpg ~ wt + cyl, data = mtcars)
```

Here are the results of the model


```
## $coefficients
##              Estimate Std. Error   t value     Pr(>|t|)
## (Intercept) 39.686261  1.7149840 23.140893 3.043182e-20
## wt          -3.190972  0.7569065 -4.215808 2.220200e-04
## cyl         -1.507795  0.4146883 -3.635972 1.064282e-03
```

```
## $r.squared
## [1] 0.8302274
```

---

## Application Demonstration

To see the interactive Shiny application, click on the below URL:
 
http://alvinaloy.shinyapps.io/DevelopingDataProducts/

