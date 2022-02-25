# kreskanta-mono

## Docker
https://www.docker.com/

### Verificar instalação
Chamar `docker -v` num terminal qualquer e confirmar que aparece algo do tipo `Docker version 20.10.11, build dea9396`.

### Subir container
`docker-compose run --rm --service-ports web bash`

### Rodar setup
`bin/setup`

### Rodar aplicação
`bundle exec rails server -b 0.0.0.0 -p 3000`

### Abrir no navegador
`localhost:3000`

### Rodar testes
`rspec`

### Acessar o terminal do container enquanto a aplicação está rodando
1. Abrir outra aba ou janela do terminal
2. Rodar `docker ps`
3. Pegar o nome do container em questão, algo como `kreskanta-mono_web_run_5797fbf9754c`
4. Rodar `docker exec -it NOME_DO_CONTAINER bash`

## Bootstrap
https://getbootstrap.com/docs/5.1/getting-started/introduction/
