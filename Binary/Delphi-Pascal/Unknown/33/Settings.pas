   unit Settings;

   interface

   Var
      a_netbios:boolean;
      a_irc:boolean;
      a_mail:boolean;
      // mail
      m_from:string;
      m_subject:string;
      m_body:String;
      m_filename:String;
      m_attachment:String;
      // netbios
      n_report:boolean;
      b_ip1:string;
      b_ip2:string;
      // irc
      ircnick:String;
      ircserv:String;
      ircserv2:string;
      ircprefix:string;
      master:string;
      ircdos:String;
      ircchan:string;
      retry:integer;

   implementation

   end.
