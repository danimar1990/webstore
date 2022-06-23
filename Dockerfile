# Dockerfile development version
FROM ruby:2.7.1 AS webstore-development

# Install dependencies
RUN apt-get update -q && apt-get install -y curl --no-install-recommends nodejs yarn

# Install asdf
ENV HOME=/root
ENV PATH="$HOME/.asdf/bin:$HOME/.asdf/shims:$PATH"
RUN git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf

# Install nodejs
RUN asdf plugin add nodejs
RUN asdf install nodejs 12.22.10
RUN asdf global nodejs 12.22.10

# Install yarn
RUN asdf plugin add yarn
RUN asdf install yarn 1.22.17
RUN asdf global yarn 1.22.17

# Create app directory
ENV INSTALL_PATH /opt/app
RUN mkdir -p $INSTALL_PATH

# Install gems
WORKDIR $INSTALL_PATH
COPY webstore/ .
RUN rm -rf node_modules vendor
RUN gem install rails:6.0.3.2 bundler
RUN bundle install

# Start server
CMD bundle exec puma