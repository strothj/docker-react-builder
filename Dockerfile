FROM node:8.12.0-jessie

# Install Java for Closure Compiler
RUN echo 'deb http://deb.debian.org/debian jessie-backports main' \
  > /etc/apt/sources.list.d/jessie-backports.list && \
  apt-get update && \
  apt install --target-release jessie-backports \
  openjdk-8-jre-headless \
  ca-certificates-java \
  --assume-yes

RUN git clone https://github.com/facebook/react.git --depth 1
WORKDIR /react
RUN yarn

# Enable experimental Suspense feature
RUN sed -i 's/enableSuspense = false/enableSuspense = true/g' packages/shared/ReactFeatureFlags.js

RUN yarn build dom-client,core,react-cache,schedule --type=NODE
RUN mkdir /dist -p

CMD cp -r build/node_modules/* /dist
