# Dockerfile development version
# FROM ruby:3.0.3

# # Install yarn
# RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
# RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
# RUN apt-get update && apt-get install -y --no-install-recommends nodejs yarn

# USER postgres

# # Default directory
# ENV INSTALL_PATH /app
# RUN mkdir -p $INSTALL_PATH

# # Install gems
# WORKDIR $INSTALL_PATH
# COPY /app .
# COPY Gemfile .
# RUN gem install rails bundler
# RUN bundle install
# RUN yarn install

# # Start server
# CMD bundle exec rails s
# -----------------------------------
FROM ruby:3.0.3
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client && apt-get install -y --no-install-recommends yarn

WORKDIR /smartflix
COPY . ./
RUN bundle install
RUN yarn install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]