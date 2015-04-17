# docker-git

This repository holds a Dockerfile (to create a Docker image) to clone a Git
repository and make a checkout. That's it.

Typical usage (assuming the image is built as `noteed/git`):

    > docker run \
        -v /tmp/github-deploy-ssh:/home/worker/.ssh \
        -v /tmp/gits:/home/worker/gits \
        -v /tmp/checkout:/home/worker/checkout \
        noteed/git \
          /home/worker/checkout.sh \
          git@github.com:username/project.git project.git develop

The host directory `/tmp/github-deploy-ssh` is supposed to contain a private
`id_rsa` key and a `known_hosts` file. This could be your home `.ssh`
directory.

The host directory `/tmp/gits` is optional and can be used if you want to
retain (possibly as a cache) already cloned repositories.

The host directory `/tmp/checkout/` is where you want a working copy to be
done.

The last three arguments are used to name the repository to be cloned, the
local repository name to create, and the branch to check out.
