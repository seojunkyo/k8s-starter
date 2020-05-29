Kubernetes Starter Project
==========================

Simple Kubernetes starter template for FastAPI developers.

- `build.sh`: Build docker image.
- `push.sh` : Build & push docker image.
- `debug.sh` : Debug generated docker image with a temporary container.
  - `debug.sh` : Start a temporary container with shell prompt.
  - `debug.sh <command>` : Start a temporary container with the given command`
  - `DB_HOST=<ip or host> DB_TYPE=<default:mysql|pgsql> debug.sh python -m sample.dbtest` 
     : Start a temporary container for db test.
