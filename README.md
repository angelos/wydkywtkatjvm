## What's this?
TODO Link to handout of presentation

It contains a testbed for the type of code inspection used in the presentation. There are a number of rather simple programs, either in Java for handling with the Java SDK and Android tools, or native c code.

Have fun!

-- [Angelo van der Sijpt](https://twitter.com/_angelos)

## Requirements
To reproduce the Java based examples, you will need

- a recent Java SDK (I used Java 8), with tools `javac` and `javap` added to your path. This should happen by default;
- Android build tools, with `dx` and `dexdump` on your path. Once you have installed the `sdkmanager`, make sure the tools end up on the path. I installed using [homebrew](http://brewformulas.org/android-sdk), so I need to run `export PATH=$PATH:/usr/local/Caskroom/android-sdk/3859397/build-tools/26.0.3` before running these examples. 

The Java examples should run on any Mac and Linux.

For the native code, I only have Mac compatible scripts. You'll need,
- `gcc` and `otool` on the path. These come with your installation of [Xcode](https://developer.apple.com/xcode/).

## Reproducing
### Java examples
The `java` directory contains a script, and a bunch of directories. The directories represent examples. For instance, run

    sh inspect.sh SimpleAddition

to compile and inspect the example program in the `SimpleAddition` directory, along with its Android equivalent.

The `gc` directory contains a single example of inspecting garbage collector use. Run `run.sh` to see it in action.

### Machine code examples
Run the `inspect.sh` or `inspect_optimized.sh` script with the name of a source file to inspect the (non-)optimized code. For instance, run

    sh inspect_optimized.sh unroll.c