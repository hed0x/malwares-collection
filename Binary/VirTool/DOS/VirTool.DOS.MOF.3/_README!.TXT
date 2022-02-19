

       My dear friends,

        Finaly  I  have  moved  my  ass  around  and finished the very first
 commercial version of my  polymorphic  engine.   This  is  the engine I was
 talking about in my article 'Analisis on the polymorphic decryptor',  which
 you can read in the 29A magazine (http://29A.islatortuga.com).

        I admit it was a long  time from  the release  of the article, until
 the release of this source, but you have to understand that some of us also
 have to work for a living ;-((
 
        Anyway, I don't know if any future versions of this Engine  will  be
 available to public, but until then, it's a start...

        Lemme number the +'s and -'s of this engine:

        '-':   -> the engine is too long (unoptimized code)
               -> the decryptor still looks 'too much' like a generated one

        '+':  -> can generate fake  Calls  to  fake routines
              -> can generate recursive Calls to the same routine
              -> can generate conditional jumps
              -> generates almost all combinations of  math operations
              -> generates interrupt calls

        This version is the best so far, Version 3.0.

        In the future versions I  will  add some advanced polymorphism stuff
 (like placing the decryptor anywhere within the code).

        Before you start playing with the code, here is the data  about  the
 files you have here (so don't kick me if you have a virus):

        File  name     | Length (bytes) | Date
        ---------------+----------------+----------
        mof_demo.asm   | 89970          | 20-05-98
        mof_demo.exe   | 10060          | 20-05-98
        asmwiz.lib     | 36553          | 01-02-96
        mof00000.com   |  2077          | 20-05-98 -> working sample
        ---------------+----------------+----------

        The assembled file is good, if you mess the source, I don't care ;-)

        As you can read in the original comment inside the code, I  used  an
 ASM  library  in  order  to  make  the demo making easier.  This library is
 called ASMWiz. And, by the way,  speaking of the original comment.  Some of
 the things said there  are  not  true,  like  for  example  the  parameters
 returned by the engine and the flags I do not use yet.

        Anyway, if any of you have any suggestions, comments, bug reports, or
 anything, please write me to:

               lordjulus@geocities.com

        Whoever  is  useful  to this code will be placed in the credits area
 and will receive for free  all  the  future versions... plus will become my
 friend ;-))

        All the Best and don't forget, check out my articles at:

               Http://members.tripod.com/~lordjulus

                                                  Lord Julus


