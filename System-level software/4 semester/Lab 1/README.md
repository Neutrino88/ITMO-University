# Лабораторная работа #1

Написать интерактивную программу (скрипт) на языке shell, которая выводит список действий с номерами и ожидает ввода номера пункта, после чего начинает выполнение заданных в этом пункте команд. Скрипт должен корректно обрабатывать ситуацию окончания входного потока данных и позволять работать с относительными и абсолютными именами файлов и каталогов, которые могут содержать: пробелы и символы табуляции; символы `'*'`, `'?'`, `'['`, `']'`, `'-'`, `'~'`, `'$'` или состоять только из них. 

Для команд удаления необходимо запрашивать собственное подтверждение дополнительно. Текст запроса должен соответствовать системному (выводимому командой rm). Ожидание ввода ответа происходит на новой строке. 

Организовать обработку ошибок, например, при отсутствии удаляемого файла, для чего перенаправить вывод системных сообщений об ошибках в файл-журнал с именем `lab1_err`, расположенном в домашней директории, и выдать свое сообщение на стандартный поток ошибок. 

Каждый запрос на ввод должен сопровождаться сообщением на отдельной строке, содержащим информацию о том, какие данные должны быть введены. Ожидание ввода происходит с новой строки. 

Выход из скрипта должен осуществляться только при выборе соответствующего пункта меню или окончании стандартного потока ввода. 

Каждый аргумент должен подаваться программе отдельной строкой. Например, нужно скопировать файл, тогда действия пользователя должны быть следующие:

1. Ввод числа, который соответствует пункту меню "Скопировать файл". Enter.
2. Ввод имени файла, который нужно скопировать. Enter.
3. Ввод пути, куда этот файл должен быть скопирован. Enter.

Меню должно выводиться при запуске скрипта и после каждого выполнения пункта. 

Исходный код лабораторной работы должен находиться в системе контроля версий, развёрнутой на helios. (`svn help`, `git help`).

### Вариант #7

1. Напечатать имя текущего каталога
2. Сменить текущий каталог
3. Выполнить введенную команду
4. Создать каталог
5. Удалить каталог вместе с его содержимым
6. Выйти из программы
