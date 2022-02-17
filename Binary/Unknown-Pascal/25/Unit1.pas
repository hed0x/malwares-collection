   unit Unit1;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ExtCtrls;

   type
     TForm1 = class(TForm)
       CheckBox1: TCheckBox;
       Timer1: TTimer;
       Label1: TLabel;
       procedure CheckBox1Click(Sender: TObject);
       procedure Timer1Timer(Sender: TObject);
     private
       { Private declarations }
     public
       { Public declarations }
     end;
     RastaWords = Record
       RastaWord   : String;
       OrginalWord : String;
     End;

   var
     Form1 :TForm1;
     Logg  :String;

     WordList: Array[0..370] Of RastaWords{Record
       RastaWord     :String;
       OrginalWord   :String;
     End} = (
     (RastaWord:'a'; OrginalWord:'a|to|is|it|the|will|of'),
     (RastaWord:'a door'; OrginalWord:'outdoor|out door|outside|out side'),
     (RastaWord:'a go'; OrginalWord:'to go|will go'),
     (RastaWord:'agony'; OrginalWord:'orgasm|cum'),
     (RastaWord:'ah sey one'; OrginalWord:'cool|great'),
     (RastaWord:'aile'; OrginalWord:'oil'),
     (RastaWord:'aks'; OrginalWord:'ask'),
     (RastaWord:'a lie'; OrginalWord:'lie'),
     (RastaWord:'all fruits ripe'; OrginalWord:'all is good'),
     (RastaWord:'all di while'; OrginalWord:'all the time|sometimes|during'),
     (RastaWord:'an'; OrginalWord:'and'),
     (RastaWord:'a nuh mi'; OrginalWord:'thats not me|its not me|i am not the one'),
     (RastaWord:'aright'; OrginalWord:'all right|alright|sure|yes|okey'),
     (RastaWord:'''at'; OrginalWord:'hot|hat'),
     (RastaWord:'''at steppa'; OrginalWord:'hot stepper|jail breaker|trouble with law'),
     (RastaWord:'a true'; OrginalWord:'its true|it is true|i am not lying'),

     (RastaWord:'baan'; OrginalWord:'born'),
     (RastaWord:'baby madda'; OrginalWord:'mother of a child|mother'),
     (RastaWord:'babylon'; OrginalWord:'system|corrupted system|police'),
     (RastaWord:'backside'; OrginalWord:'self'),
     (RastaWord:'badda'; OrginalWord:'bother'),
     (RastaWord:'bad like yaz'; OrginalWord:'cool'),
     (RastaWord:'bad man'; OrginalWord:'criminal|gangster'),
     (RastaWord:'bwoy'; OrginalWord:'criminal|gangster'),
     (RastaWord:'bait'; OrginalWord:'scoundrel|punk|scum'),
     (RastaWord:'bald head'; OrginalWord:'non-dreadlock|no dreadlock|white'),
     (RastaWord:'bandu'; OrginalWord:'hairband'),
     (RastaWord:'bandulu'; OrginalWord:'criminal|crooked activity'),
     (RastaWord:'bare'; OrginalWord:'only'),
     (RastaWord:'bash'; OrginalWord:'cool|awsome|nice'),
     (RastaWord:'batty'; OrginalWord:'butt|homosexual|homo|gay|fag|queer'),
     (RastaWord:'beg'; OrginalWord:'ask|beg'),
     (RastaWord:'big up'; OrginalWord:'whatsup|sup|whats up'),
     (RastaWord:'blessed'; OrginalWord:'blessing'),
     (RastaWord:'bling'; OrginalWord:'flashy|necklace|chain'),
     (RastaWord:'bloodfire'; OrginalWord:'hell'),
     (RastaWord:'bly'; OrginalWord:'favor|chance'),
     (RastaWord:'bokkle'; OrginalWord:'bottle'),
     (RastaWord:'boots'; OrginalWord:'condom|condoms|shoes'),
     (RastaWord:'bout'; OrginalWord:'about'),
     (RastaWord:'bow'; OrginalWord:'suck|oral sex'),
     (RastaWord:'box'; OrginalWord:'fight|punch'),
     (RastaWord:'bredda'; OrginalWord:'brother'),
     (RastaWord:'bredren'; OrginalWord:'friends|collegues'),
     (RastaWord:'bruk'; OrginalWord:'broke|broken|break'),
     (RastaWord:'buck'; OrginalWord:'bump into|meet by chance'),
     (RastaWord:'bud'; OrginalWord:'bird'),
     (RastaWord:'buddy'; OrginalWord:'male'),
     (RastaWord:'bulla'; OrginalWord:'cake'),
     (RastaWord:'bun'; OrginalWord:'cheated on|burn|kill|smoke'),
     (RastaWord:'bush weed'; OrginalWord:'poor quality herb'),
     (RastaWord:'buss'; OrginalWord:'bust'),
     (RastaWord:'bwoy'; OrginalWord:'boy|male|female'),

     (RastaWord:'ca'; OrginalWord:'because|can'),
     (RastaWord:'card'; OrginalWord:'joke|trick'),
     (RastaWord:'cargo'; OrginalWord:'gold chain'),
     (RastaWord:'cat'; OrginalWord:'female'),
     (RastaWord:'chaka-chaka'; OrginalWord:'messy|untidy'),
     (RastaWord:'cha'; OrginalWord:'what!|wow'),
     (RastaWord:'chalice'; OrginalWord:'waterbong|bong|pipe'),
     (RastaWord:'chatty-chatty'; OrginalWord:'talkactive'),
     (RastaWord:'check it deep'; OrginalWord:'check it out'),
     (RastaWord:'chewsday'; OrginalWord:'tuesday'),
     (RastaWord:'chi chi'; OrginalWord:'gay|fag|queer|homo|homosexual'),
     (RastaWord:'clean'; OrginalWord:'blowjob'),
     (RastaWord:'cock it up'; OrginalWord:'aggressive sex'),
     (RastaWord:'coil'; OrginalWord:'money'),
     (RastaWord:'coppa'; OrginalWord:'copper'),
     (RastaWord:'coo'; OrginalWord:'look'),
     (RastaWord:'coolie hair'; OrginalWord:'straight hair'),
     (RastaWord:'craven'; OrginalWord:'greedy'),
     (RastaWord:'cris'; OrginalWord:'cool|instyle'),
     (RastaWord:'crosses'; OrginalWord:'misfortunes|bad luck'),
     (RastaWord:'cutchie'; OrginalWord:'cup'),
     (RastaWord:'cutlass'; OrginalWord:'large knife'),
     (RastaWord:'cutta'; OrginalWord:'cutter|can opener|cutting tool'),
     (RastaWord:'cyar'; OrginalWord:'car'),

     (RastaWord:'dan'; OrginalWord:'than'),
     (RastaWord:'dandimite'; OrginalWord:'dynamite'),
     (RastaWord:'darkers'; OrginalWord:'sunglasses|shades'),
     (RastaWord:'dat'; OrginalWord:'that'),
     (RastaWord:'dawta'; OrginalWord:'daughter|woman'),
     (RastaWord:'dead'; OrginalWord:'dead|die|killed|to kill'),
     (RastaWord:'dear'; OrginalWord:'expensive'),
     (RastaWord:'deestant'; OrginalWord:'decent'),
     (RastaWord:'dege-dege'; OrginalWord:'measly|skimpy'),
     (RastaWord:'deh'; OrginalWord:'there|where is it'),
     (RastaWord:'deh ''bout'; OrginalWord:'nearby|close to'),
     (RastaWord:'dehya'; OrginalWord:'here|there'),
     (RastaWord:'dem'; OrginalWord:'them|the'),
     (RastaWord:'depan'; OrginalWord:'on|on top of|upon'),
     (RastaWord:'des'; OrginalWord:'desperate'),
     (RastaWord:'dey'; OrginalWord:'they|there'),
     (RastaWord:'di'; OrginalWord:'the|did|was'),
     (RastaWord:'dideh'; OrginalWord:'was there|right over there'),
     (RastaWord:'dis'; OrginalWord:'this'),
     (RastaWord:'disya'; OrginalWord:'this right here'),
     (RastaWord:'don'; OrginalWord:'respected'),
     (RastaWord:'doondoos'; OrginalWord:'albino'),
     (RastaWord:'downpress'; OrginalWord:'oppress'),
     (RastaWord:'dread'; OrginalWord:'dreadlocks|friend|good idea'),
     (RastaWord:'dreadnut'; OrginalWord:'coconut'),
     (RastaWord:'drop legs'; OrginalWord:'dance'),
     (RastaWord:'dun'; OrginalWord:'done|finished|over with|kill'),
     (RastaWord:'dun know'; OrginalWord:'dont know'),
     (RastaWord:'dung'; OrginalWord:'down'),
     (RastaWord:'duppy'; OrginalWord:'ghost'),
     (RastaWord:'dutty'; OrginalWord:'dirty'),
     (RastaWord:'dween'; OrginalWord:'doing'),
     (RastaWord:'dweet'; OrginalWord:'do it'),

     (RastaWord:'ease-up'; OrginalWord:'relax'),
     (RastaWord:'eat unda sheet'; OrginalWord:'oral sex'),
     (RastaWord:'eaz haad'; OrginalWord:'ears hard|stubbornness|thickskulled'),
     (RastaWord:'eff'; OrginalWord:'if'),
     (RastaWord:'ends'; OrginalWord:'place'),
     (RastaWord:'eveling'; OrginalWord:'evening'),
     (RastaWord:'everything cook and curry'; OrginalWord:'everything is just fine'),

     (RastaWord:'fa'; OrginalWord:'for'),
     (RastaWord:'faas'; OrginalWord:'fast'),
     (RastaWord:'facety'; OrginalWord:'nasty'),
     (RastaWord:'fambly'; OrginalWord:'family'),
     (RastaWord:'fass'; OrginalWord:'nosey'),
     (RastaWord:'favor'; OrginalWord:'looks like|resembles'),
     (RastaWord:'feel no way'; OrginalWord:'not taken offense|not worry|not care'),
     (RastaWord:'fi'; OrginalWord:'to'),
     (RastaWord:'fiah'; OrginalWord:'fire|smoke ganja'),
     (RastaWord:'flim'; OrginalWord:'film'),
     (RastaWord:'flex'; OrginalWord:'chill'),
     (RastaWord:'follow'; OrginalWord:'travel|follow|seek'),
     (RastaWord:'foot'; OrginalWord:'leg'),
     (RastaWord:'forward'; OrginalWord:'future|to go|to move'),
     (RastaWord:'fren'; OrginalWord:'friend'),
     (RastaWord:'frock'; OrginalWord:'dress'),
     (RastaWord:'fram'; OrginalWord:'from|since'),
     (RastaWord:'fresh'; OrginalWord:'not ready|still bitter'),
     (RastaWord:'fuckery'; OrginalWord:'maljustive|wrong|unfair'),

     (RastaWord:'gaan'; OrginalWord:'gone'),
     (RastaWord:'gaan to bed'; OrginalWord:'make love'),
     (RastaWord:'gainst'; OrginalWord:'against'),
     (RastaWord:'galang'; OrginalWord:'go along'),
     (RastaWord:'ganja'; OrginalWord:'marijuana'),
     (RastaWord:'gansey'; OrginalWord:'t-shirt'),
     (RastaWord:'gates'; OrginalWord:'home'),
     (RastaWord:'get'; OrginalWord:'to have|had|got|gotten'),
     (RastaWord:'ginnal'; OrginalWord:'trickster'),
     (RastaWord:'ginnygog'; OrginalWord:'derogative'),
     (RastaWord:'gimme'; OrginalWord:'give me'),
     (RastaWord:'give tanks'; OrginalWord:'gratitude'),
     (RastaWord:'glamity'; OrginalWord:'pussy|vagina'),
     (RastaWord:'gleena'; OrginalWord:'newspaper'),
     (RastaWord:'godeh'; OrginalWord:'go there'),
     (RastaWord:'gone'; OrginalWord:'gone|passed|left'),
     (RastaWord:'gorgon'; OrginalWord:'respected'),
     (RastaWord:'greetings'; OrginalWord:'hello|hi'),
     (RastaWord:'grow'; OrginalWord:'raise'),
     (RastaWord:'gwaan'; OrginalWord:'go on|going on'),
     (RastaWord:'gwine'; OrginalWord:'going'),
     (RastaWord:'gweh'; OrginalWord:'go away'),

     (RastaWord:'hab'; OrginalWord:'have'),
     (RastaWord:'haffi'; OrginalWord:'have to'),
     (RastaWord:'half eediat'; OrginalWord:'stupid'),
     (RastaWord:'hanga'; OrginalWord:'closet|hanger'),
     (RastaWord:'hangle'; OrginalWord:'handle'),
     (RastaWord:'har'; OrginalWord:'her'),
     (RastaWord:'haste'; OrginalWord:'hurry'),
     (RastaWord:'hat'; OrginalWord:'hurt'),
     (RastaWord:'hol ih dung'; OrginalWord:'hold it down|keep steady|secret'),
     (RastaWord:'honor'; OrginalWord:'greeting|good bye|bye'),
     (RastaWord:'hose'; OrginalWord:'penis'),
     (RastaWord:'hot steppa'; OrginalWord:'criminal|fugitice'),
     (RastaWord:'hush'; OrginalWord:'sorry'),

     (RastaWord:'I an I'; OrginalWord:'me|myself|i'),
     {
     (RastaWord:'I-cense'; OrginalWord:'ganga|incense'),
     (RastaWord:'I-ditate'; OrginalWord:'meditate'),
     (RastaWord:'I-dren'; OrginalWord:'bredren|brethren'),
     (RastaWord:'I-laloo'; OrginalWord:'callaloo'),
     (RastaWord:'I-man'; OrginalWord:'me|i|myself'),
     (RastaWord:'I-ney'; OrginalWord:'hello|hi'),
     (RastaWord:'I-ree'; OrginalWord:'Irie|happy'),
     (RastaWord:'I-sire'; OrginalWord:'desire'),
     (RastaWord:'I-tal'; OrginalWord:'vital'),
     (RastaWord:'I-tes'; OrginalWord:'Heights'),
     (RastaWord:'I-wah'; OrginalWord:'hour'),
     (RastaWord:'I-yah'; OrginalWord:'me|i|you'),
     }
     (RastaWord:'ih'; OrginalWord:'it'),
     (RastaWord:'im'; OrginalWord:'him'),
     (RastaWord:'informa'; OrginalWord:'informer'),
     (RastaWord:'inna'; OrginalWord:'in the'),
     (RastaWord:'inna di lights'; OrginalWord:'tomorrow'),
     (RastaWord:'irie'; OrginalWord:'alright|great|cool'),
     (RastaWord:'iron bird'; OrginalWord:'airplane'),
     (RastaWord:'is'; OrginalWord:'it is|it was|was it'),

     (RastaWord:'Ja'; OrginalWord:'jamaica'),
     (RastaWord:'Jamdown'; OrginalWord:'jamaica'),
     (RastaWord:'Jamdung'; OrginalWord:'jamaica'),
     (RastaWord:'jacket'; OrginalWord:'basterd'),
     (RastaWord:'Jah'; OrginalWord:'lord|god'),
     (RastaWord:'Jah guide'; OrginalWord:'bye|farwell|later'),
     (RastaWord:'Jah know'; OrginalWord:'lord knows|god knows'),
     (RastaWord:'jancro'; OrginalWord:'hate'),
     (RastaWord:'jester'; OrginalWord:'joke|kidding'),
     (RastaWord:'jook'; OrginalWord:'pierce|poke|have sex'),
     (RastaWord:'jus begin fi dead'; OrginalWord:'amazed'),

     (RastaWord:'ketch'; OrginalWord:'ketch|get|achieve'),
     (RastaWord:'key'; OrginalWord:'good friend'),
     (RastaWord:'kill mi dead'; OrginalWord:'no matter what'),
     (RastaWord:'kiss teet'; OrginalWord:'kissing'),
     (RastaWord:'ku'; OrginalWord:'look'),
     (RastaWord:'kya'; OrginalWord:'care'),
     (RastaWord:'kyaan'; OrginalWord:'cant|can not'),
     (RastaWord:'kyaan done'; OrginalWord:'cant finish|never ending|cant end'),
     (RastaWord:'kyarri'; OrginalWord:'carry'),

     (RastaWord:'laas'; OrginalWord:'last|lose'),
     (RastaWord:'labba-labba'; OrginalWord:'talking to much'),
     (RastaWord:'lambsbread'; OrginalWord:'ganja'),
     (RastaWord:'lang'; OrginalWord:'long'),
     (RastaWord:'large'; OrginalWord:'respected'),
     (RastaWord:'lef'; OrginalWord:'eave|left|passed'),
     (RastaWord:'leggo'; OrginalWord:'let go|leave|lets go'),
     (RastaWord:'liad'; OrginalWord:'liar'),
     (RastaWord:'lickle'; OrginalWord:'little'),
     (RastaWord:'light'; OrginalWord:'power|electricity'),
     (RastaWord:'likky-likky'; OrginalWord:'greedy'),
     (RastaWord:'lilly'; OrginalWord:'little|tiny'),
     (RastaWord:'link up'; OrginalWord:'hook up'),
     (RastaWord:'lock up'; OrginalWord:'closed'),

     (RastaWord:'machet'; OrginalWord:'machete'),
     (RastaWord:'maga'; OrginalWord:'skinny|slender'),
     (RastaWord:'man juice'; OrginalWord:'sperm'),
     (RastaWord:'mantell'; OrginalWord:'male gigolo|player|man whore'),
     (RastaWord:'marina'; OrginalWord:'wifebeater'),
     (RastaWord:'mas'; OrginalWord:'wise master'),
     (RastaWord:'mascot'; OrginalWord:'lame|inferior|mean guy'),
     (RastaWord:'mash it up'; OrginalWord:'doing well'),
     (RastaWord:'mek'; OrginalWord:'ley|make'),
     (RastaWord:'memba'; OrginalWord:'remember'),
     (RastaWord:'mi'; OrginalWord:'me|i|mine'),
     (RastaWord:'mon'; OrginalWord:'man|woman|child|dude|person'),
     (RastaWord:'mongst'; OrginalWord:'amongst'),
     (RastaWord:'mos def'; OrginalWord:'most definitely|of course|yes|sure'),
     (RastaWord:'mudda'; OrginalWord:'mother'),
     (RastaWord:'muss'; OrginalWord:'must'),
     (RastaWord:'mussi'; OrginalWord:'must be'),
     (RastaWord:'my yute'; OrginalWord:'my youth|young'),

     (RastaWord:'naa'; OrginalWord:'no'),
     (RastaWord:'neba'; OrginalWord:'never'),
     (RastaWord:'negga'; OrginalWord:'negro'),
     (RastaWord:'neegle'; OrginalWord:'needle'),
     (RastaWord:'neegle yeye'; OrginalWord:'needles eye'),
     (RastaWord:'nize'; OrginalWord:'noise'),
     (RastaWord:'nuff'; OrginalWord:'plenty|too much|many|tons|alot|a lot'),
     (RastaWord:'nuh'; OrginalWord:'no|now|know'),
     (RastaWord:'nuh true?'; OrginalWord:'isent it so?|right?'),
     (RastaWord:'nutten'; OrginalWord:'nothen'),
     (RastaWord:'nyam'; OrginalWord:'eat'),
     (RastaWord:'nyami'; OrginalWord:'eats much'),
     (RastaWord:'nyega'; OrginalWord:'black person|nigger|neger|negro'),

     (RastaWord:'obeah'; OrginalWord:'wichcraft|voodoo'),
     (RastaWord:'odda'; OrginalWord:'other'),
     (RastaWord:'ongle'; OrginalWord:'only'),
     (RastaWord:'ooman'; OrginalWord:'woman'),
     (RastaWord:'ooo'; OrginalWord:'who'),
     (RastaWord:'ova'; OrginalWord:'over'),
     (RastaWord:'ovastan'; OrginalWord:'understand|overstand'),

     (RastaWord:'pear'; OrginalWord:'avocado'),
     (RastaWord:'peas'; OrginalWord:'beans'),
     (RastaWord:'pickney'; OrginalWord:'child|children|kid|kids'),
     (RastaWord:'poas'; OrginalWord:'post|mail'),
     (RastaWord:'priors'; OrginalWord:'prayers'),
     (RastaWord:'pull'; OrginalWord:'open'),
     (RastaWord:'pyur'; OrginalWord:'only'),

     (RastaWord:'quashi'; OrginalWord:'peasant'),
     (RastaWord:'quips'; OrginalWord:'small portion'),
     (RastaWord:'quing-up'; OrginalWord:'compress'),
     (RastaWord:'quattie'; OrginalWord:'no value'),

     (RastaWord:'radda'; OrginalWord:'rather'),
     (RastaWord:'ragga'; OrginalWord:'reggae'),
     (RastaWord:'raggamuffin'; OrginalWord:'ghetto dweller'),
     (RastaWord:'rakstone'; OrginalWord:'rocks|stones'),
     (RastaWord:'raas'; OrginalWord:'ass'),
     (RastaWord:'ray ray'; OrginalWord:'bla bla'),
     (RastaWord:'ready'; OrginalWord:'attractive'),
     (RastaWord:'red'; OrginalWord:'high|drunk|not black'),
     (RastaWord:'res yeye'; OrginalWord:'jelous'),
     (RastaWord:'reespek'; OrginalWord:'respect'),
     (RastaWord:'renk'; OrginalWord:'foul|smelling bad|rude'),
     (RastaWord:'response'; OrginalWord:'responsible'),
     (RastaWord:'rest'; OrginalWord:'relax|settle down'),
     (RastaWord:'rhaatid'; OrginalWord:'suprise|irritation'),
     (RastaWord:'righted'; OrginalWord:'correct|out of sense|no sense'),
     (RastaWord:'rockas'; OrginalWord:'rock to'),
     (RastaWord:'romp'; OrginalWord:'mess with|play'),
     (RastaWord:'rope een'; OrginalWord:'join in|come in'),
     (RastaWord:'rude bwoy'; OrginalWord:'tought guy|rebel|criminal'),
     (RastaWord:'run a boat'; OrginalWord:'cook|eat|dinner'),

     (RastaWord:'sa'; OrginalWord:'sir'),
     (RastaWord:'salt'; OrginalWord:'bad luck|unlucky'),
     (RastaWord:'samfi'; OrginalWord:'trickster|conman'),
     (RastaWord:'satday'; OrginalWord:'saturday'),
     (RastaWord:'satnight'; OrginalWord:'saturday night'),
     (RastaWord:'sciecne'; OrginalWord:'wichcraft'),
     (RastaWord:'scenty'; OrginalWord:'smeeling good|good scent'),
     (RastaWord:'screw'; OrginalWord:'angry'),
     (RastaWord:'see it'; OrginalWord:'do you see|do you understand'),
     (RastaWord:'shorty'; OrginalWord:'chick|girl'),
     (RastaWord:'shot'; OrginalWord:'shoot|shot|been shot'),
     (RastaWord:'sidung'; OrginalWord:'sit down'),
     (RastaWord:'si´ting'; OrginalWord:'something'),
     (RastaWord:'skettle'; OrginalWord:'ho|hoe|slut'),
     (RastaWord:'skin teet'; OrginalWord:'smile'),
     (RastaWord:'slam'; OrginalWord:'sex'),
     (RastaWord:'slap'; OrginalWord:'sex'),
     (RastaWord:'slump'; OrginalWord:'slums|ghetto'),
     (RastaWord:'so'; OrginalWord:'like that|such as that|like such'),
     (RastaWord:'soon come'; OrginalWord:'come soon'),
     (RastaWord:'spliff'; OrginalWord:'joint|marijuana cigarette'),
     (RastaWord:'stamina'; OrginalWord:'sexual endurance'),
     (RastaWord:'star'; OrginalWord:'man'),
     (RastaWord:'stay'; OrginalWord:'leave alone|let be'),
     (RastaWord:'step'; OrginalWord:'leave|let be'),
     (RastaWord:'stoosh'; OrginalWord:'rich'),
     (RastaWord:'su-su'; OrginalWord:'gossip|rumors'),
     (RastaWord:'sufferation'; OrginalWord:'suffering|poverty|trials'),
     (RastaWord:'sum´ady'; OrginalWord:'somebody'),
     (RastaWord:'sup´m'; OrginalWord:'something'),
     (RastaWord:'swaaty'; OrginalWord:'fatty'),

     (RastaWord:'tack'; OrginalWord:'bullet'),
     (RastaWord:'tall'; OrginalWord:'long'),
     (RastaWord:'tallowah'; OrginalWord:'strong|sturdy'),
     (RastaWord:'tam'; OrginalWord:'rastahat'),
     (RastaWord:'tan'; OrginalWord:'stand|stay|wait and see'),
     (RastaWord:'tanks'; OrginalWord:'thanks'),
     (RastaWord:'tan pon it lang'; OrginalWord:'have sex a long time'),
     (RastaWord:'ten toe turbo'; OrginalWord:'walk'),
     (RastaWord:'teet'; OrginalWord:'teeth'),
     (RastaWord:'teif'; OrginalWord:'theif|steal'),
     (RastaWord:'tek'; OrginalWord:'take|get'),
     (RastaWord:'tess'; OrginalWord:'test'),
     (RastaWord:'trash an ready'; OrginalWord:'stylish'),
     (RastaWord:'tree'; OrginalWord:'three'),
     (RastaWord:'truu'; OrginalWord:'truth|true|through|threw'),
     (RastaWord:'truss mi'; OrginalWord:'trusrt me'),
     (RastaWord:'truut'; OrginalWord:'truth'),
     (RastaWord:'tun'; OrginalWord:'turn'),

     (RastaWord:'unda gal pickney'; OrginalWord:'under girls pants'),
     (RastaWord:'undastan'; OrginalWord:'understand'),
     (RastaWord:'uno'; OrginalWord:'you|you all|the all of you'),
     (RastaWord:'upful'; OrginalWord:'cheerful'),
     (RastaWord:'usband'; OrginalWord:'husband'),

     (RastaWord:'van'; OrginalWord:'pick-up'),
     (RastaWord:'vank'; OrginalWord:'beat|eliminate|conquer|vanquish'),
     (RastaWord:'vex'; OrginalWord:'angry|mad|upset|furious'),

     (RastaWord:'wa'; OrginalWord:'what'),
     (RastaWord:'wa day'; OrginalWord:'other day'),
     (RastaWord:'wa mek'; OrginalWord:'why'),
     (RastaWord:'waan'; OrginalWord:'want|need'),
     (RastaWord:'wanga gut'; OrginalWord:'fat'),
     (RastaWord:'wa´ppun'; OrginalWord:'whatsup|what is up|sup|whats happening'),
     (RastaWord:'weh'; OrginalWord:'where|that is'),
     (RastaWord:'wear'; OrginalWord:'wear|worn|wears'),
     (RastaWord:'wheels'; OrginalWord:'car'),
     (RastaWord:'whole heap'; OrginalWord:'alot|a lot'),
     (RastaWord:'wi'; OrginalWord:'we|us|our|ours'),
     (RastaWord:'wicked'; OrginalWord:'bad|evil'),
     (RastaWord:'winji'; OrginalWord:'thing|unattractive'),
     (RastaWord:'wit'; OrginalWord:'with'),
     (RastaWord:'wrap up'; OrginalWord:'kidding|joking'),
     (RastaWord:'wood'; OrginalWord:'penis'),
     (RastaWord:'work'; OrginalWord:'sex'),
     (RastaWord:'wutless'; OrginalWord:'worthless'),

     (RastaWord:'x amount'; OrginalWord:'countless|plenty'),

     (RastaWord:'ya'; OrginalWord:'you|here|yes'),
     (RastaWord:'yah'; OrginalWord:'you|here|yes'),
     (RastaWord:'yahso'; OrginalWord:'over here|right here'),
     (RastaWord:'ya nuh see it'; OrginalWord:'you know'),
     (RastaWord:'yaad'; OrginalWord:'yard|house|home|residence'),
     (RastaWord:'yeh'; OrginalWord:'yes'),
     (RastaWord:'yeye'; OrginalWord:'eye'),
     (RastaWord:'yeyewata'; OrginalWord:'shed tears|cry'),
     (RastaWord:'yuut'; OrginalWord:'youth'),

     (RastaWord:'zeen'; OrginalWord:'understand|you know|you see|okey|yeh'),
     (RastaWord:'Zion'; OrginalWord:'ethiopia'),
     (RastaWord:'zutopong'; OrginalWord:'low class'));

   implementation

   {$R *.dfm}

   procedure SendKeys(const text: String);
   var
      i: Integer;
      shift: Boolean;
      vk,scancode: Word;
      ch: Char;
      c,s: Byte;
   const
      vk_keys: Array[0..9] of Byte =
         (VK_HOME,VK_END,VK_UP,VK_DOWN,VK_LEFT,
           VK_RIGHT,VK_PRIOR,VK_NEXT,VK_INSERT,
           VK_DELETE);
      vk_shft: Array[0..2] of Byte =
        (VK_SHIFT,VK_CONTROL,VK_MENU);
      flags: Array[false..true] of Integer =
        (KEYEVENTF_KEYUP, 0);
   begin
      shift := false;
      for i := 1 to Length(text) do
      begin
         ch := text[i];
         if ch >= #250 then
         begin
            s := Ord(ch) - 250;
            shift := not Odd(s);
            c := vk_shft[s shr 1];
            scancode := MapVirtualKey(c,0);
            Keybd_Event(c,scancode,flags[shift],0);
         end
         else
         begin
            vk := 0;
            if ch >= #240 then
               c := vk_keys[Ord(ch) - 240]
            else if ch >= #228 then
               {228 (F1) => $70 (vk_F1)}
               c := Ord(ch) - 116
            else if ch < #32 then
               c := Ord(ch)
            else
            begin
               vk :=VkKeyScan(ch);
               c :=LoByte(vk);
            end;
            scancode := MapVirtualKey(c,0);
            if not shift and (Hi(vk) > 0) then
               { $2A = scancode of VK_SHIFT }
               Keybd_Event(VK_SHIFT,$2A,0,0);
            Keybd_Event(c,scancode,0,0);
            Keybd_Event(c,scancode,
                  KEYEVENTF_KEYUP,0);
            if not shift and (Hi(vk) > 0) then
               Keybd_Event(VK_SHIFT,
                  $2A,KEYEVENTF_KEYUP,0);
         end;
      end;
   end;

   Function DoFit(Word, Rasta: String): Boolean;
   Var
     Temp  :String;
     Line  :String;
   Begin
     Result := False;
     If (Pos('|', Rasta) = 0) Then Exit;

     Line := Rasta;
     While (Pos('|', Line) > 0) Do
     Begin
       Temp := Copy(Line, 1, Pos('|', Line)-1);
       If (Temp = word) Then
         Result := True;
       Line := Copy(Line, pos('|', Line)+1, Length(Line));
     End;

     Temp := Line;
     If (Temp = word) Then
       Result := True;
   End;

   Procedure FindRasta(Word: String; ending: char);
   Var
     I             :Integer;
     RW            :RastaWords;

     RastaW        :Array of String;
     RastaC        :Integer;
     Replace       :String;

     Temp          :String;
   Begin
     SetLength(RastaW, 0);
     RastaC := 0;

     For I := 0 To 370 Do
     Begin
       RW := WordList[I];
       If (RW.OrginalWord = lowercase(word)) Then
       Begin
         RastaC := RastaC + 1;
         SetLength(RastaW, RastaC);
         RastaW[RastaC-1] := RW.RastaWord;
       End
       Else Begin
         If (Pos('|', RW.OrginalWord) > 0) Then
         Begin
           If DoFit(lowercase(Word), RW.OrginalWord) Then
           Begin
             RastaC := RastaC + 1;
             SetLength(RastaW, RastaC);
             RastaW[RastaC-1] := RW.RastaWord;
           End;
         End;
       End;
     End;

     If (RastaC > 0) Then
     Begin
       Randomize;
       Replace := RastaW[Random(RastaC)];

       For I := 1 To Length(Word)+1 Do
         Temp := Temp + #8;

       SendKeys(Temp+Replace+ending);
     End;
   End;

   procedure TForm1.CheckBox1Click(Sender: TObject);
   begin
     If (CheckBox1.Checked) Then Timer1.Enabled := True
                            Else Timer1.Enabled := False;
   end;

   procedure TForm1.Timer1Timer(Sender: TObject);
   Var
     I     :Integer;
     J     :Integer;
   begin

     For I := 13 To 222 Do
     Begin
       If GetASyncKeyState(I) = -32767 Then
       Begin
         Case I Of
           13:begin Logg := '';end;
           32:begin FindRasta(Logg, #32);Logg := '';end;
           65..90:Logg := Logg + LowerCase(Chr(I));
         End;
       End;
     End;
   end;

   end.
