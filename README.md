# example-node-ondocker

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

## docker with mounted volume

```console
> docker-compose build
> docker-compose -f docker-compose.yml run --rm node bash
> time -p /bin/bash -c 'rm -rf node_modules/* && npm install'
```


