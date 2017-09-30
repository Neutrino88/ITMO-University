# Лабораторная работа #5

Задания для выполнения лабораторной работы ориентированы на работу с файлами из каталога /usr/local/regexp/

### Задание #1 (файл datebook):

1. Замените имя Jon на Jonathan
2. Удалите первые три строки
3. Выведите строки с 5-ой по 10-ю
4. Удалите строки, содержащие Lane
5. Вывести все строки с с днем рождения в ноябре или декабре
6. Добавить три символа * в конец строк, начинающихся с Fred
7. Замените строку, содержащую Jose на JOSE HAS RETIRED
8. Замените дату рождения Popeye на 11/14/46. При этом подразумевается, что вы не знаете значение даты, хранящейся в файле. Составьте и используйте регулярное выражение для ее поиска
9. Удалите все пустые строки
10. Напишите программу на языке редактора sed, которая:
11. вставляет перед первой строкой заголовок TITLE OF FILE
12. удаляет последнее поле, значение которого кратно 500
13. меняет местами имя и фамилию
14. добавляет к концу каждой строки фразу THE END

### Задание #2 (файл datafile):

Разобрать команды и объяснить состав регулярного выражения и описать результаты вывода каждой из приведенных ниже команд:

```bash
sed '/north/p' datafile
sed -n '/north/p' datafile
sed '3d' datafile
sed '3,$d' datafile
sed '$d' datafile
sed '/north/d' datafile
sed 's/west/north/g' datafile
sed -n 's/^west/north/p' datafile
sed 's/[0-9][0-9]$/&.5/' datafile
sed -n 's/Hemenway/Jones/gp' datafile
sed -n 's/\(Stag\)got/\1ianne/p' datafile
sed 's#14#88#g' datafile
sed -n '/west/,/east/p' datafile
sed -n '5,/^northeast/p' datafile
sed '/west/,/east/s/$/**WAKA**/' datafile
sed -e '1,3d' -e 's/Hemenway/Jones/' datafile
sed '/Suan/r newfile' datafile
sed -n '/north/w newfile' datafile
sed '/^north /a\
--->THE NORTH SALES DISTRICT HAS MOVED<---' datafile
sed '/eastern/i\
NEW ENGLAND REGION\
-------------------------------------' datafile
sed '/eastern/c\
THE EASTERN REGION HAS BEEN TEMPORARILY CLOSED' datafile
sed '/eastern/{ n; s/AM/Archie/; }' datafile
sed '2,4y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/' datafile
sed '4q' datafile
sed '/Lewis/{ s/Lewis/Joseph/;q; }' datafile
sed -e '/northeast/h' -e '$G' datafile
sed -e '/WE/{h; d; }' -e '/CT/{G; }' datafile
sed -e '/northeast/h' -e '$g' datafile
sed -e '/WE/{h; d; }' -e '/CT/{g; }' datafile
sed -e '/Patricia/h' -e '/Margot/x' datafile
sed -n '/sentimental/p' datafile
sed '0,8d' datafile > newfile
sed '/[Dd]aniel/d' datafile
sed -n '17,20p' datafile
sed '1,10s/Montana/MT/g' datafile
sed '/March/!d' datafile
sed '/report/s/5/8/' datafile
sed 's/....//' datafile
sed 's/...$//' datafile
sed '/east/,/west/s/North/South/' datafile
sed -n '/Time off/w timefile' datafile
sed 's/\([Oo]ccur\)ence/\1rence/' datafile
sed -n l datafile
```

### Задание #3:

Проанализировать пару программ на языке sed и описать их поведение. 

```bash 
$ cat sed1
/Lewis/a\
Lewis is the TOP Salesperson for April!!\
Lewis is moving to the southern district next month.\
CONGRATULATIONS!
/Margot/c\
*******************\
MARGOT HAS RETIRED\
********************
1i\
EMPLOYEE DATABASE\
---------------------
$d
```

```bash
$ cat sed2
/western/, /southeast/{
/^ *$/d
/Suan/{ h; d; }
}
/Ann/g
s/TB \(Savage\)/Thomas \1/
```

