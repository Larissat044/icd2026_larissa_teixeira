# Arquivo: 07-analise-exploratoria-numerica.R
# Autor(a): Larissa Teixeira de Almeida
# Data: 15/06/2026
# Objetivos:
# 1. Carregar e inspecionar os dados de marketing
# 2. Calcular estatísticas amostrais de centro, posição e variabilidade
# 3. Interpretar a receita semanal com base nos dados observados

# 0. Pacotes e opções globais --------------------------------------------

# Opções de exibição numérica
options(digits = 5, scipen = 999)

# Pacotes usados nesta aula
library(here)
library(tidyverse)


# 1. CARREGAMENTO DOS DADOS -----------------------------------------------

#caminho dos dados limpos
caminho_dados <- here("dados/limpos/dados_marketing_limpos.rds")

#leitura dos dados marketing
dados_marketing <- read_rds(caminho_dados)

#estrutura dos dados carregados 
glimpse(dados_marketing)


# 2. INSPEÇÃO INICIAL -----------------------------------------------------

#dimensão da base
dim(dados_marketing)

#nome das variáveis 
names(dados_marketing)

#primeiras linhas da base
head(dados_marketing)

#contagem de semanas por status de promoção 
dados_marketing |>
  count(status_promocao)

# 3. VALORES TÍPICOS DA RECEITA -------------------------------------------
#Resumo com as medidas amostrais de centro
estatisticas_centro <- dados_marketing |>
  summarize(
    #media amostral
    media = mean (receita_vendas),
    
    #mediana amostral 
    mediana = median (receita_vendas)
  )

#exibe o resumo calculado
estatisticas_centro
    
# 4. RESUMO RAPIDO DA RECEITA ---------------------------------------------

#Extrai a coluna receita_vendas como um vetor
receita <- dados_marketing |>
  pull (receita_vendas) 

#Resumo amostral básico
summary(receita)

df <-
  dados_marketing |>
  mutate(promocao=factor(status_promocao)) |>

#para variavel discreta 
  summary(df$promocao)


# 5. QUANTIS DA RECEITA ---------------------------------------------------


#Quantis amostrais selecionados 
quantis_receita <- dados_marketing |>
  summarize(
    #minimo amostral e percentil 5
    p0 = quantile (receita_vendas, 0),
    p5 = quantile (receita_vendas, 0.05),
    
    #Quartis amostrais
    q1= quantile (receita_vendas, 0.25),
    mediana = quantile (receita_vendas, 0.50),
    q3 = quantile (receita_vendas, 0.75),
    
    #Percentil 95 e máximo amostral
    p95 = quantile (receita_vendas, 0.95),
    p100 = quantile (receita_vendas, 1 )
  )

#Exibe os quantis calculados 
quantis_receita