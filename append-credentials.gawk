#!/usr/bin/gawk -f
{ 
	if ($1 == "auth-user-pass"){
		print $1 " /home/you/code/ratings-boost/test.txt";
	}
	else {
		print;
	}
}
