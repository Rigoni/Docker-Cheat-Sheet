# Docker Cheat Sheet

## Listando containers

`docker ps` -> lista todos os containers em execução

`docker ps -a` -> lista todos os containers (mesmo não em execução)

## Rodando imagens/containers

`docker run <image_name>` -> baixa e executa a imagem do container

`docker run <image_name> <command>` -> baixa/executa o container e o comando dentro do container

`docker run -it <image_name> bash` -> baixa/executa e entra no container via ssh (it = iterativo)

`docker run -d <image_name>` -> `-d` = deamon (libera o terminal)

`docker run -d -P <image_name>` -> `-P` = mapeia portas para serem acessadas da máquina local (automaticamente)

`docker run -d -p 3000:80 <image_name>` -> `-p` mapeia portas para serem acessadas da máquina local (manualmente)

`docker run --name` -> da um nome/alias para não precisar usar o ID

`docker run -e VARIABLE=VALUE` -> define uma variável de ambiente com valor (AUTHOR on static-site)

`docker start <id_container>` -> inicia o container

`docker stop <id_container>` -> para o container

`docker stop -t 0 $(docker ps -q)` -> para todos os containers em execução (`-p` é o tempo para parar | `-q` retorna somente IDs)

`docker start <id_container> -a -i` -> inicia o container e entra no ssh


## Removendo containers

`docker rm <id_container>` -> remove container

`docker container prune` -> remove todos os containers que não estão em execução

## Imagens

`docker images` -> lista imagens baixadas

`docker rmi` -> remove imagem baixada

## Volumes:

`docker inspect <id_container>` -> mostra várias infos do container

`docker run -v "local/directory:docker/directory" <imagem>` -> cria um volume do diretório local para o container

`docker run -d -p 8080:3000 -v "$(pwd):/var/www" -w "/var/www" node npm start` ->
^roda em segundo plano (-d) na porta 8080:3000 (-p) criando volume (-v) executando na pasta /var/www (-w) o comando node npm start