# Dockerfile development version
FROM ruby:2.7.1 AS webstore-development

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y --no-install-recommends nodejs yarn

# Default directory
ENV INSTALL_PATH /opt/app
RUN mkdir -p $INSTALL_PATH

# Install gems
WORKDIR $INSTALL_PATH
COPY webstore/ .
RUN rm -rf node_modules vendor
RUN gem install rails:6.0.3.2 bundler
RUN bundle install
RUN "curl -s https://deb.nodesource.com/setup_16.x | sudo bashcurl -s https://deb.nodesource.com/setup_16.x | sudo bash"
RUN yarn install

# Start server
CMD bundle exec puma