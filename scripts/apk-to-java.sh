#!/bin/bash

filename=$(basename $1)
filename=${filename%.*}

original=$(readlink -f $1)

echo "filename=$filename"
echo "original=$original"

mkdir -p $filename/apk
mkdir -p $filename/class

pushd $filename/apk

unzip $original
$DEX2JAR classes.dex

cd ..

$JDCMD apk/classes_dex2jar.jar -od java

popd

