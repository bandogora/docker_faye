FROM ruby:2

RUN apt-get update -qq && apt-get install -y

# Setup path
ENV APP_PATH .

# Create dir
RUN mkdir /faye
WORKDIR /faye

RUN gem install faye private_pub thin
COPY ${APP_PATH}/private_pub.ru /faye/private_pub.ru
COPY ${APP_PATH}/private_pub.yml /faye/private_pub.yml

CMD ["rackup", "private_pub.ru", "-s", "thin", "-E", "production", "-o", "0.0.0.0"]
