FROM ruby:2.5-slim-stretch
LABEL maintainer="david@wessman.co"

ADD https://dl.yarnpkg.com/debian/pubkey.gpg /tmp/yarn-pubkey.gpg
ADD https://deb.nodesource.com/setup_10.x /tmp/node-setup
RUN apt-get update && apt-get install -y gnupg2 && \
    apt-key add /tmp/yarn-pubkey.gpg && rm /tmp/yarn-pubkey.gpg && \
    echo "deb http://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list && \
    bash /tmp/node-setup && rm /tmp/node-setup && \
    apt-get update && apt-get upgrade -y && \
    apt-get install -y build-essential nodejs libpq-dev yarn && \
    apt-get remove -y gnupg2 && \
    mkdir -p /home/user/development

WORKDIR /home/user/development
COPY Gemfile Gemfile.lock ./
COPY entrypoint.sh /home/user/entrypoint.sh
RUN gem install bundler && bundle install --jobs 20 --retry 5
ENTRYPOINT ["/home/user/entrypoint.sh"]
CMD ["bundle", "exec", "rails", "s"]
