   using System;
   using System.Text;
   using System.IO;

   namespace Baldr {
       class RandomWord {
           public string RandomWords(int rand) {
               string c = "abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZMaDeByfReeOn";
               Random r = new Random(unchecked((int)DateTime.Now.Millisecond - rand));
               string n = "";
               for (int i = 0; i < r.Next(4, rand); i++) {
                   n += c[r.Next(c.Length)];
               }
               return n;
           }
       }
   }
