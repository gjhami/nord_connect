#!/usr/bin/gawk -f
{
	if ($1 == "auth-user-pass"){
		print $1 " /home/you/code/boost/nord_connect/creds.txt";
	}
	else {
		print;
	}
}
