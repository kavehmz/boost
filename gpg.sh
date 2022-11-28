SDIR=$(dirname -- "${BASH_SOURCE[0]}")
docker image inspect opt &> /dev/null || docker build -t opt -f  $SDIR/dockerize/Dockerfile .
docker run --rm --name gpg -v /var/folders/p2:/var/folders/p2 -v ~/.gnupg:/root/.gnupg -i opt gpg "$@" > /dev/null