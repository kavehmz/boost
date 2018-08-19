# Usage

```bash
docker build -t dropbox .
docker run -d --dns=1.1.1.1 --rm --name dropbox -v /opt/dropbox:/home/kaveh dropbox
```