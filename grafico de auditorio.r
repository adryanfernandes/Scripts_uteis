
#grafico de auditori kkkk
# Instale se necessário
# install.packages("ggplot2")
# install.packages("dplyr")

library(ggplot2)
library(dplyr)

# Número total de arquivos
n_total <- 20000

# Simulando falhas (exemplo: 10% com erro)
set.seed(123)
status <- sample(c("sucesso", "falha"), size = n_total, replace = TRUE, prob = c(0.99, 0.01))

# Cria o data frame com coordenadas para plotar em grade
df <- data.frame(
  id = 1:n_total,
  status = status
)

# Definir número de colunas (por exemplo: 200 colunas -> 100 linhas)
n_col <- 200
df <- df %>%
  mutate(
    col = (id - 1) %% n_col,
    row = (id - 1) %/% n_col
  )

# Gráfico
ggplot(df, aes(x = col, y = -row, fill = status)) +
  geom_tile(color = "white", size = 0.1) +
  scale_fill_manual(values = c("sucesso" = "darkgreen", "falha" = "red")) +
  coord_fixed() +
  theme_void() +
  labs(title = "Status de Processamento dos Arquivos",
       subtitle = paste0("Total: ", n_total, 
                         " | Sucesso: ", sum(df$status == "sucesso"),
                         " | Falha: ", sum(df$status == "falha"))) +
  theme(
    legend.position = "bottom",
    plot.title = element_text(size = 16, face = "bold"),
    plot.subtitle = element_text(size = 12)
  )
