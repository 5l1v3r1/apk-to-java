#!/bin/bash

if [ -z $APK2JAVA_HOME ]
then
  echo "Needs to source apk-to-java.rc"
  exit
fi

filename=$(basename $1)
filename=${filename%.*}

original=$(readlink -f $1)

echo "filename=$filename"
echo "original=$original"

mkdir -p $filename/apk
mkdir -p $filename/class

pushd $filename/apk

unzip $original
$APK2JAVA_HOME/dex2jar/dex2jar.sh classes.dex

cd ..

java -jar $APK2JAVA_HOME/jd-cmd/jd-cli/target/jd-cli.jar apk/classes_dex2jar.jar -od java

popd

