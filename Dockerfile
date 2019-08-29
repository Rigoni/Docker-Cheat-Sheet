# imagem utilizada como base
FROM ubuntu:latest

# autor da imagem
LABEL author="Rigoni <rigoni@gmail.com"

# adiciona um arquivo dentro da imagem
ADD ./example.txt /var/tmp/

# roda um comando
RUN apt update -y && apt upgrade -y && apt install wget -y

# copia de uma imagem para a outra
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# diretório de trabalho
WORKDIR /var/www/

EXPOSE 80