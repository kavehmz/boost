#! /usr/bin/perl
$numArgs = $#ARGV + 1;

my $devbox_domain_name = `cat ~/.boost/devbox_domain_name`;
chomp($devbox_domain_name);

my $user_name = `cat ~/.boost/user_name`;
chomp($user_name);


if ($numArgs == 0) {
    print "No command was give.\n";
}

if ($ARGV[0] eq 'kv') {
    system('ssh root@'.get_server('kv'));
}

if ($ARGV[0] eq 'shr') {
    system('ssh root@' . get_server($ARGV[1]));
}

if ($ARGV[0] eq 'sh') {
    system('ssh '.$user_name.'@' . get_server($ARGV[1]));
}

if ($ARGV[0] eq 'bsync') {
    system('rsync -va --delete /Users/'.$user_name.'/Office/bom/ root@'.$devbox_domain_name.':/home/git/bom');
}

if ($ARGV[0] eq 'apr') {
    system('rm /etc/rmg/apache/rmg_apache.conf;/etc/init.d/rmg_apache  restart;tail -f /var/log/httpd/error.log -n 0');
}

if ($ARGV[0] eq 'rapr') {
    system('ssh root@'.$devbox_domain_name.' "rm /etc/rmg/apache/rmg_apache.conf;/etc/init.d/rmg_apache  restart;tail -f /var/log/httpd/error.log -n 0"');
}

if ($ARGV[0] eq 'ngr') {
    system('rm /etc/rmg/nginx/rmg_nginx_proxy.conf;/etc/init.d/rmg_nginx_proxy restart;tail -f /var/log/httpd/proxy-access.log');
}

if ($ARGV[0] eq 'rngr') {
    system(
        'ssh root@'.$devbox_domain_name.' "rm /etc/rmg/nginx/rmg_nginx_proxy.conf;/etc/init.d/rmg_nginx_proxy restart;tail -f /var/log/httpd/proxy-access.log"'
    );
}

if ($ARGV[0] eq 'au') {
    system('sudo apt-get update');
    system('sudo apt-get dist-upgrade');
}

if ($ARGV[0] eq 'die') {
    system('sudo pm-suspend');
}

if ($ARGV[0] eq 'gg') {
    system( 'git grep -n '
          . $ARGV[1]
          . '  | perl -e \'my $i=1; while (<>) {$_ =~ s/([^:]+):(\d+):(.*)/$1:$2 $3/;print "-",($i++)," $_"}\'  | tee /tmp/last_gg_list  | grep --color=always '
          . $ARGV[1]
          . '  | less -FRX');
}

if ($ARGV[0] eq 'ec') {
    my $line       = $ARGV[1];
    my $line_found = `grep -e "^-$line " /tmp/last_gg_list`;
    my $c          = '';
    if ($line_found) {
        my $c = `echo "$line_found" | cut -d' ' -f 2-2`;
    } else {
        $c = $ARGV[1];
    }
    system('subl -b ' . $c);
}

if ($ARGV[0] eq 'ff') {
    system( 'find ./  | grep "'
          . $ARGV[1]
          . '"  | perl -e \'my $i=1; while (<>) {print "-",($i++)," $_"}\'  | tee /tmp/last_gg_list  | grep --color=always "'
          . $ARGV[1]
          . '" | less -FRX');
}

sub get_server {
    my $param = shift;

    if (not $param or $param eq 'kv') {
        return $user_name.'.'.$devbox_domain_name;
    }

    if ($param !~ /\./) {
        my $cmd = 'select i in `grep "'.$param.'" ~/.boost/subdomain_list`; do echo $i;break;done';
        my $domain = `$cmd`;
        chomp($domain);

        return  $domain;
    }

    return $param;
}