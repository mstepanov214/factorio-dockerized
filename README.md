# factorio-dockerized

Dockerized [Factorio](https://www.factorio.com) server to play with friends.

### Quick Start

Run the server:

```sh
./bin/start.sh --port=34197
```

Modify `data/config/server-settings.json` (username and password/token is required).

Restart factorio container:

```sh
docker restart factorio
```

Check the logs:

```sh
docker logs -f factorio
```

For detailed information visit [docker image page](https://hub.docker.com/r/factoriotools/factorio/).

### Upgrading

Upgrade game version:

```sh
./bin/upgrade.sh
```
