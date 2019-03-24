# 示例用法

```bash
docker run --rm -v `pwd`:/tmp -w /tmp woodenfish42/base-image:build-go-program sh -c "go get && CGO_ENABLED=0 go build -v -ldflags '-d -s -w' -a -tags netgo -installsuffix netgo -buildmode=exe"
```
