# factorio-dockerized

## Usage

### Quick Start

Modify `server-settings.json`: username and password/token is required.
Run the server:

```sh
./bin/start.sh
```

Check the logs:

```sh
docker logs -f factorio
```

After further configuration changes, factorio container should be restarted.

### Upgrading

```sh
./bin/start.sh
```
