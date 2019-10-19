#!/usr/bin/perl
use CGI::Carp qw(fatalsToBrowser);

foreach my $pair (split(/&/, $ENV{QUERY_STRING}))
{
	my($name, $value) = split(/=/, $pair);
	$name =~ tr/+/ /;
	$name =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
	$value =~ tr/+/ /;
	$value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
	$INFO{$name} = $value;
}

my @parts=split(/\./,(split(/\?/,$ENV{REQUEST_URI}))[0]);
$ext = $parts[@parts-1];
$ext = "pl" if ($ext eq "");

$port = ($ENV{SERVER_PORT}==80?"":":$ENV{SERVER_PORT}");
$ENV{REQUEST_URI} = (split(/\?/,$ENV{REQUEST_URI}))[0];
$cgi = "http://$ENV{SERVER_NAME}$port$ENV{REQUEST_URI}";

if ($INFO{action} eq "step1") { Step1(); }
if ($INFO{action} eq "step2") { Step2(); }
if ($INFO{action} eq "step3") { Step3(); }

Step1();

sub text
{
	my %text;
	$text{filenotexist} = "<font color=red>Error: File %s was not found.</font><br><br>\n";
	$text{filenotreadable} = "<font color=red>Error: It is not permitted to read the file %s, please set read rights for everyone with your FTP client.</font><br><br>\n";
	$text{filenotwriteable} = "<font color=red>Error: It is not permitted to change the file %s, please set read and write rights for everyone with your FTP client.</font><br><br>\n";
	$text{filenotexecutable} = "<font color=red>Error: It is not permitted to execute the file %s, please set execution rights for everyone with your FTP client.</font><br><br>\n";
	$text{cannotcreatefile} = "<font color=red>Error: File %s could not be created, because write access to the current directory is not permitted. Please create this file by yourself or change the permissions of this directory with you FTP client to write access for everyone.</font><br><br>\n";
	$text{nolanguagefile} = "<font color=red>Error: No language pack found, please copy for example english.lng and english.descr to the server.</font><br><br>\n";
	$text{dirnotexist} = "<font color=red>Error: Directory %s was not found.</font><br><br>\n";
	$text{dirnotexecutable} = "<font color=red>Error: The access permissions for directory %s are wrong, please set read, write and execute rights for everyone with your FTP client.</font><br><br>\n";
	$text{somefilesnotreadable} = "<font color=red>Error: Some files in directory %s are not permitted to be read, please set read rights for everyone with your FTP client.</font><br><br>\n";
	$text{somefilesnotwriteable} = "<font color=red>Error: Some files in directory %s are not permitted to be changed, please set read and write rights for everyone with your FTP client.</font><br><br>\n";
	$text{couldnotwrite} = "<font color=red>Error: File %s could not be opened for writing.</font><br><br>\n";
	$text{differentservers} = "<font color=red>Warning: It seems that the server names in the HTML URL and the script URL are different. Normally this causes JavaScript errors in the web browser (&quot;Permission denied&quot;). Maybe you should change this.</font><br><br>\n";
	$text{couldnotopendir} = "<font color=red>Error: Could not open directory %s, check the access permissions.</font><br><br>\n";

	my $name=shift(@_);

	return sprintf($text{$name},@_);
}

sub checkFiles
{
	my @files=@_;
	my $error;
	
	foreach my $file (@files)
	{
		my $level=0;
		if ($file =~ /^\>/)
		{
			$level=1;
			$file =~ s/^\>//g;
		}
		if ($file =~ /^\*/)
		{
			$level=2;
			$file =~ s/^\*//g;
		}

		if (!-e $file)
		{
			$error .= text('filenotexist',$file);
		}
		elsif ($level==0 && !-r $file)
		{
			if (-o $file)
			{
				chmod(0644,$file);
			}
			else
			{
				$error .= text('filenotreadable',$file);
			}
		}
		elsif ($level==1 && (!-r $file || !-w $file))
		{
			if (-o $file)
			{
				chmod(0644,$file);
			}
			else
			{
				$error .= text('filenotwriteable',$file);
			}
		}
		elsif ($level==2 && (!-r $file || !-w $file || !-x $file))
		{
			if (-o $file)
			{
				chmod(0755,$file);
			}
			else
			{
				$error .= text('filenotexecutable',$file);
			}
		}
	}
	return $error;
}

