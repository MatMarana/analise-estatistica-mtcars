library(ggplot2)
library(dplyr)
library(readr)
library(ggpubr)
library(e1071)

dados <- read_csv("mtcars.csv")

x <- dados$wt
y <- dados$mpg

cat("===== Estatísticas de x (wt) =====\n")
cat("Média:", mean(x), "\n")
cat("Variância:", var(x), "\n")
cat("Desvio padrão:", sd(x), "\n")
cat("Mediana:", median(x), "\n\n")

cat("===== Estatísticas de y (mpg) =====\n")
cat("Média:", mean(y), "\n")
cat("Variância:", var(y), "\n")
cat("Desvio padrão:", sd(y), "\n")
cat("Mediana:", median(y), "\n")

windows()

par(mfrow = c(1, 2))
hist(x, main="Histograma de WT", col="skyblue", xlab="Peso")
hist(y, main="Histograma de MPG", col="salmon", xlab="Milhas por Galão")

windows()

par(mfrow = c(1,2))
boxplot(x, main="Boxplot de WT", col="skyblue", horizontal=TRUE)
boxplot(y, main="Boxplot de MPG", col="salmon", horizontal=TRUE)

correlacao <- cor(x, y)
cat("\nCoeficiente de Correlação entre wt e mpg:", correlacao, "\n")

cat("\nTeste de Normalidade (Shapiro-Wilk):\n")
cat("wt:")
print(shapiro.test(x))
cat("mpg:")
print(shapiro.test(y))

windows()

print(
ggplot(dados, aes(x = wt)) +
  geom_histogram(aes(y = ..density..), fill = "skyblue", color = "black", bins = 10) +
  geom_density(color = "darkblue", size = 1.2) +
  ggtitle("Densidade + Histograma de WT") +
  theme_minimal()
)

windows()

print(
ggplot(dados, aes(x = mpg)) +
  geom_histogram(aes(y = ..density..), fill = "salmon", color = "black", bins = 10) +
  geom_density(color = "darkred", size = 1.2) +
  ggtitle("Densidade + Histograma de MPG") +
  theme_minimal()
)