```bash
$ cat sed3
echo '!qqqq#qqqqq#q#qq#qqqqqqq#qqq@' | gsed -n '1p;:b;s/!\(q*\)#\(\1[^@]*\)@/!\2@\1#/;tx;s/!\([^#]#\)/\1!/;:x;/![^#]*@/be;s/!\([^#]*\)#\([^#@]*\)/!\2#\1/;bb;:e;s/!\([^@]*\)@.*/\1/;p'
```

```bash
$ cat sed4
echo QQQWWWW |
gsed -n 's/^\(.*\)$/x\1=/;:t;s/xQ\(Q*\)\(W*\)\(=.*\)/Qx\1\2\3\2/;tt;p'
```

```bash
$ cat sed5
echo wwwwwwwwwwwww | gsed -n 's/\(w*\)\1\1\(w*\)/\1,\2/p'
```

```bash
$ cat sed6
s/\([0-9]\)/ \1/g
s/0//g; s/1/i/g; s/2/ii/g; s/3/iii/g; s/4/iiii/g; s/5/iiiii/g; s/6/iiiiii/g; s/7/iiiiiii/g; s/8/iiiiiiii/g; s/9/iiiiiiiii/g
:ten
s/i / iiiiiiiiii/g
t ten
s/ //g

s/+//

:sub
s/i-i/-/g
t sub
s/-$//

/\//b divid

s/\*/m/
s/^mi*$//
s/^i*m$//
s/^i/+i/
:mul
s/mi$//
s/+\(i*\)mi\(i*\)/\1+\1\m\2/
t mul
s/+//

b result

:divid
s/\//7/
s/^7i*$/0/
/^0$/b quit
s/^i*7$/недопустимая операция/
/недопустимая операция/b quit
#делимое+делитель+уменьшаемое+вычитаемое+счетчик(частное)
s/\(i*\)7\(i*\)/\1+\2+\1-\2+/
:div
:sb1
s/+\(i*\)i-i\(i*\)+/+\1-\2+/
t sb1
s/\(i*\)+\(i*\)+-\(ii*\)+/\2+-\3+/
t end
s/\(i*\)+\(i*\)+-+/null/
t end
s/\(i*\)+\(i*\)+\(i*\)-+\(i*\)/\1+\2+\3-\2+i\4/
b div

:end
s/\(i*\)+-\(i*\)/\1m\1-\2/
:sb2
s/\(i*\)i-i\(i*\)/\1-\2/
t sb2
s/-//
s/\(i*\)m\(i*\)+\(i*\)/\3 \
остаток\:\2 \/\1 /
t res1

s/null\(i*\)/i\1/

:result
s/iiiiiiiiii/ /g
s/ \([0-9]*\)$/ 0\1/g
s/iiiiiiiii/9/g;s/iiiiiiii/8/g;s/iiiiiii/7/g; s/iiiiii/6/g;
s/iiiii/5/g; s/iiii/4/g; s/iii/3/g;s/ii/2/g; s/i/1/g;
s/ /i/g
t result

:res1
s/iiiiiiiiii/_/g
s/_\([0-9]*\) /_0\1/g
s/iiiiiiiii/9/g;s/iiiiiiii/8/g;s/iiiiiii/7/g; s/iiiiii/6/g;
s/iiiii/5/g; s/iiii/4/g; s/iii/3/g;s/ii/2/g; s/i/1/g;
s/_/i/g
t res1
s/ //
s/^$/0/
:quit
```

```bash
$ cat sed7
#!/opt/sfw/bin/gsed -nf
s/$/@/
tx
:x
:y
s/0@/@ /
ty
s/1@/@ |/
ty
s/2@/@ ||/
ty
s/3@/@ |||/
ty
s/4@/@ ||||/
ty
s/5@/@ |||||/
ty
s/6@/@ ||||||/
ty
s/7@/@ |||||||/
ty
s/8@/@ ||||||||/
ty
s/9@/@ |||||||||/
s/@ *//
p
:z
s/| / ||||||||||/ 
tz
s/ *//
p
```

