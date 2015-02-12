#!/bin/bash

echo $0

if [ -z $APK2JAVA_HOME ]
then
  echo "Needs to source apk-to-java.rc"
  exit
fi

filename=$(basename $1)
filename=${filename%.*}

original=$(readlink -f $1)

mkdir -p $filename
cd $filename

  java -jar $APK2JAVA_HOME/apktool_2.0.0rc3.jar decode -s $original -o apk &> apktool.log

  if [ -e apk/classes.dex ]
  then
    cd apk
      $APK2JAVA_HOME/dex2jar/d2j-dex2jar.sh classes.dex &> ../dex2jar.log
    cd ..

    if [ -e apk/classes-dex2jar.jar ]
    then
#     java -jar $APK2JAVA_HOME/jd-cmd/jd-cli/target/jd-cli.jar apk/classes-dex2jar.jar -od java &> jd.log
#     java -jar $APK2JAVA_HOME/jd-core-java/build/libs/jd-core-java-1.2.jar apk/classes-dex2jar.jar java &> jd.log
#     java -jar $APK2JAVA_HOME/cfr_0_96.jar apk/classes-dex2jar.jar --outputdir java &> jd.log
#     python $APK2JAVA_HOME/Krakatau/decompile.py  -path /media/ssd/projects/drafts/android-workspace/sdk/platforms/android-19/android.jar -out java apk/classes-dex2jar.jar &> jd.log
      mkdir -p java ; java -jar $APK2JAVA_HOME/fernflower/fernflower.jar apk/classes-dex2jar.jar java &> jd.log
      if [ $? -ne 0 ]
      then
        echo "Failure" >> jd.log
      fi
    fi
  fi
cd ..

