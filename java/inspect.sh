# Split of optional trailing / from DIR
DIR=`echo $1 | sed "s|/$||"`

# Print java class structure
echo "*** Source files ***"
find $DIR | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"

# Compile
echo "*** Compiling to .class"
mkdir -p classes
find $DIR -iname '*.java' | xargs javac -d classes

# Print .class structure
echo
echo "*** Class files ***"
find classes | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"
echo

# Print each class in java, hex & bytecode
find $DIR -iname '*.java' | while read -r SOURCE
do
	# Strip off the root directory and .java
	CLASSNAME=`echo $SOURCE | sed "s|\(.*\)\.java|\1|" | sed "s|$DIR/||"`
	echo "********************"
	echo "*** $CLASSNAME.java ***"
	echo "********************"

    # Print source
    echo "> cat $DIR/$CLASSNAME.java"
    cat $DIR/$CLASSNAME.java 
    echo

    # Print hex
    echo "> xxd classes/$CLASSNAME.class"
    xxd classes/$CLASSNAME.class
    echo

    # Print bytecode interpretation
    echo "> javap -c -p -classpath classes $CLASSNAME"
    javap -c -p -classpath classes $CLASSNAME

    echo
done

# Compile to DEX
echo "*** Compile to dex"
echo "> dx --dex --output=classes/$DIR.dex classes"
dx --dex --output=classes/$DIR.dex classes

echo "********************"
echo "*** $DIR.dex ***"
echo "********************"

# Print hex
echo "> xxd classes/$DIR.dex"
xxd classes/$DIR.dex
echo

# Print hex
echo "> dexdump -d classes/$DIR.dex"
dexdump -d classes/$DIR.dex
echo


# Cleanup
rm -rf classes