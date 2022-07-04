#!/bin/bash

mkdir repositorios-git
cd repositorios-git
echo "Digite nome do usuário GitHub"
read nome

apt install git -y && apt install curl -y

repos=$(curl -s https://api.github.com/users/$nome/repos | awk '/clone_url/{print $2}' | sed 's/^"//g' | sed 's/",$//g')

for repos in $repos
do
    git clone $repos
done