sub checkDirs
{
	my @dirs=@_;
	my $error;
	
	foreach my $dir (@dirs)
	{
		my $proceed = 1;
		my $write = 0;
		if ($dir =~ /^\>/)
		{
			$write = 1;
			$dir =~ s/^\>//g;
		}
		if (!-e $dir)
		{
			$proceed = 0;
			$error .= text('dirnotexist',$dir);
		}
		elsif (!-r $dir || !-w $dir || !-x $dir)
		{
			if (-o $dir)
			{
				chmod(0755,$dir);
			}
			else
			{
				$proceed = 0;
				$error .= text('dirnotexecutable',$dir);
			}
		}
		
		if ($proceed != 0)
		{
			opendir(DIR,$dir) || error(text('couldnotopendir',$dir),"$cgi?action=step1");
			foreach my $file (readdir(DIR))
			{
				if ($file !~ /^\./)
				{
					if ($write==0 && !-r "$dir/$file")
					{
						if (-o "$dir/$file")
						{
							chmod(0644,"$dir/$file");
						}
						else
						{
							$error .= text('somefilesnotreadable',$dir);
							last;
						}
					}
					elsif ($write!=0 && (!-r "$dir/$file" || !-w "$dir/$file"))
					{
						if (-o "$dir/$file")
						{
							chmod(0644,"$dir/$file");
						}
						else
						{
							$error .= text('somefilesnotwriteable',$dir);
							last;
						}
					}
				}
			}
			closedir(DIR);
		}
	}
	return $error;
}

sub error
{
	my($error,$link)=@_;
	print "Content-type: text/html\n\n";
	
	print "<html><head><title>Error</title></head><body>$error<br><center><a href=\"$link\">Try again</a></center></body></html>";
	exit;
}

