# Split of optional trailing / from DIR
DIR=`echo $1 | sed "s|/$||"`

# Print java class structure
echo "*** Source files ***"
find $DIR | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"

# Compile
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
    cat $DIR/$CLASSNAME.java 
    echo

    # Print hex
    xxd classes/$CLASSNAME.class
    echo

    # Print bytecode interpretation
    javap -c -p -classpath classes $CLASSNAME

    echo
done

# Cleanup
rm -rf classes