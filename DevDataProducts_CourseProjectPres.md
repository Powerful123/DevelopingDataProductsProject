DevDataProducts_CourseProjectPres
========================================================
author: Coursera Data Student Presentation
date: Jan 25th 2015

Overview of my Shiny App
========================================================

This App leverages the Galton data set which includes child and parent heights to predict a child height based on user provided parent height using the linear regression model fit algorithm

 Link to the app:  https://powerful123.shinyapps.io/DevDataProject/
 
Topics Covered

- About the Galton data set
- Galton Data Analysis
- Prediction model
- Shiny App usage 



About the Galton data set
========================================================

Galton Data Analaysis using linear Regression and Scatter plot:
 
<small>The Galton data is based on the famous 1885 study of Francis Galton exploring the relationship between the heights of children and the height of their parents. The variables are the height of the adult child and the midparent height, defined as the average of the height of the father and 1.08 times the height of the mother. The units are inches. The number of cases is 928, representing 928 children and their 205 parents. 
Source: This data was found at http://www.bun.kyoto-u.ac.jp/~suchii/galton86.html.

See also the data.set father.son which was found from http://stat-www.berkeley.edu/users/juliab/141C/pearson.dat.


</small> 

Galton Data Analaysis
========================================================

```
'data.frame':	928 obs. of  2 variables:
 $ child : num  61.7 61.7 61.7 61.7 61.7 62.2 62.2 62.2 62.2 62.2 ...
 $ parent: num  70.5 68.5 65.5 64.5 64 67.5 67.5 67.5 66.5 66.5 ...
```

```
     child          parent    
 Min.   :61.7   Min.   :64.0  
 1st Qu.:66.2   1st Qu.:67.5  
 Median :68.2   Median :68.5  
 Mean   :68.1   Mean   :68.3  
 3rd Qu.:70.2   3rd Qu.:69.5  
 Max.   :73.7   Max.   :73.0  
```

Prediction model 
========================================================
transition: rotate

The linear regression model is used to fit the child vs parent data 
fit <- lm(child ~ parent, data = galton)

And then the predict function is used with this model along  with the parent's height to predict the child's height
predict(fit, newdata = data.frame(parent = c(parent_ht)))

Shiny App Usage 
========================================================
transition: rotate
- Input: In this  app where the user just inputs one parameter - the parent height.
- Processing: The server then uses the prediction model to predict the child height. In this we're using reactive processing on the server based on the user input.
- Output: The child height is finally displayed both in text as well as on a chart.
 
 
 Link:  https://powerful123.shinyapps.io/DevDataProject/
