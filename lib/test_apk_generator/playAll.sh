mkdir $4
mkdir $7

chmod 777 $3

chmod 777 $3/dex2jar-0.0.9.15/.

rm -r $3/temp
mkdir $3/temp

chmod 777 $3/temp

echo target file is \'$1\'

sudo $3/dex2jar-0.0.9.15/d2j-dex2jar.sh -f -o $3/temp/jarfile.jar $1
mkdir $3/temp/newclz

chmod 777 $3/temp/newclz/.

tar xvf $3/temp/jarfile.jar -C $3/temp/newclz


#rm ./temp/jarfile.jar

echo $PWD

java -classpath $3/asm-all-4.2.jar:$3/gson-2.2.4.jar:$3/asm.jar scenario.org.cerberus.jarasm.JarAsmTest $3/temp/newclz $5

echo "1-----------------------------------------------------------------"
cp -r $3/lib/org $3/temp/newclz/
cp -r $3/lib/com $3/temp/newclz/
#cp -rf $3/src/org $3/temp/newclz

echo "2-----------------------------------------------------------------"

jar cf $3/temp/newjar.jar $3/temp/newclz/.

echo "3-----------------------------------------------------------------"

$3/dex2jar-0.0.9.15/d2j-asm-verify.sh $3/temp/newjar.jar

echo "4-----------------------------------------------------------------"

$3/dex2jar-0.0.9.15/d2j-jar2dex.sh -f -o /classes.dex $3/temp/newjar.jar

echo "5-----------------------------------------------------------------"

cp -rf $1 $3/temp/mm_.apk 

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

echo target file is \'$1\'

sudo $3/dex2jar-0.0.9.15/d2j-dex2jar.sh -f -o $3/temp/jarfile.jar $1
mkdir $3/temp/newclz

chmod 777 $3/temp/newclz/.

tar xvf $3/temp/jarfile.jar -C $3/temp/newclz



#rm ./temp/jarfile.jar

echo $PWD

java -classpath $3/asm-all-4.2.jar:$3/gson-2.2.4.jar:$3/asm2.jar test.org.cerberus.jarasm.JarAsmTest $3/temp/newclz $5

java -classpath $3/asm-all-4.2.jar:$3/gson-2.2.4.jar:$3/test.jar org.cerberus.test.TestRunnerAsm $8 $3
cp -r $3/lib/org $3/temp/newclz/
cp -r $3/lib/com $3/temp/newclz/
#mkdir $3/temp/newclz/org/cerberus/test

#mv CerberusTestRunner.class temp/newclz/org/cerberus/test/CerberusTestRunner.class

#cd $3/temp/newclz

#jar cf ../newjar.jar .
#cd ..
#cd ..

jar cf $3/temp/newjar.jar $3/temp/newclz/.

echo "3-----------------------------------------------------------------"

$3/dex2jar-0.0.9.15/d2j-asm-verify.sh $3/temp/newjar.jar

echo "4-----------------------------------------------------------------"

$3/dex2jar-0.0.9.15/d2j-jar2dex.sh -f -o /classes.dex $3/temp/newjar.jar

echo "5-----------------------------------------------------------------"

cp -rf $1 $3/temp/mm_.apk 

echo "6-----------------------------------------------------------------"

zip -u $3/temp/mm_.apk /classes.dex 

echo "7-----------------------------------------------------------------"

$3/dex2jar-0.0.9.15/d2j-apk-sign.sh -f -o $6 $3/temp/mm_.apk


