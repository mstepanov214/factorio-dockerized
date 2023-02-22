# factorio-dockerized

Dockerized [Factorio](https://www.factorio.com) server to play with friends.

### Quick Start

Modify `server-settings.json`: username and password/token is required.

Run the server:

```sh
./bin/start.sh --port=34197
```

Check the logs:

```sh
docker logs -f factorio
```

After further configuration changes, factorio container should be restarted:

```sh
docker restart factorio
```

For detailed information visit [docker image page](https://hub.docker.com/r/factoriotools/factorio/).

### Upgrading

Upgrade game version:

```sh
./bin/upgrade.sh
```
