# 1 target apk
# 2 scenario result apk
# 3 home path
# 4 nothing
# 5 apk key
# 6 profiling result apk
# 7 nothing
# 8 main activity
# 9 package name
# 10 testCodeClass with token

mkdir $4
mkdir $7

chmod 777 $3

chmod 777 $3/dex2jar-0.0.9.15/.
chmod 777 $3/apktool1.5.2/.

rm -r $3/temp
mkdir $3/temp

chmod 777 $3/temp

echo target file is \'$1\'

# sudo $3/dex2jar-0.0.9.15/d2j-dex2jar.sh -f -o $3/temp/jarfile.jar $1
# mkdir $3/temp/newclz

cd $3/temp

echo $1

java -jar ../apktool1.5.2/apktool.jar d $1 bbb

java -classpath ../dom4j-1.6.1.jar:../editManifest.jar manifest_edit.cerberus.manifest.Main temp/bbb $3

java -jar ../apktool1.5.2/apktool.jar b bbb start.apk
cd ..

sudo $3/dex2jar-0.0.9.15/d2j-dex2jar.sh -f -o $3/temp/jarfile.jar $3/temp/start.apk
mkdir $3/temp/newclz
chmod 777 $3/temp/newclz/.

tar xf $3/temp/jarfile.jar -C $3/temp/newclz


#rm ./temp/jarfile.jar

echo $PWD

java -classpath $3/asm-all-4.2.jar:$3/gson-2.2.4.jar:$3/asm.jar scenario.org.cerberus.jarasm.JarAsmTest $3/temp/newclz $5 $9 $8
java -classpath $3/asm-all-4.2.jar:$3/gson-2.2.4.jar:$3/test.jar org.cerberus.test.TestRunnerAsm $3 172.16.101.126 $8 $9 
echo "1-----------------------------------------------------------------"
cp -r $3/lib/org $3/temp/newclz/
cp -r $3/lib/com $3/temp/newclz/
cp -r $3/lib/edu $3/temp/newclz/
#cp -rf $3/src/org $3/temp/newclz

echo "2-----------------------------------------------------------------"

#jar cf $3/temp/newjar.jar $3/temp/newclz/.

cp $3/temp/jarfile.jar $3/temp/newjar.jar

cd $3/temp/newclz


jar uf0 ../newjar.jar .
#jar cf ../newjar.jar .
cd ..
cd ..

echo "3-----------------------------------------------------------------"

$3/dex2jar-0.0.9.15/d2j-asm-verify.sh $3/temp/newjar.jar

echo "4-----------------------------------------------------------------"

$3/dex2jar-0.0.9.15/d2j-jar2dex.sh -f -o /classes.dex $3/temp/newjar.jar

echo "5-----------------------------------------------------------------"

cp -rf $3/temp/start.apk $3/temp/mm_.apk 

echo "6-----------------------------------------------------------------"

zip -u $3/temp/mm_.apk /classes.dex 

echo "7-----------------------------------------------------------------"

$3/dex2jar-0.0.9.15/d2j-apk-sign.sh -f -o $2 $3/temp/mm_.apk





#------------------------------

chmod 777 $3

chmod 777 $3/dex2jar-0.0.9.15/.

rm -r $3/temp
mkdir $3/temp

chmod 777 $3/temp

# echo target file is \'$1\'

# sudo $3/dex2jar-0.0.9.15/d2j-dex2jar.sh -f -o $3/temp/jarfile.jar $1
# mkdir $3/temp/newclz

# chmod 777 $3/temp/newclz/.

# tar xf $3/temp/jarfile.jar -C $3/temp/newclz

echo target file is \'$1\'

# sudo $3/dex2jar-0.0.9.15/d2j-dex2jar.sh -f -o $3/temp/jarfile.jar $1
# mkdir $3/temp/newclz

cd $3/temp

echo $1

java -jar ../apktool1.5.2/apktool.jar d $1 bbb

java -classpath ../dom4j-1.6.1.jar:../editManifest.jar manifest_edit.cerberus.manifest.Main temp/bbb $3

java -jar ../apktool1.5.2/apktool.jar b bbb start.apk
cd ..

sudo $3/dex2jar-0.0.9.15/d2j-dex2jar.sh -f -o $3/temp/jarfile.jar $3/temp/start.apk
mkdir $3/temp/newclz
chmod 777 $3/temp/newclz/.

tar xf $3/temp/jarfile.jar -C $3/temp/newclz


#rm ./temp/jarfile.jar

echo $PWD
#java -classpath $3/asm-all-4.2.jar:$3/gson-2.2.4.jar:$3/methodtrace.jar methodtrace.org.cerberus.jarasm.JarAsm $3/temp/newclz

java -classpath $3/asm-all-4.2.jar:$3/gson-2.2.4.jar:$3/asm2.jar profiling.org.cerberus.jarasm.JarAsmTest $3/temp/newclz $5 $9

java -classpath $3/asm-all-4.2.jar:$3/gson-2.2.4.jar:$3/test.jar org.cerberus.test.TestRunnerAsm $3 172.16.101.126 $8 $9 

		# String path = args[0];
		# String ip = args[1];
		# String mainActivity = args[2];
		# String packageName = args[3];

cp -r $3/lib/org $3/temp/newclz/
cp -r $3/lib/com $3/temp/newclz/
cp -r $3/lib/edu $3/temp/newclz/

java -classpath $3/tokencopy.jar filecopy.cerberus.Main ${10} $3/temp/newclz/org/cerberus/test

#mkdir $3/temp/newclz/org/cerberus/test

#mv CerberusTestRunner.class temp/newclz/org/cerberus/test/CerberusTestRunner.class

#cd $3/temp/newclz

#jar cf ../newjar.jar .
#cd ..
#cd ..

# jar cf $3/temp/newjar.jar $3/temp/newclz/.

cp $3/temp/jarfile.jar $3/temp/newjar.jar

cd $3/temp/newclz


jar uf0 ../newjar.jar .
#jar cf ../newjar.jar .
cd ..
cd ..

echo "3-----------------------------------------------------------------"

$3/dex2jar-0.0.9.15/d2j-asm-verify.sh $3/temp/newjar.jar

echo "4-----------------------------------------------------------------"

$3/dex2jar-0.0.9.15/d2j-jar2dex.sh -f -o /classes.dex $3/temp/newjar.jar

echo "5-----------------------------------------------------------------"

cp -rf $3/temp/start.apk $3/temp/mm_.apk 

echo "6-----------------------------------------------------------------"

zip -u $3/temp/mm_.apk /classes.dex 

echo "7-----------------------------------------------------------------"

$3/dex2jar-0.0.9.15/d2j-apk-sign.sh -f -o $6 $3/temp/mm_.apk


