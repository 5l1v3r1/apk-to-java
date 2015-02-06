
> apk-to-java.rc
echo "export DEX2JAR=`pwd`/dex2jar/dex2jar.sh" >> apk-to-java.rc
>> apk-to-java.rc

if [ ! -e dex2jar ]
then
  wget https://dex2jar.googlecode.com/files/dex2jar-0.0.9.15.zip
  unzip dex2jar-0.0.9.15.zip
  mv dex2jar-0.0.9.15 dex2jar
  rm dex2jar-0.0.9.15.zip
fi

