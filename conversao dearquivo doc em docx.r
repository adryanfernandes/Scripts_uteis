#codigo para converter arquivos .doc em .docx
#inicio do scritp
pasta <- "C:/pendrive-30062025/dados de extremos-atos/teste_words" #pasta dos arquivos
libreoffice <- "C:/Program Files/LibreOffice/program/soffice.exe" #executor do libreoffice
arquivos_doc <- list.files(pasta, pattern = "\\.doc$", full.names = TRUE) #localizando todos os .doc da pasta
if (!requireNamespace("progress", quietly = TRUE)) install.packages("progress") #verificar bibliotecas para barra de progresso
library(progress) #biblioteca da barra de progresso
pb <- progress_bar$new( #estruturando mensagem de barra de progresso
  format = "Convertendo [:bar] :percent | Arquivo :current de :total | :file",
  total = length(arquivos_doc), clear = FALSE, width = 80)
for (i in seq_along(arquivos_doc)) { #processo de conversão
  arquivo <- arquivos_doc[i]
  nome_base <- tools::file_path_sans_ext(basename(arquivo))
  destino_docx <- file.path(pasta, paste0(nome_base, ".docx"))
  pb$tick(tokens = list(file = basename(arquivo)))
  if (!file.exists(destino_docx)) { #verifica se arquivo já foi processado anteriormente
    system(paste0('"', libreoffice, '" --headless --convert-to docx "', arquivo, '" --outdir "', pasta, '"'))
  }
}
#fim do script
