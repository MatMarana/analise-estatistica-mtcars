# 1. Carregar pacotes necessários
library(dplyr)
library(readr)

# 2. Ler o dataset
dados <- read_csv("mtcars.csv")

# 3. Verificar estrutura básica
str(dados)
summary(dados)
head(dados)

# 4. Verificar valores ausentes
colSums(is.na(dados))  # Contagem de NAs por coluna

# 5. Verificar duplicatas
dados <- dados %>% distinct()

# 7. Renomear colunas para facilitar (opcional)
dados <- dados %>%
  rename(
    modelo = model,
    milhas_por_galao = mpg,
    cilindros = cyl,
    potencia = hp,
    peso = wt
  )

# 8. Criar coluna categorizada (exemplo: carro leve vs pesado)
dados <- dados %>%
  mutate(
    categoria_peso = ifelse(peso < 3, "Leve", "Pesado")
  )

# 9. Verificar resultado final
glimpse(dados)
