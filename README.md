java-script-template
====================

Can you write a script with Java?
-----------------------------------
So there are lots of great scripting languages out there that offer a lot over plain old shell scripting. If you know java
then [groovy](http://groovy.codehaus.org/) is very close and a good option but there is the alternative to write pure java by running the source with *runjava* (below) or embedding it into a bash script
 like [example.sh](https://github.com/davidmoten/java-script-template/blob/master/example.sh).

How to run java source in a separate file
---------------------------------------------------
If you want to run java source in a separate file then use [runjava](https://github.com/davidmoten/java-script-template/blob/master/runjava). For example:

Example.java:

```java
import java.io.*;
import java.text.*;
import java.util.*;

public class Example {

    public static void main(String[] args) throws Exception {
       System.out.println("Hello " + args[0] + "!");
    }

}
```

Run it like this:

```bash
$ ./runjava Example.java dave
Hello dave!
```

On my i7 desktop it takes 0.8 seconds to run (compile and execute). Same startup lag as groovy (which you would expect!).

How to embed java source in a bash script
------------------------------------------
The script is designed for linux with a bash shell.

[example.sh](https://github.com/davidmoten/java-script-template/blob/master/example.sh) has this code embedded in it:

The script is run by entering ./example.sh at the command line.


