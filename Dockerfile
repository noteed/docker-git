# Clone a Git repository.
#
# See https://github.com/noteed/docker-git.

from ubuntu
maintainer Vo Minh Thu <noteed@gmail.com>

run apt-get update
run apt-get install -q -y language-pack-en
run update-locale LANG=en_US.UTF-8

run apt-get install -q -y git

run useradd -s /bin/bash -m worker

add run /home/worker/run

user worker
env HOME /home/worker
env LANG en_US.UTF-8
workdir /home/worker

entrypoint ["/home/worker/run"]
