FROM node as base

# Set workdir and copy files

WORKDIR /usr/src/app
COPY ./fakeproductapp /usr/src/app

# Dependencies

FROM base AS dependencies
RUN npm install mocha chai --save-dev && \
    npm install request --save-dev

# Unit tests to check endpoint health

FROM dependencies as test
COPY . .
RUN npm run test

# Build prod image only if the tests pass

FROM test as prod
RUN npm ci --production
COPY . .

CMD [ "node", "server.js" ]