sub Step1
{
	@filelist = (">Settings.dat","*chat.$ext");
	
	my $error=checkFiles(@filelist);
	my $warning="";
	if (-e "Directories.dat")
	{
		$error .= checkFiles(">Directories.dat");
	}
	else
	{
		if (!-w ".")
		{
			if (-o ".")
			{
				chmod(0755,".");
			}
			else
			{
				$error .= text('cannotcreatefile',"Directories.dat");
			}
		}
	}
	
	my @languages;
	opendir(DIR,".") || error(text('couldnotopendir',"."),"$cgi?action=step1");;
	foreach my $file (readdir(DIR))
	{
		if ($file =~ /\.lng$/)
		{
			my $language = $file;
			$language =~ s/\.lng$//g;
			my $newerror = checkFiles(">$language.lng",">$language.descr");
			$warning .= $newerror;
			if ($newerror eq "")
			{
				push(@languages,$language);
			}
		}
	}
	closedir(DIR);
	
	if (@languages == 0)
	{
		$error .= text('nolanguagefile');
	}
	
	if ($error ne "")
	{
		error($warning . $error,"$cgi?action=step1");
	}
	
	print "Content-type: text/html\n\n";
	print <<"EOT";
<html>
<head>
	<title>GTChat 0.93 Installation/Update</title>
</head>
<body>
$warning
EOT
	if (-e "Directories.dat")
	{
		print "Trying to load Directories.dat...<br>\n";
		require "Directories.dat";
		print "Ok<br><br>\n";
	}

	print "Trying to load Settings.dat...<br>\n";
	require "Settings.dat";
	print "Ok<br><br>\n";

	$langoptions="";
	foreach my $lang (@languages)
	{
		my $selected=($lang eq $language?"selected":"");
		$langoptions .= "<option value=\"$lang\" $selected>$lang";
	}

	if ($htmlurl eq "")
	{
		$htmlurl = "http://$ENV{SERVER_NAME}$port/gtchat";
	}
	if ($cgiurl eq "")
	{
		@parts = split(/\//,$ENV{REQUEST_URI});
		pop(@parts);
		$cgiurl = "http://$ENV{SERVER_NAME}$port" . join("/",@parts);
	}
	if ($imagesurl eq "")
	{
		$imagesurl = "images";
	}
	if ($sourcedir eq "")
	{
		$sourcedir = "./Sources";
	}
	if ($vardir eq "")
	{
		$vardir = "./Variables";
	}
	if ($templdir eq "")
	{
		$templdir = "./Templates";
	}
	if ($memberdir eq "")
	{
		$memberdir = "./Members";
	}
	if ($roomdir eq "")
	{
		$roomdir = "./Rooms";
	}

	print <<"EOT";
	If the chat is already in use: make sure that noone is in the chat and
	the maintenance mode is switched on (set \$maintenance to 1 in Settings.dat).
	Otherwise there could be some problems afterwards!<br><br>
	<table border=0 width=100%>
	<form method="GET" action="$cgi">
	<input type=hidden name=action value="step2">
	<tr>
		<td>Language pack:</td>
		<td><select name=language>$langoptions</select></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>Absolute URL of the HTML files:</td>
		<td><input type=text name=htmlurl value="$htmlurl"></td>
	</tr>
	<tr>
		<td>URL of the images directory (can be relativ to the HTML-URL):</td>
		<td><input type=text name=imagesurl value="$imagesurl"></td>
	</tr>
	<tr>
		<td>Absolute URL of the CGI scripts:</td>
		<td><input type=text name=cgiurl value="$cgiurl"></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>Sources directory:</td>
		<td><input type=text name=sourcedir value="$sourcedir"></td>
	</tr>
	<tr>
		<td>Variables directory:</td>
		<td><input type=text name=vardir value="$vardir"></td>
	</tr>
	<tr>
		<td>Templates directory:</td>
		<td><input type=text name=templdir value="$templdir"></td>
	</tr>
	<tr>
		<td>Members directory:</td>
		<td><input type=text name=memberdir value="$memberdir"></td>
	</tr>
	<tr>
		<td>Rooms directory:</td>
		<td><input type=text name=roomdir value="$roomdir"></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan=2 align=center><input type=submit value="Apply settings"></td>
	</tr>
	</table>
</body>
</html>
EOT
	exit;
}

sub Step2
{
	$newpermission{admin} = "1";
	$newpermission{admin_banlist} = "1";
	$newpermission{admin_traffic} = "1";
	$newpermission{admin_news} = "1";
	$newpermission{admin_settings} = "3";
	$newpermission{admin_permissions} = "3";
	$newpermission{admin_smileys} = "3";
	$newpermission{admin_aliases0} = "3";
	$newpermission{admin_aliases1} = "3";
	$newpermission{admin_messages} = "3";
	$newpermission{admin_texts} = "3";
	$newpermission{admin_list0} = "3";
	$newpermission{admin_list1} = "3";
	$newpermission{admin_list2} = "3";
	$newpermission{admin_maintenance} = "3";
	
	$newpermission{img} = "1";
	$newpermission{kick} = "1";
	$newpermission{gag} = "1";
	$newpermission{push} = "1";
	$newpermission{broadcast} = "1";
	$newpermission{privaterooms} = "1";
	$newpermission{invite} = "1";
	
	$newpermission{profile_seeemail} = "1";
	$newpermission{profile_seelastlogin} = "1";
	$newpermission{profile_seeip} = "1";
	$newpermission{profile_seepullmode} = "1";
	$newpermission{profile_modify} = "1";
	
	$newpermission{rooms_create} = "-1";
	$newpermission{rooms_createprivate} = "-1";
	$newpermission{rooms_createpermanent} = "1";
	$newpermission{rooms_changeowner} = "1";
	$newpermission{rooms_modify} = "1";
	$newpermission{rooms_createmoderated} = "1";
	$newpermission{rooms_moderate} = "1";
	$newpermission{ignore_max_users} = "1";

	$htmlurl=$INFO{htmlurl};
	$cgiurl=$INFO{cgiurl};
	$imagesurl=$INFO{imagesurl};
	$sourcedir=$INFO{sourcedir};
	$vardir=$INFO{vardir};
	$templdir=$INFO{templdir};
	$memberdir=$INFO{memberdir};
	$roomdir=$INFO{roomdir};
	
	$htmlurl =~ s/\/+$//g;
	$cgiurl =~ s/\/+$//g;
	$imagesurl =~ s/\/+$//g;
	$sourcedir =~ s/\/+$//g;
	$vardir =~ s/\/+$//g;
	$templdir =~ s/\/+$//g;
	$memberdir =~ s/\/+$//g;
	$roomdir =~ s/\/+$//g;

	my $error=checkDirs($sourcedir,">$vardir",$templdir,">$memberdir",">$roomdir");
	unlink("$vardir/online.txt");
	unlink("$vardir/logins.txt");
	my $warning="";
	foreach $file ("$sourcedir/Subs.pl","$templdir/login.html","$memberdir/memberlist.txt")
	{
		if (!-e $file)
		{
			$error .= text('filenotexist',$file);
		}
	}

	if ($htmlurl !~ /^\w*\:\/\//)
	{
		$htmlurl = "http://$htmlurl";
	}
	if ($cgiurl !~ /^\w*\:\/\//)
	{
		$cgiurl = "http://$cgiurl";
	}
	
	if ((split(/\//,$htmlurl))[2] ne (split(/\//,$cgiurl))[2])
	{
		$warning .= text('differentservers');
	}

	if ($error eq "")
	{
		open(FILE,">Directories.dat") || ($error .= text('couldnotwrite',"Directories.dat"));
		print FILE "\$htmlurl = '$htmlurl';\n";
		print FILE "\$cgiurl = '$cgiurl';\n";
		print FILE "\$imagesurl = '$imagesurl';\n";
		print FILE "\$sourcedir = '$sourcedir';\n";
		print FILE "\$vardir = '$vardir';\n";
		print FILE "\$templdir = '$templdir';\n";
		print FILE "\$memberdir = '$memberdir';\n";
		print FILE "\$roomdir = '$roomdir';\n";
		print FILE "1;\n";
		close(FILE);
	}
	
	if ($error ne "")
	{
		error($error,"$cgi?action=step1");
	}

	print "Content-type: text/html\n\n";
	print <<"EOT";
<html>
<head>
	<base href="$htmlurl/">
	<title>GTChat 0.93 Installation/Update</title>
</head>
<body>
$warning
EOT

	print "Trying to load Subs.pl...<br>\n";
	require "$sourcedir/Subs.pl";
	print "Ok<br><br>\n";

	require "Settings.dat";
	$language=$INFO{language};
	foreach my $key (keys %newpermission)
	{
		if (!exists($permission{$key}))
		{
			$permission{$key}=$newpermission{$key};
		}
	}
	if (!exists($image{question}))
	{
		$image{question}="13,14";
	}
	if (!exists($image{at}))
	{
		$image{at}="15,14";
	}
	if (!exists($image{msg}))
	{
		$image{msg}="18,13";
	}
	$toset="use_server_auth=0|use_usernames=1|cookie_name='chat_userdata'|webmaster_email='webmaster\@ihr.server.de'|mailprog='/usr/sbin/sendmail'|allow_guestlogin=1|pull_mode_only=0|max_username_len=15|max_nickname_len=15|max_password_len=10|max_websitetitle_len=50|max_websiteurl_len=50|max_email_len=50|max_roomname_len=15|externalmknod=0|mknodprog='mknod'|mkfifoprog='mkfifo'|display_userlist_shortcuts=1|pwseed='ya'|log_private_msgs=0|alive_test_rate_pull=20|max_users=0|roomlist_cols=0";
	foreach my $var (split(/\|/,$toset))
	{
		my ($name,$value) = split(/=/,$var);
		eval("\$$name = $value if (\$$name eq '');");
	}
	writeSettingsFile();
	
	print <<"EOT";
	The setting files were changed.<br><br>
	If the HTML-URL is correct, the chat help should open in a new window if
	clicking on <a href="commands.html" target="_blank">this link</a>.<br><br>
	If the URL of the images directory is correct, a question mark should appear
	here: <img src="$imagesurl/question.gif" border=0><br><br>
	If it is not the case, check the settings again.<br><br><br><br>
	The next step is converting members and rooms data to the new structure
	(if necessary). Be aware that the new version unlike the old one ignores cases
	in usernames. Make sure that there are no accounts with the same username
	because of this! Double accounts will be deleted when converting.<br><br>
	<table align=center>
	<tr>
		<td align=left><form method="POST" action="$cgi?action=step1"><input type=submit value="Change settings again"></form></td>
		<td align=right><form method="POST" action="$cgi?action=step3"><input type=submit value="Convert data"></form></td>
	</tr>
	</table>
</body>
</html>
EOT

	exit;
}

sub Step3
{
	require "Settings.dat";
	require "Directories.dat";
	require "$sourcedir/Subs.pl";
	
	print "Content-type: text/html\n\n";
	print <<"EOT";
<html>
<head>
	<base href="$htmlurl/">
	<title>GTChat 0.93 Installation/Update</title>
</head>
<body>
EOT

	print "Converting members accounts...<br>\n";

	open(USERS,"$memberdir/memberlist.txt");
	readlock(USERS);
	my @users = <USERS>;
	unlock(USERS);
	close(USERS);
	
	open(USERS,">$memberdir/memberlist.txt");
	lock(USERS);
	
	my $count=0;
	my $count2=0;
	my %names;
	foreach $entry (@users)
	{
		$entry =~ s/[\n\r]//g;
		my ($nick,$name) = split(/\|/,$entry);

		$newusername=lcase($name);
		if (exists($names{$newusername}))
		{
			unlink("$memberdir/$name.dat");
			unlink("$memberdir/$name.queue");
			$count2++;
		}
		else
		{
			$names{$newusername}="";
			if (-e "$memberdir/$name.dat")
			{
				my $newname=toFilename($name);
				rename("$memberdir/$name.dat","$memberdir/$newname.dat");
				$count++;
				if (-e "$memberdir/$name.queue")
				{
					rename("$memberdir/$name.queue","$memberdir/$newname.queue");
				}
			}
			print USERS "$nick|$newusername\n";
		}
	}
	
	unlock(USERS);
	close(USERS);
	
	print "$count account(s) converted, $count2 deleted (because more then one exists)<br><br>\n";

	print "Converting room data...<br>\n";
	if (!-e "$roomdir/roomlist.txt")
	{
		$count=0;
		open(FILE,">$roomdir/roomlist.txt");
		lock(FILE);
		
		opendir(DIR,"$roomdir") || error(text('couldnotopendir',$roomdir),"$cgi?action=step1");;
		foreach my $room (sort {my ($x,$y)=(lcase($a),lcase($b));return $x cmp $y;} readdir(DIR))
		{
			if ($room !~ /\.dat$/i) {next;}
			$room =~ s/\.dat$//i;
			print FILE "$room\n";
	
			open(ROOM, "$roomdir/$room.dat");
			lock(ROOM);
			my @entries=<ROOM>;
			unlock(ROOM);
			close(ROOM);
			$entries[6]=lcase($entries[6]);
			open(ROOM, ">$roomdir/$room.dat");
			lock(ROOM);
			print ROOM "$room\n";
			print ROOM @entries;
			unlock(ROOM);
			close(ROOM);
	
			my $newname=toFilename($room);
			rename("$roomdir/$room.dat","$roomdir/$newname.dat");
			$count++;
		}
	
		unlock(FILE);
		close(FILE);

		print "$count room description(s) converted<br><br>\n";
	}
	else
	{
		print "Seems to be already converted, skipping<br><br>\n";
	}

	print <<"EOT";
	The installation is complete now. If you want to change something, click
	the back button.<br><br>
	If it was a first installation, click to Proceed to the chat and login
	with username <b>admin</b> and password <b>admin</b>. Change this password immediately
	in your profile!<br><br>
	Remove install.$ext from your server now to avoid misuse!<br><br>
	<table align=center>
	<tr>
		<td align=left><form method="POST" action="$cgi?action=step1"><input type=submit value="Back"></form></td>
		<td align=right><form method="POST" action="$cgiurl/chat.$ext"><input type=submit value="Proceed to the chat"></form></td>
	</tr>
	</table>
</body>
</html>
EOT
	exit;
}

1;
