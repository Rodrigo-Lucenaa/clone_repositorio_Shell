#!/bin/bash

apt install git -y && apt install curl -y

mkdir git-repositories

cd git-repositories
echo "Enter GitHub username"
read username

repos=$(curl -s https://api.github.com/users/$username/repos | awk '/clone_url/{print $2}' | sed 's/^"//g' | sed 's/",$//g')

for repo in $repos
do
    git clone $repo
done
