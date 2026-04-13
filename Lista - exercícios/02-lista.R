# Arquivo: 02-lista.R
# Autor(a): Larissa 
# Data: 06/04/2026
# Objetivo:
# 1. Resolver os exercícios da lista 2


# Configurações globais ---------------------------------------------------

# Configura o número de dígitos a serem exibidos
options(digits = 5, scipen = 999)

# carrega os pacotes necessários

# Exercicio 1 -------------------------------------------------------------


## a)
library(here)
library(tidyverse)
library(janitor)



## b)
# define o caminho relativo do arquivo de dados
caminho_csv <- here("dados/brutos/dados-marketing.csv")

# importa o arquivo usando a função read_csv do pacote readr
dados_marketing <- read_csv(caminho_csv)


## c)
# exibe uma visão compacta do objeto
glimpse(dados_marketing)



# Exercicio 2 -------------------------------------------------------------

## a)o que cada linha (observação) do arquivo representa?

#Cada linha do arquivo representa uma semana de observação.

## b)
#156 observações e 9 variáveis

# Exercicio 3 -------------------------------------------------------------

## a)
# padroniza os nomes das colunas e cria um novo objeto
dados_marketing_limpos <- dados_marketing |>
  clean_names()

## b)
  names(dados_marketing_limpos)
  view(dados_marketing_limpos)


# Exercicio 4 -------------------------------------------------------------

#seleciona apenas as data,mes,gasto_tv,gasto_radio,promocao,receita_vendas
dados_marketing_limpos |>
select(data,mes,gasto_tv,gasto_radio,promocao,receita_vendas) 

# Exercicio 5 -------------------------------------------------------------

#cria a variável gasto total
dados_marketing_limpos |> 
mutate(gasto_total = gasto_tv + gasto_radio + gasto_redes_sociais + gasto_email)
  
  # mostra as colunas solicitadas
  dados_marketing_limpos |>
    select(data, mes, gasto_total, receita_vendas)
  
  # visualiza o objeto no RStudio
  View(dados_marketing_limpos)
  
  
  # Exercicio 6 -------------------------------------------------------------
  
  # cria duas novas variaveis com nomes mais descritivos
  dados_marketing_limpos <- dados_marketing_limpos |>
    mutate(
      status_promocao = ifelse(promocao == 1, "Com promoção", "Sem promoção"),
      status_concorrencia = ifelse(
        atividade_concorrente == 1,
        "Com concorrência",
        "Sem concorrência"
      )
    )
  
  # mostra as novas variaveis
  dados_marketing_limpos |>
    select(promocao, status_promocao, atividade_concorrente, status_concorrencia)
  
  # visualiza o objeto no RStudio
  View(dados_marketing_limpos)
  
  
  # Exercicio 7 -------------------------------------------------------------
  
  # define o caminho relativo para salvar o arquivo rds
  caminho_rds <- here("dados/limpos/dados_marketing_limpos.rds")
  
  # salva os dados limpos no formato rds
  write_rds(dados_marketing_limpos, caminho_rds)
  
  # visualiza a base de dados no RStudio
  View(dados_marketing_limpos)
  
  
  # Exercicio 8 -------------------------------------------------------------
  
  # filtra semanas com promocao e receita maior que 1000
  dados_marketing_limpos |>
    filter(promocao == 1 & receita_vendas > 1000) |>
    select(data, mes, receita_vendas, status_promocao)
  
  
  # Exercicio 9 -------------------------------------------------------------
  
  # cria um objeto com o resumo dos dados por mês
  resumo_mensal <- dados_marketing_limpos |>
    group_by(mes) |>
    summarise(
      receita_media = mean(receita_vendas),
      receita_total = sum(receita_vendas),
      gasto_total_medio = mean(gasto_total),
      semanas_com_promocao = sum(promocao)
    ) |>
    arrange(desc(receita_media))
  
  # mostra o resultado ordenado
  resumo_mensal
  
  # visualiza o resultado no RStudio
  View(resumo_mensal)
  
  # os tres meses com maior receita media sao:
  # mes 12, mes 11 e mes 10
