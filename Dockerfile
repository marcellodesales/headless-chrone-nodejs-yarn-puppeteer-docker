#####
##### https://github.com/puppeteer/puppeteer/blob/main/docs/troubleshooting.md#running-on-alpine
#####
FROM node:lts-alpine

WORKDIR /app

# Add required ffmpeg ffprobe or else it doesn't record the video
# https://stackoverflow.com/questions/54981140/cannot-find-ffprobe/54982897#54982897
RUN apk update && apk add --no-cache nmap && \
    echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
    echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories && \
    apk update && \
    apk add --no-cache \
      chromium \
      harfbuzz \
      "freetype>2.8" \
      ttf-freefont \
      ffmpeg \
      nss \
      yarn

# Tell Puppeteer to skip installing Chrome. We'll be using the installed package.
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Puppeteer v13.5.0 works with Chromium 100.
# RUN yarn add puppeteer@14.1.1

# Add user so we don't need --no-sandbox.
RUN addgroup -S pptruser && adduser -S -G pptruser pptruser \
    && mkdir -p /home/pptruser/Downloads /app \
    && chown -R pptruser:pptruser /home/pptruser \
    && chown -R pptruser:pptruser /app

# Run everything after as non-privileged user.
USER pptruser

# Must run with CAP ADD https://docs.docker.com/compose/compose-file/compose-file-v3/#cap_add-cap_drop
