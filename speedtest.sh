#!/bin/bash

# Executa o Speedtest e captura a saída completa
speedtest_output=$(speedtest)

# Captura o valor do Download e a URL do resultado
download=$(echo "$speedtest_output" | grep "Download:" | awk '{print $2, $3}')
result_url=$(echo "$speedtest_output" | grep "Result URL:" | awk '{print $3}')

# Verifica se o teste foi realizado com sucesso e se os valores foram capturados
if [ -z "$download" ] || [ -z "$result_url" ]; then
    echo "Speedtest falhou ou não retornou os valores esperados."
    exit 1
fi

# Define o nome do arquivo com base na data atual
filename="$(date +%d-%m-%Y).txt"

# Salva a data, hora, Download e a URL do resultado no arquivo correspondente
echo "$(date '+%Y-%m-%d %H:%M:%S') - Download: $download - Result URL: $result_url" >> "$filename"

# Mensagem de sucesso
echo "Resultado salvo em $filename"
