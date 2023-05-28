# Define a imagem base
FROM tiangolo/nginx-rtmp

# Instala as dependências necessárias para a transcodificação de vídeo
RUN apt-get update && apt-get install -y ffmpeg

# Copia o arquivo de configuração do Nginx para habilitar a transcodificação
COPY nginx.conf /etc/nginx/nginx.conf

# Copia o arquivo HTML do player para o diretório raiz do servidor
COPY index.html /usr/share/nginx/html/index.html

# Volume
VOLUME /usr/local/nginx/html

# Define a porta em que o servidor Nginx irá escutar
EXPOSE 80

# Inicia o servidor Nginx
CMD ["nginx", "-g", "daemon off;"]