SDIR=$(dirname -- "${BASH_SOURCE[0]}")
docker image inspect gpg &> /dev/null || docker build -t opt -f  $SDIR/dockerize/Dockerfile .
echo 'docker run --rm --name gpg -v /var/folders/p2:/var/folders/p2 -v ~/.gnupg:/root/.gnupg -i opt gpg '"$@"' > /dev/null'
docker run --rm --name gpg -v /var/folders/p2:/var/folders/p2 -v ~/.gnupg:/root/.gnupg -i opt gpg "$@" > /dev/null