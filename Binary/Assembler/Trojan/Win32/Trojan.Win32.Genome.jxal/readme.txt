---- Using complex 3D objects in OpenGL ----
----    4 demos by Spanska for 29A#6    ----
----            January 2002            ----
----         From FrenchieLand          ----

A continuation of a small OpenGL serie 
published in IkX Xine#5.

All the calculations are done just once at 
program start, so if you have a slow computer,
don't worry if nothing happens for some seconds.
More explanations in the source. I include
opengl32.lib in case you wanna change a bit the
source out of curiosity and re-assemble the stuff.

All these demos are more or less the same:

- Mouse and buttons to zoom / rotate. 
- Space to change shading mode.

In order of increasing complexity, we have:

face1: 441 polygons calculated (but 882 on screen)
t4:    932 polygons
face2: 4640 polygons
globe: 6564 polygons

Now imagine a face appearing on an user computer, 
looking around, smiling to him, saying "i fear 
you're infected, my friend" in a scary synthetic 
voice, and then laughing. It's possible to code 
all of that. Be creative in your virus payloads!

;------------copyleft Spanska 2002----------------