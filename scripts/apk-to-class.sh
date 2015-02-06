#!/bin/bash

filename=$(basename $1)
filename=${filename%.*}

original=$(readlink -f $1)

mkdir -p $filename/apk
mkdir -p $filename/class

pushd $filename/apk

unzip $original
$DEX2JAR classes.dex

cd ../class

unzip ../apk/classes_dex2jar.jar

popd

