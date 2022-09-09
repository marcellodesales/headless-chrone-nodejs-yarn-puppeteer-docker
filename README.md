# headless-chrone-nodejs-yarn-puppeteer

Dockerized Headless chrome server with nodejs, yarn, puppeteer.

# Build

```console
$ docker-compose build
[+] Building 1.7s (8/8) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                  0.1s
 => => transferring dockerfile: 1.23kB                                                                                                                g
 => [internal] load .dockerignore                                                                                                                     g
 => => transferring context: 2B                                                                                                                       g
 => [internal] load metadata for docker.io/library/node:lts-alpine                                                                                    1.6s
 => [1/4] FROM docker.io/library/node:lts-alpine@sha256:1a9a71ea86aad332aa7740316d4111ee1bd4e890df47d3b5eff3e5bded3b3d10                              g
 => CACHED [2/4] WORKDIR /app                                                                                                                         g
 => CACHED [3/4] RUN apk update && apk add --no-cache nmap &&     echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositorie  g
 => CACHED [4/4] RUN addgroup -S pptruser && adduser -S -G pptruser pptruser     && mkdir -p /home/pptruser/Downloads /app     && chown -R pptruser:  g
 => exporting to image                                                                                                                                g
 => => exporting layers                                                                                                                               g
 => => writing image sha256:03fc19b539b16de1fb813e6a51ae189b2c288900835961b24106060fe9915657                                                          g
 => => naming to docker.io/viasat/headless-chrome-nodejs-puppeteer                                                                                    g

Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them

```

# Reuse

* Just reuse locally

```dockerfile
FROM marcellodesales/headless-chrome-nodejs-puppeteer:0177fde
```
