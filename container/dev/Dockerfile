FROM node:10.16.0-alpine

# set working directory
WORKDIR /application

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH
RUN yarn install

CMD ["yarn", "start"]