This dir will contain the setup of apps I want to run in containers with limited access to system instead of installing them directly.

# build

```bash
docker build -t utils .
```

# run
For each install app:

```bash
# like sensors from lm-sensors
docker run --rm -ti utils sensors
```
