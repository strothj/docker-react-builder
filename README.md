Just a simple Dockerfile to build React master branch with experimental Suspense support enabled.

# Build Docker container

```shell
$ yarn build
```

# Execute Docker container

```shell
$ docker run -v ${PWD}/dist:/dist react-builder
```

# Collect files from `dist`
