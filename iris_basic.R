
### Attach data

attach(iris)

### Call library
library(ggplot2)
library(dplyr)
library(tidyverse)
library(ggridges)
library(Hmisc)
library(corrplot)
library(RColorBrewer)

# Understanding data

head(iris)
str(iris)

## Summary
summary(iris)

## Exploratory data analysis
### histogram
ggplot(iris, aes(iris$Sepal.Length)) + geom_histogram(col= "red", bins = 30) +
  labs(title = "Sepal length histogram", x= "Sepal length")

ggplot(iris, aes(iris$Sepal.Width)) + geom_histogram(col ="red", bins = 30) +
  labs(title = "Sepam width histogram", x = "Sepal Width")


ggplot(iris, aes(iris$Petal.Length)) + geom_histogram(col = "blue", bins = 30) +
  labs(title = "Petal length histogram", x= "Petal length")
ggplot(iris, aes(iris$Petal.Width)) + geom_histogram(col ="blue", bins = 30) +
  labs(title = "Petal width histogram", x = "Petal width")

### Plot
ggplot(iris, aes(x=iris$Sepal.Length, fill = Species)) + geom_histogram(position ="identity" ,bins = 30)

iris$Species <- as.factor(iris$Species)

ggplot(iris, aes(x = iris$Sepal.Length, y = Species, fill = Species)) + geom_density_ridges(aes(point_color = Species, point_fill = Species,  point_shape = Species),
                                                                                            alpha = .2, point_alpha = 1, jittered_points = TRUE
) +
  scale_point_color_hue(l = 40) +
  scale_discrete_manual(aesthetics = "point_shape", values = c(21, 22, 23))

ggplot(iris, aes(x = iris$Sepal.Width, y = Species)) +
  geom_density_ridges(
    aes(y = Species, point_shape = Species, point_fill = Species), 
    alpha = .2, point_alpha = 1, jittered_points = T) +
  scale_point_color_hue(l = 40) + scale_point_size_continuous(range = c(0.5, 4)) +
  scale_discrete_manual(aesthetics = "point_shape", values = c(21, 22, 23))
ggplot(iris, aes(x = iris$Petal.Length, y = Species, fill = Species)) +
  geom_density_ridges(
    aes(point_shape = Species, point_fill = Species, point_size = Petal.Length), 
    alpha = .2, point_alpha = 1, jittered_points = TRUE
  ) +
  scale_point_color_hue(l = 40) + scale_point_size_continuous(range = c(0.5, 4)) +
  scale_discrete_manual(aesthetics = "point_shape", values = c(21, 22, 23))
ggplot(iris, aes(x = iris$Petal.Width, y = Species, fill = Species)) +
  geom_density_ridges(
    aes(point_shape = Species, point_fill = Species, point_size = Petal.Width), 
    alpha = .2, point_alpha = 1, jittered_points = TRUE
  ) +
  scale_point_color_hue(l = 40) + scale_point_size_continuous(range = c(0.5, 4)) +
  scale_discrete_manual(aesthetics = "point_shape", values = c(21, 22, 23))

### Scatterplot
ggplot(iris, aes(iris$Sepal.Length, Sepal.Width, shape = Species)) + geom_point(aes(col = Species), size = 5) + xlab("Sepal.Length") + ylab("Sepal.Width") 
ggplot(iris, aes(iris$Petal.Length, Petal.Width, shape = Species)) + geom_point(aes(col = Species), size = 4) + xlab("Petal.Length") + ylab("Petal.Width") 

ggplot(iris, aes(iris$Sepal.Length, Petal.Length, shape = Species)) + geom_point(aes(col = Species), size = 4) + xlab("Sepal.Length") + ylab("Petal.Length") 

ggplot(iris, aes(iris$Sepal.Width, Petal.Width, shape = Species)) + geom_point(aes(col = Species), size= 4) + xlab("Sepal.Width") + ylab("Petal.Width") 

### Correlation
corr.table <- cor(iris[, 1:4])

corr.table

corrplot(corr.table)

# Classification
## label encoding
iris$Species <- as.factor(iris$Species)

iris$Species <- as.numeric(iris$Species)

## Model building
describe(iris)
