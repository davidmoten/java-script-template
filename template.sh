#!/bin/bash
## stop the script if an error occurs
set -e

function prepare {
  TEMP_DIRECTORY=/tmp
  TEMPFILE=`mktemp $TEMP_DIRECTORY/ScriptXXXXX|sed -e 's/\.//g'`
  CLASS_NAME=`basename "$TEMPFILE"`
  JAVA_SOURCE=$TEMPFILE.java
}

function compile {
  ## change the name of the class to match the file
  sed "s/public class Script /public class $CLASS_NAME /g" $JAVA_SOURCE.tmp >$JAVA_SOURCE
 
  ## compile the java
  javac $JAVA_SOURCE 
}

function run {
  ## run the class using all passed in parameters from the command line
  java -classpath $TEMP_DIRECTORY $CLASS_NAME
}

prepare

cat <<EOF >$JAVA_SOURCE.tmp
////////////////////////////////////////////////////////////

//Write your java class here with a main method
//Be sure to leave the name of the class as Script 

//import some commonly used imports
import java.io.*;
import java.text.*;
import java.util.*;

public class Script {

    public static void main(String[] args) throws Exception {
       System.out.println("Here's a test run for you");
    }

}

///////////////////////////////////////////////////////////
EOF

compile
run



