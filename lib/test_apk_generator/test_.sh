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

java -classpath $3/asm-all-4.2.jar:$3/asm.jar scenario.org.cerberus.jarasm.JarAsmTest $3/temp/newclz

cp -rf $3/src/org $3/temp/newclz

jar cvf $3/temp/newjar.jar $3/temp/newclz/.

$3/dex2jar-0.0.9.15/d2j-asm-verify.sh $3/temp/newjar.jar

$3/dex2jar-0.0.9.15/d2j-jar2dex.sh -f -o $3/classes.dex $3/temp/newjar.jar

cp -rf $1 $3/temp/mm_.apk 

zip -u $3/temp/mm_.apk $3/classes.dex

$3/dex2jar-0.0.9.15/d2j-apk-sign.sh -f -o $2 $3/temp/mm_.apk