
> apk-to-java.rc
echo "export APK2JAVA_HOME=`pwd`" >> apk-to-java.rc
echo "alias apk2java=\"`pwd`/scripts/apk-to-java.sh\"" >> apk-to-java.rc
>> apk-to-java.rc

if [ ! -e dex2jar ]
then
  wget https://dex2jar.googlecode.com/files/dex2jar-0.0.9.15.zip
  unzip dex2jar-0.0.9.15.zip
  mv dex2jar-0.0.9.15 dex2jar
  rm dex2jar-0.0.9.15.zip
fi

if [ ! -e apktool_2.0.0rc3.jar ]
then
  wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.0.0rc3.jar
fi

if [ ! -e jd-cmd ]
then
  git clone git://github.com/kwart/jd-cmd.git
  cd jd-cmd
  mvn clean package
  cd ..
fi

