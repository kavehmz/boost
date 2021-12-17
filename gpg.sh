echo  "$@" > /tmp/in
docker run --name gpg -v ~/.gnupg:/root/.gnupg -i opt gpg "$@" > /tmp/out
