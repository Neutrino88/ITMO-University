# Домашнее задание по perl

В отчёт должны быть включены следующие пункты:

1. Пусть переменная var имеет значение abc123. Определите, что возвращают следующие выражения - true или false
```bash
$var =~ /./
$var =~ /[A-Z]*^/
$var =~ /(\d)2(\1)/
$var =~ /abc$/
$var =~ /1234?/
```

2. Пусть $var имеет значение abc123abc. Какое значение примет $var после следующих подстановок
```bash 
$var =~ s/abc/def/;
$var =~ s/(?<=\d)[a-z]+/X/g;
$var =~ s/B/W/i;
$var =~ s/(.)\d.*\1/d/;
$var =~ s/(\d+)/$1*2/e;
```

3. Чему соответствуют следующие шаблоны
```bash /a|bc*/
/[\d]{1,3}/
/\bc[aou]t\b/
/(xy+z)\.\1/
/^$/
```

4. Написать шаблоны, соответствующие следующим примерам
    * не менее пяти маленьких латинских букв, либо буква "а", если она стоит в начале строки
    * цифра 1 или слово "one" (в любом регистре)
    * число, возможно, дробное (с десятичной точкой)
    * любая буква, за которой следует гласная, повторяется еще раз (пример: "pop", "fifth", "daddy")
    * хотя бы один "+"
    
5. Разобрать следующие команды (на защите быть готовым отвечать устно).
```bash
perl -lne 'print if /((?<q>w)|a)(?(<q>)e|r)/'
perl -lpe '$p = qr/(\((?:[^()]++|(?-1))*+\))/; $_/=2 unless /x $p \+ y $p/x'
perl -lne 'next if /[^a-z]/i;$v="aiueo";print if /^[^$v]?([$v][^$v])*[$v]?$/i'
perl -lne '@c=();for(split""){if(y/([{/)]}/){push@c,$_;next}if(/[])}]/){@c=(1),last if($_ ne pop@c);next}}print"F" if@c'
perl -lpe '/^[^][{}()]*(([({[])((?:[^][{}()]*+|(?1)))*(??{($0=$2)=~y|([{|)]}|;"\\$0"}))/||($_=$.)'
perl '-es!!),-#(-.?{<>-8#=..#<-*}>;*7-86)!;y!#()-?{}!\x20/`-v;<!;s++$_+ee'
perl -pe 11..exit
perl -pe 'print+(<>)[~9..-1]'
perl -pe '$\=$_.$\}{'
perl -CSD -Mutf8 -0pe 's@^\* (.*?)[\r\n]+@<h3>$1</h3>@g' *
perl -alne '$F[0]||next;push@{$A{shift@F}}," - @F"}{$,=$\;print$_,@{$A{$_}}for keys%A'
perl -le '*fu=sub{print@_};$v="japh,";*U=\$v;fu(bare);print fu($U)'
perl -e 'chomp(@n=<>);open STDIN,">&STDERR";exec"vi",@n'
perl -le 'local$z=2;my$z=1;print$z==$::z'
perl -le 'eval "use ${_dir}::$_", $_modules{$_} += defined $@ ? 0 : 1 for 
map { s,.*/,,; s/.pm$//r } glob "$_dir/*.pm"; 
eval "$_\->check_remote(\$target_ip, \$HOSTS)" and $prefix = $_ for 
map { s,^\d+_,,r } keys %_modules; 
exit 2 unless $prefix'
perl -le' 
@a= (1,2); 
$b[0]= () = (1,2); 
$b[1]= () = @a; 
$b[2]= @_ = (1,2); 
$b[3]= @_ = @a; 
$b[4]= @{[]} = (1,2); 
$b[5]= () = split"",12; 
$b[6]= ($z) = split"",12; 
$b[7]= ($z,$x) = split"",12; 
$b[8]= ($z,$x,$c) = split"",12; 
$b[9]= ($z,$x,$c,$v) = split"",12; 
print for @b'
perl -le '
      $LOVE=               AMOUR.
    true.cards.        ecstacy.crush
  .hon.promise.de    .votion.partners.
 tender.truelovers. treasure.affection.
devotion.care.woo.baby.ardor.romancing.
enthusiasm.fealty.fondness.turtledoves.
lovers.sentiment.worship.sweetling.pure
.attachment.flowers.roses.promise.poem;
 $LOVE=~ s/AMOUR/adore/g; @a=split(//,
  $LOVE); $o.= chr (ord($a[1])+6). chr
   (ord($a[3])+3). $a[16]. $a[5]. chr
    (32). $a[0]. $a[(26+2)]. $a[27].
      $a[5].$a[25]. $a[8].$a[3].chr
        (32).$a[29]. $a[8].$a[3].
          $a[62].chr(32).$a[62].
           $a[2].$a[38].$a[4].
               $a[3].".";
                 print
                  $o'
```
