# Linux.Zariche: a Vala virus

Vala is an object-oriented programming language with a self-hosting compiler that generates C code and uses the GObject system. Vala is syntactically similar to C# and and rather than being compiled directly to assembly or to another intermediate language, Vala is source-to-source compiled to C, which is then compiled with a platform's standard C compiler, such as GCC.

You can also create VAPI files which are basically native C (not C++) functions you can import to Vala code. Being a language that is converted into plain and pure C, Vala code can also run on Windows (with the necessary code optimizations, of course).

Anyway I was decided to write a prepender in this language, the first (binary) virus ever written so far in Vala. It's named Linux.Zariche and there are two variants available so far.

* Linux.Zariche.A original release, simple ELF infector (prepender).
* Linux.Zariche.B uses AES encryptation via external library (vapi).

Compilation instructions are the following (tested on a x86_64 system, but should work on x86):

**valac filename.vala --pkg=gee-1.0 --pkg=gio-2.0 --pkg=nettle --pkg=posix**

Where Vala >= 0.20. In order to use the --pkg=nettle flag, place your nettle.vapi file inside Vala's library folder, usually something like /usr/share/vala-0.20/vapi for example.

NOTE: I'm not responsible for any damages this code may cause, use at your own risk and in a safe environment.
