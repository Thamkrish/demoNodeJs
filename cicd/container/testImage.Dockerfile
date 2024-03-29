# Use the production image as base image
ARG FROM=slim

FROM $FROM
RUN pwd
RUN ls

# Copy the test files
# COPY tests tests

# Override the NODE_ENV environment variable to 'dev', in order to get required test packages
ENV NODE_ENV dev

# 1. Get test packages; AND
# 2. Install our test framework - mocha
RUN npm update && \
    npm install -g mocha

# Override the command, to run the test instead of the application
CMD ["mocha", "test/testSce1.js", "--reporter", "spec"]