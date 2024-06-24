# Instalação Docker, Laravel 11 Nginx e Mysql
- **Autor:** Matheus Alfaia
- **Requer:** Ubuntu ou Debian da loja de aplicativos do Windows
- **Terminal:** WSL2
- **Docker** Docker ou Docker Desktop
```bash
$ git clone https://github.com/MattheusAlfaia/docker-laravel
$ cd docker-laravel
```

## Criar imagem
```bash
docker compose up -d
```

## Configurar as permissão usuário
```bash
chown -R user:user /home/nome_dir/codes/docker-laravel/
```

## Acessar o container (Não obrigatório)
Usar apenas se quiser rodar comandos PHP, Composer, Artisan, Npm, etc.
Acessa o container, o "app" é o nome do container e o "bash" é o comando para acessar o terminal
```bash
docker exec -it app bash
```

## Instalar dependências
```bash
docker compose exec app composer install
```

## Criar arquivo .env
```bash
docker compose exec app cp .env.example .env
```

## Criar Chave do Laravel
```bash
docker compose exec app php artisan key:generate
```

## Inserir no .env as informações do banco de dados
```bash
DB_CONNECTION=mysql
DB_HOST="Nome do Container"
DB_PORT=3306
DB_DATABASE="Nome do Banco"
DB_USERNAME=root
DB_PASSWORD=root
```

## Criar Banco de Dados
```bash
docker compose exec app php artisan migrate
```

## Configurar as permissões
```bash
docker compose exec app chown -R www-data:www-data /var/www/storage
```

## Npm install(Não obrigatório)
```bash
docker compose exec app npm install
```

## Laravel Sail (Não obrigatório)
```bash
./vendor/bin/sail up
```
