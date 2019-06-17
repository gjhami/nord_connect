#!/usr/bin/gawk -f
{
  home = "/home/you"
	if ($1 == "auth-user-pass"){
		print $1 $home "/code/boost/nord_connect/creds.txt";
	}
	else {
		print;
	}
}
