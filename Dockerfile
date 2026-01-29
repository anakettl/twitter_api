# Use a versão do Ruby do seu projeto
FROM ruby:3.2.2

# Instala dependências (incluindo libpq-dev para o Postgres)
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Define o diretório de trabalho
WORKDIR /rails_app

# Copia o Gemfile e instala as gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copia o restante do código
COPY . .

# Script para resolver o problema do server.pid do Rails
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

# Comando para iniciar o servidor
CMD ["rails", "server", "-b", "0.0.0.0"]
