FROM ruby:2.4

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -q &&  apt-get -qq install -y \
  # required by our "waitforpg" script
  postgresql-client \
  # required by rails, see https://github.com/rails/execjs
  nodejs nodejs-legacy npm \
  # always clean up after the work is done
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy helper scripts
COPY docker/* /usr/bin/

# Get ready for the app
RUN mkdir -p /app
WORKDIR /app

# Copy Gemfile & Gemfile.lock separately,
# so that Docker will cache the 'bundle install'
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 2

COPY . ./

ENTRYPOINT ["/usr/bin/entrypoint"]
CMD ["bin/rails server"]
