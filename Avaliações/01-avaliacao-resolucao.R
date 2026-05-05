# Arquivo: 01-avaliacao-resolucao.R
# Integrante 1: nome
# Integrante 2: nome
# Integrante 3: nome
# Integrante 4: nome
# Data: 28/04/2026
# Objetivo: Resolução da Avaliação 1 — Introdução à Ciência de Dados


# Configurações globais -----------------------------------------------

options(digits = 5, scipen = 999)

# carrega os pacotes usados (Exercício 1)
library(tidyverse)
library(here)
library(janitor)


# Exercício 1 -----------------------------------------------------------


# Aquisição dos dados ----------------------------------------------------

# importa o arquivo com a função read_csv:
caminho_agencias <- here("dados/brutos/agencias.csv")

# importa o arquivo agencias com a função read_csv:
agencias <- read_csv(caminho_agencias)

# inspeciona a estrutura do objeto
glimpse(agencias)

# define o caminho relativo do arquivo usando a função here():
caminho_credito <- here("dados/brutos/dados_credito.csv")
  
# importa o arquivo com a função read_csv:
dados_credito <- read_csv(caminho_credito)
  
# inspeciona a estrutura do objeto
glimpse(credito_trimestral)
  
  
  # Exercício 2 ----------------------------------------------------------

# 2.a)
##filtra as agências cujo tipo_agencia seja "Plena"
dados_agencias_plenas |> dados_agencias_limpos
  filter(tipo_agencia == "Plena")


#exibe o resultado
dados_agencias_plenas


# 2.b)


# 2.c)



# Exercício 3 ---------------------------------------------------------

# 3.a) pivot_longer

# reorganiza os dados de crédito em trimestre e volume_credito
dados_credito_longo <- 
  
  # 3.b) left_join
  
  # combina `dados_credito_longo`com `dados_agencias`
  dados_completos <-
  
  
  
  # Exercício 4 ---------------------------------------------------------

# cria dados_analise com credito_por_cooperado
dados_analise <- 
  
  # resume por cidade e ordena por volume_total
  dados_analise |>
  
  
  # Resposta do Exercício 4:
  
  # Cidade com maior volume_total:
  # Cidade com maior media_dos_creditos_por_cooperado:
  
  
  
  # Exercício 5 ---------------------------------------------------------

# classifica nivel_credito e resume por tipo_agencia
resumo_por_tipo <- 