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
  sed "s/public class \w\w*/public class $CLASS_NAME/" $JAVA_SOURCE.tmp >$JAVA_SOURCE
 
  ## compile the java
  javac $JAVA_SOURCE 
}

function run {
  ## run the class 
  ## you may wish to add additional parameters to come
  ## through as args to the main method
  java -classpath $TEMP_DIRECTORY:lib $CLASS_NAME
}

prepare

cat <<EOF >$JAVA_SOURCE.tmp
////////////////////////////////////////////////////////////

//Write your java class here with a main method

//import some utilities
import java.io.*;
import java.text.*;
import java.util.*;

public class Script {

    public static void main(String[] args) throws Exception {
       System.out.println("Hello world!");
    }

}

///////////////////////////////////////////////////////////
EOF

compile
run



