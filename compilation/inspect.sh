# Strip the ".java" from the filename, we will need the class name later
CLASSNAME=`echo $1 | sed 's/\(.*\)\.java/\1/'`

# Compile
javac $CLASSNAME.java
# Print source
cat $CLASSNAME.java 
# Print hex
xxd $CLASSNAME.class
# Print bytecode interpretation
javap -c -p $CLASSNAME
# Cleanup
rm $CLASSNAME.class