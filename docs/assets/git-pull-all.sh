#!/bin/bash
for dir in ./*/
do
    dir=${dir%*/}
    echo ${dir##*/}
    cd ${dir}
    git pull
    cd -
done
