FROM ruby:2.7.1

# Update the package lists before installing.
RUN apt-get update -qq

# This installs
# * build-essential because Nokogiri requires gcc
# * common CA certs
# * netcat to test the database port
# * two different text editors (emacs and vim) for emergencies
# * the mysql CLI and client library
RUN apt-get install -y \
    build-essential \
    ca-certificates \
    netcat-traditional \
    vim \
    default-mysql-client \
    default-libmysqlclient-dev

# Install node from nodesource
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
  && apt-get install -y nodejs

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y yarn

# Create a directory called `/workdir` and make that the working directory
ENV APP_HOME /app
RUN mkdir ${APP_HOME}
WORKDIR ${APP_HOME}

# Copy the Gemfile
COPY Gemfile ${APP_HOME}/Gemfile
COPY Gemfile.lock ${APP_HOME}/Gemfile.lock

# Make sure we are running bundler version 2.0
RUN gem install bundler -v 2.1.4
RUN bundle install

# Copy the project over
COPY . ${APP_HOME}

ENTRYPOINT ["sh", "./entrypoint.sh"]
