# docker-wakeonlan
Docker image with wakeonlan utility

Simple image with [go-wol](https://github.com/sabhiram/go-wol/) to send magic packets.

Choice of go-wol over the more common [wakeonlan](https://pypi.org/project/wakeonlan/) package is simply to keep the image to its smallest (4M versus 100M+ due to python runtime).

Sending magic packets require `--network host` to work. This container is specially useful within containers that do not (and cannot) have  `--network host` for some reason.

## usage

```
docker run --rm --network host \
           fopina/wakeonlan wake AA:BB:CC:DD:EE:FF
```
