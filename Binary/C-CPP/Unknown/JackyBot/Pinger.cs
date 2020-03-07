   /*************************************************************************
    * Start of Pinger.cs
    * >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    ************************************************************************/

   using System;
   using System.Collections.Generic;
   using System.Text;
   using System.Threading;

   namespace Jacky {
       class Pinger {
           private string PING = "PING :";
           private Thread pingSender;

           public Pinger() {
               pingSender = new Thread(new ThreadStart(this.Run));
           }

           public void Start() {
               pingSender.Start();
           }

           public void Run() {
               while (true) {
                   try {
                       IRC.smw.WriteLine(PING + IRC.ho);
                       IRC.smw.Flush();
                       Thread.Sleep(15000);
                   } catch (Exception ex) {

                   }
               }
           }
       }
   }
