java-script-template
====================

So there are lots of great scripting languages out there that offer a lot over plain old shell scripting. If you know java
then [groovy](http://groovy.codehaus.org/) is very close and a good option but there is the alternative to write pure java by embedding it into a bash script
 like [template.sh](https://github.com/davidmoten/java-script-template/blob/master/template.sh).

The script is designed for linux with a bash shell.

The example has this code embedded in it:

```java
import java.io.*;
import java.text.*;
import java.util.*;

public class Script {

    public static void main(String[] args) throws Exception {
       System.out.println("Hello world!");
    }

}
```

The script is run by entering ./template.sh at the command line.

On my i7 desktop it takes 2 seconds to run (compile and execute).
