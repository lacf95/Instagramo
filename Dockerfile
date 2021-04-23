FROM ruby:2.7.2-alpine

RUN apk update; \
    apk add --no-cache --virtual .build-deps \
      build-base \
      linux-headers \
      neovim \
      git \
      tzdata \
      postgresql-dev \
      postgresql-client \
      bash \
      yarn \
      less \
      imagemagick \
      chromium \
      chromium-chromedriver

ARG U_NAME=docker
ARG U_UID=1000
ARG U_GID=1000

RUN addgroup \
      --system \
      --gid $U_GID \
      $U_NAME

RUN adduser \
      --disabled-password \
      --system \
      --gecos "" \
      --ingroup $U_NAME \
      --uid $U_UID \
      $U_NAME

RUN gem update --system

USER ${U_UID}:${U_GID}

ENV EDITOR nvim

ENV HOME_PATH /home/$U_NAME

ENV BUNDLE_PATH $HOME_PATH/ruby_gems
ENV GEM_PATH $BUNDLE_PATH
ENV GEM_HOME $BUNDLE_PATH

ENV PATH $GEM_HOME/bin:$GEM_HOME/ruby/2.7.0/bin:$PATH

ENV APP_PATH $HOME_PATH/app

COPY --chown=$U_UID:$U_GID . $APP_PATH

WORKDIR $APP_PATH

RUN gem install bundler:2.2.16
RUN git config --global http.sslVerify false

RUN bundle install \
      --jobs `expr $(cat /proc/cpuinfo | grep -c "cpu cores") - 1` \
      --retry 3

RUN yarn install --check-files

EXPOSE 3000:3000

CMD ['bundle', 'exec', 'rails', 'server', '-b', '0.0.0.0', '-p', '3000']
