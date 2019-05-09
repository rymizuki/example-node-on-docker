# example-node-on-docker

npm install benchmark

- local
- docker with mounted volume
- docker without mounted volume

# usage

## local

```console
> ndenv install $(cat .node-version)
> npm install
> time /bin/bash -c 'rm -rf node_modules/* && npm install'
```

## docker with mounted volume

```console
> docker-compose build
> docker-compose -f docker-compose.mounted.yml run --rm node bash
> time -p /bin/bash -c 'rm -rf node_modules/* && npm install'
```

## docker without mounted volume

```console
> docker-compose build
> docker-compose -f docker-compose.yml run --rm node bash
> time -p /bin/bash -c 'rm -rf node_modules/* && npm install'
```

# why not use npm ci?

When mounting node_modules as data volume, the directory is locked. As a result, when npm ci tries to delete node_modules, an error occurs...

```console
> docker-compose -f docker-compose.yml run --rm node npm ci
npm WARN prepare removing existing node_modules/ before installation
npm ERR! path /app/node_modules
npm ERR! code EBUSY
npm ERR! errno -16
npm ERR! syscall rmdir
npm ERR! EBUSY: resource busy or locked, rmdir '/app/node_modules'

npm ERR! A complete log of this run can be found in:
npm ERR!     /root/.npm/_logs/2019-05-09T13_50_14_560Z-debug.log
```
