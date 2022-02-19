----        Win32 Desktop Sprites       ----
----    5 demos by Spanska for 29A#6    ----
----           February 2002            ----
----         From FrenchieLand          ----

After playing Pac-Man for too long one night, 
i dreamed about an enormous Pac-Man crossing
my computer screen. So i felt the absolute 
need to code one, because i guess we all need 
to make our dreams come true. Unlike the trick 
used in screen savers (copy the desktop in an 
image and then put this image in a top window 
without border so you have a "fake" desktop 
you can play with), I had to design a sprite
(i like this word, it reminds me my old C64) 
routine that works with a normal, active 
desktop, so you (or the infected user in case 
of a virus payload) can still work while some 
annoying bug is moving around the screen. 

Here is the result for now, in the order i 
coded the stuff, so basically from the simplest
to the more complex (not that complex though, 
but i don't have much free time).

In order of increasing complexity, we have:

Kiss:     one fixed image
Message:  one image moving
Pac-Man:  four frames linear animation
Bird:     eight frames linear animation
CrazyCar: thirty-six frames non-linear animation

Feel free to use and modify these routines to 
fit your creative needs in a non-destructive 
virus payload, or in whatever you want.

;------------copyleft Spanska 2002----------------