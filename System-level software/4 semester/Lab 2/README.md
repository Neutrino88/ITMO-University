# Лабораторная работа #2

Написать два скрипта на языке shell, которые выводят списки:

1. 
    * имён файлов в текущем каталоге, являющихся прямыми ссылками на указанный файл. Список отсортировать по времени доступа;
    * пользователей, принадлежащих к более чем указанному количеству групп.
2. 
    * имён каталогов в указанном каталоге, имеющих не менее одного подкаталога. Список отсортировать по времени модификации;
    * групп, которым принадлежат более чем указанное количество пользователей.
3. 
    * имён файлов в текущем каталоге, являющихся косвенными ссылками на указанный файл. Список отсортировать по времени изменения метаинформации;
    * пользователей принадлежащих указанной группе.
4.
    * исполняемых файлов, которые могут быть выполнены текущим пользователем без указания пути к ним. Список отсортировать по алфавиту в обратном порядке;
    * пользователей, которым принадлежит процессов более указанного количества.
5.
    * имён процессов и их аргументов указанной группы;
    * имён каталогов в указанном каталоге, содержащих файлы, но не имеющих подкаталогов.
6.
    * пользователей, заходивших в систему в течении текущего дня;
    * файлов в указанном каталоге, имена которых состоят не только из букв латинского алфавита. Список отсортировать по размеру файла.
7.    
    * пользователей, которым запрещено заходить в систему;
    * файлов в указанном каталоге, являющихся pipe, открытых на запись каким-либо процессом.
 
Если не указано другого, все списки должны быть отсортированы по алфавиту. 
Вся необходимая информация должна передаваться в скрипты через аргументы командной строки.