#!/usr/bin/perl

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Mosucker 2.2 CGI Notification Script. Copyright by Zeloran (zeloran@freenet.de)
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print "Content-Type: text/html\n\n";                   # Mitteilen dass die Ausgabe im Textformat statt findet
print "<body bgcolor=#000000 text=#00CC33 link=#FFFFFF vlink=#FFFFFF alink=#FFFFFF>\n";
print "<br>";
print "<table width=100% border=0 bgcolor=#006600>";

      print "<tr>";
            print "<td>&nbsp;IP</td>";
            print "<td>&nbsp;Port</td>";
            print "<td>&nbsp;Nick</td>";
            print "<td>&nbsp;Country</td>";
            print "<td>&nbsp;Visible</td>";
            print "<td>&nbsp;Protected</td>";
            print "<td>&nbsp;About</td>";
      print "</tr>";

@parameters = split(/&/,$ENV{'QUERY_STRING'});          # Alle Parameter ermitteln und ein ein Array schreiben
foreach $element (@parameters) {                        # Jeden im Array gefundenen Parameter
  ($name, $value) = split(/=/,$element);                # in zwei Variablen für Namen und Wert aufteilen
  $value =~ tr/+/ /;                                    # Alle vorkommenen + durch Leerzeichen erseztzen
  $parameter{$name} = $value;                           # eine Hash Variable mit Namen und Wert erzeugen
}

@date = split(/ /, localtime());                        # Das aktuelle Datum ermitteln
@time = split(/:/, @date[3]);                           # Die akuelle Uhrzeit ermitteln

$filename = "$ENV{'DOCUMENT_ROOT'}/cgi-bin/online.txt"; # Der Variablen für die Online Liste den Dateinamen zuweisen
$ip = "$ENV{'REMOTE_ADDR'}";                            # Die IP Adresse in einer Variablen speichern

open(IN, $filename);                                    # Die Datei für die Online Liste zum Lesen öffnen
@lines = <IN>;                                          # Den Inhalt der Datei in ein Array einlesen
close(IN);                                              # Den Dateizugriff wieder schließen

foreach $element (@lines) {                             # Alle Server denen ein TimeOut vorliegt entfernen
  @parameter1 = split(/#/, $element);                   # Die Uhrzeit der letzten Aktualisierung ermitteln
  @parameter2 = @time[0];                               # Die aktuelle Uhrzeit ermitteln

  if($parameter1[0] <= $parameter2[0]) {                # Wenn kein Datumwechsel vorliegt
    $buffer1 = $parameter2[0] -$parameter1[0];          # Stundendifferenz ermitteln
    $buffer2 = $parameter2[1] -$parameter1[1];          # Minutendifferenz ermitteln
    $buffer3 = ($buffer1 * 60) + $buffer2;              # Differenzen addieren
  }
  else {                                                # Falls ein Datumwechsel vorliegt 24 zu den Stunden addieren
    $buffer1 = $parameter2[0] -$parameter1[0] + 24;     # Stundendifferenz ermitteln
    $buffer2 = $parameter2[1] -$parameter1[1];          # Minutendifferenz ermitteln
    $buffer3 = ($buffer1 * 60) + $buffer2;              # Differenzen addieren
  }
  if($buffer3 <= 10) {                                  # Wenn die letzte Aktualisierung nicht länger als vor 10 Min ar
    $new[$counter] = "$element";                        # Element in neues Array schreiben
    ++$counter;                                         # Zaehlervariable inkrementieren
  }
}

open(OUT, ">$filename");                                # Datei zum neuschreiben öffnen
foreach $element (@new) {                               # Für jedes Listeelement gilt
  print OUT "$element";                                 # das es in die Datei geschrieben wird
}
close(OUT);                                             # Dateizugriffschliessen

foreach $element (@new) {                               # Für jeden Element der Liste gilt
  $output = true;                                       # Variable die angiebt ob eine Ausgabe stattfindet
  @parameters = split(/#/, $element);                   # Listeneintrag aufteilen

  if($parameter{'ip'} ne "" && $parameters[2] !~ $parameter{'ip'}) {
    $output = false;
  }
  if($parameter{'port'} ne "" && $parameters[3] ne $parameter{'port'}) {
    $output = false;
  }
  if($parameter{'nick'} ne "" && $parameters[4] !~ $parameter{'nick'}) {
    $output = false;
  }
  if($parameter{'country'} ne "" && $parameters[5] ne $parameter{'country'}) {
    $output = false;
  }
  if($parameter{'visible'} ne "" && $parameters[6] ne $parameter{'visible'}) {
    $output = false;
  }
  if($parameter{'protected'} ne "" && $parameters[7] ne $parameter{'protected'}) {
    $output = false;
  }
  if($parameter{'about'} ne "" && $parameters[8] !~ $parameter{'about'}) {
    $output = false;
  }

  if($output eq "true") {

    print "<tr>";
        print "<td>&nbsp;$parameters[2]</td>";
        print "<td>&nbsp;$parameters[3]</td>";
        print "<td>&nbsp;$parameters[4]</td>";
        print "<td>&nbsp;$parameters[5]</td>";
        print "<td>&nbsp;$parameters[6]</td>";
        print "<td>&nbsp;$parameters[7]</td>";
        print "<td>&nbsp;$parameters[8]</td>";
    print "</tr>";

  }
}

print "</table>";
print "</body>";