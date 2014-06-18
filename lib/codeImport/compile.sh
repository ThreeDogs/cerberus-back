# 1 - home path
# 2 - apk path
# 3 - java file path
# 4 - scenario path
# 5 - save path

chmod 777 $1
chmod 777 $1/temp2
chmod 777 $1/temp3

mkdir $5

# jar 추출
rm -r $1/temp2
mkdir $1/temp2
rm -r $1/temp3
mkdir $1/temp3
sudo $1/dex2jar-0.0.9.15/d2j-dex2jar.sh -f -o $1/temp2/libo.jar $2

# compile java

cd $1/temp2

echo $3

#javac -d $3/temp2 -cp $1/temp2/libo.jar
javac -encoding UTF8 -d $1/temp2 -cp $1/temp2/libo.jar:$1/android-support-v4.jar:$1/android.jar:$1/robotium-solo-5.1.jar:$1/lib3.jar $3
# class 변환

java -classpath $1/asm-all-4.2.jar:$1/gson-2.2.4.jar:$1/codeimport.jar upload.code.cerberus.JavaCompileInfo $1/temp2/org/cerberus/test $4 $1/temp3

cd $1/temp3

$1/jad158g.mac.intel/jad -o -sjava *

#echo $5

echo javac -encoding UTF8 -d $5 -cp $1/temp2/libo.jar:$1/android-support-v4.jar:$1/android.jar:$1/robotium-solo-5.1.jar CerberusRunner_$4.class

javac -d $5 -cp $1/temp2/libo.jar:$1/android-support-v4.jar:$1/android.jar:$1/robotium-solo-5.1.jar:$1/lib3.jar CerberusRunner_$4.java

cp $5/org/cerberus/test/CerberusRunner_$4.class $5/CerberusRunner_$4.class

rm -r $5/org/

echo ~~$5/CerberusRunner_$4.class~~