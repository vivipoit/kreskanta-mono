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

## Useful links
- WTF is MVC?
  - [MVC pattern on Wikipedia](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller)
  - [MVC pattern on Google Images Search](https://www.google.com/search?q=mvc&sxsrf=APq-WBtN-wHOJ18lt1jd1OQ9eVTF7FFb6w:1646403077683&source=lnms&tbm=isch&sa=X&ved=2ahUKEwio_-e00az2AhUFgv0HHRk_Ai8Q_AUoAXoECAEQAw&biw=1920&bih=944&dpr=1)
- How do I make Rails magic?
  - [Rails Guides](https://guides.rubyonrails.org/)
  - [Rails API Docs](https://api.rubyonrails.org/)
- [Bootstrap](https://getbootstrap.com/docs/5.1/getting-started/introduction/) - Framework used on project.
- [Atom](https://atom.io/) - A decent text editor for writting code. Other possibilities could be Sublime, Vim, etc.
- [Sourcetree](https://www.sourcetreeapp.com/) - Sometimes it's useful to have a visual of the git repository.
- [iTerm](https://iterm2.com/) - Often preferred over Apple's native terminal.
