## Build

Для сборки Docker образа можно использовать `build-arg` параметры для формирования метаданных по спецификации [OCI image spec annotations](https://github.com/opencontainers/image-spec/blob/master/annotations.md).

```
$ docker build --no-cache --build-arg IMAGE_VERSION="1.0.0" --build-arg IMAGE_CREATE_DATE="`date -u +"%Y-%m-%dT%H:%M:%SZ"`" --build-arg IMAGE_SOURCE_REVISION="`git rev-parse HEAD`" -f Dockerfile -t "hello-k8s:1.0.0" .
```