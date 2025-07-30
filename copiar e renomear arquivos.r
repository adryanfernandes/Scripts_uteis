df <- data.frame(arquivos = c("11458.docx", "22345.docx", "34567.docx"))
pasta_origem <- "C:/meus_arquivos/origem"
pasta_destino <- "C:/meus_arquivos/destino"
# Garante que o diretório de destino existe

# Cria a pasta de destino, se não existir
if (!dir.exists(pasta_destino)) {
  dir.create(pasta_destino, recursive = TRUE)
}

# Caminhos de origem e destino com renomeação
caminhos_origem <- file.path(pasta_origem, df$nome_arquivo_original)
caminhos_destino <- file.path(pasta_destino, df$novo_nome)

# Copia e renomeia
resultado <- file.copy(from = caminhos_origem, to = caminhos_destino, overwrite = TRUE)

# Verifica se houve algum erro
df$resultado_copia <- resultado