```bash
$ cat sed8
#!/usr/bin/sed -rf
/[^0-9]/ d
:d
s/9\(_*\)$/_\1/
td
s/^\(_*\)$/1\1/; tn
s/8\(_*\)$/9\1/; tn
s/7\(_*\)$/8\1/; tn
s/6\(_*\)$/7\1/; tn
s/5\(_*\)$/6\1/; tn
s/4\(_*\)$/5\1/; tn
s/3\(_*\)$/4\1/; tn
s/2\(_*\)$/3\1/; tn
s/1\(_*\)$/2\1/; tn
s/0\(_*\)$/1\1/; tn
:n
y/_/0/
```

```bash
$ cat sed9
echo '\//\/\/\/\' | sed -e 's/\\/a/g' -e 's/\//\\/g' -e 's/a/\//g'
```

```bash
$ cat sed10
s@^1@i@g
s@^2@ii@g
s@^3@iii@g
s@^4@iiii@g
s@^5@iiiii@g
s@^6@iiiiii@g
s@^7@iiiiiii@g
s@^8@iiiiiiii@g
s@^9@iiiiiiiii@g
s/$/@/g
s/\(i*\)@/\1@\1/g
:a ta
:x
s/@ii/@/g
tx
/@i/ {s/i@i//g;}
s/@//g
s/^$/0/g
s/^i$/1/g
s/^ii$/2/g
s/^iii$/3/g
s/^iiii$/4/g
s/^iiiii$/5/g
s/^iiiiii$/6/g
s/^iiiiiii$/7/g
s/^iiiiiiii$/8/g
```

### Задание #4:

Объяснить работу программы, доказать, что при любых входных данных вывод будет одинаков. 
Объяснить значение каждой команды в конвейре и их назначение в программе.
Объяснить причину использования именно такой последовательности всех утилит.

```bash
    war=peace      ; sleep=cat ;  ask=man ;
 freedom=slavery   ; whole=tee ;  or=more ;
ignorance=strength ; life=pain ;  die=cat ;
echo "Don't worry! " ; dd if=/dev/urandom \
bs=17 count=1 2>/dev/null |openssl base64 |
less|$sleep | more|tee|$or|$die | gsed ':s;
s/\(^\|\n\)\([^\n]\)\([^\n]*\)$/\1\2\n\3/ ;
ts'|gsed -r -n 'x;s/^.*$/iiiiiii/;x;  :s;N;
x;s/^i(i*)$/\1/;x;ts;s/\n//g; s/^.{3}/!?+/;
y!?\!+!lAl!;     s/^(.{3}).(....)./\1 \2 /;
s/ ./ wi/;s/i./i/;h;s/.(.{2}).*/\1/;     G;
s/^(.*)\n(....{3})(..)(.*)$/\2\1\4/;     x;
s/^.*$/+123Mec/;x;:t;N;12{s/(.{13})./\1 /};
11{s/.$/b!/};s/..(b)(!)/\1e\2\2\2/;     :r;
s/!//;tr;x;s/^.//;x;tt;   s/(.).{2}$/\1\n/;
s/\n//g;       17{s/[a-zA-Z0-9=]{4}$/#+?=/;
y.=?.ie.;    x;   s!^.*$!?>d!;    x;    :f;
s/(.)i([^i]*)$/i\1\2/;x;th;:h; ss.ss;x; tf;
s/e(i).../e \1n/; s/i[^l]/f&/};s$\$$.$;p'&&
$ask https://vk.com/id248059105 with love \
2>&1 |tail -1 ;alias cd=exit ;kill -STOP $$
```

### Пример ответа на задание #2:

Команда `sed -n /sentimental/p file` выводит все строки, содержащие `sentimental`. Содержимое файла `file` при этом не изменяется. Без ключевого символа `-n` строки, содержащие `sentimental`, будут выведены дважды.

### Содержание отчета:

В отчет необходимо включить ответы на задания с пояснениями.

### Для успешной защиты обязательно понимание следующих вопросов:

1. что является регулярным выражением в данных примерах?
2. какого типа символы использованы в данных регулярных выражениях?
3. как программно проанализировать код завершения команды sed?
4. в чем отличие утилиты sed от grep?
5. зачем и как работают кавычки и апострофы?
6. какие существуют 28 команд sed?
