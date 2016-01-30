#! /usr/bin/perl

my $devbox_domain_name = `cat ~/.boost/devbox_domain_name`;
chomp($devbox_domain_name);

my $user_name = `cat ~/.boost/user_name`;
chomp($user_name);

if ($ARGV[0] eq 'shr') {
    system('ssh root@' . get_server($ARGV[1]));
}

if ($ARGV[0] eq 'sh') {
    system('ssh ' . $user_name . '@' . get_server($ARGV[1]));
}

if ($ARGV[0] eq 'gg') {
    system( 'git grep -in ' . '"'
          . $ARGV[1] . '"'
          . '  | perl -e \'my $i=1; while (<>) {$_ =~ s/([^:]+):(\d+):(.*)/$1:$2 $3/;print "-",($i++)," $_"}\'  | tee /tmp/last_gg_list  | grep -i --color=always '
          . '"'
          . $ARGV[1] . '"'
          . '  | less -FRX');
}

if ($ARGV[0] eq 'ec') {
    my $line       = $ARGV[1];
    my $line_found = `if [ -f /tmp/last_gg_list ]; then grep -e "^-$line " /tmp/last_gg_list;fi`;
    my $c          = '';
    if ($line_found) {
        $c = `echo "$line_found" | cut -d' ' -f 2-2`;
    } else {
        $c = $ARGV[1];
    }
    #system('subl -b ' . $c);
    system('atom ' . $c);
}

if ($ARGV[0] eq 'ff') {
    system( 'find .  | grep -i "' . '"'
          . $ARGV[1] . '"'
          . '"  | perl -e \'my $i=1; while (<>) {print "-",($i++)," $_"}\'  | tee /tmp/last_gg_list  | grep -i --color=always "' . '"'
          . $ARGV[1] . '"'
          . '" | less -FRX');
}

sub get_server {
    my $param = shift;

    my $number_of_domains = `cat ~/.boost/subdomain_list |egrep '^([^\.]+\.){3,6}\t'|cut -s -f1|sed 's/.\$//'|grep -v drac|egrep "$param" |wc -l|tr -d ' '`;
    chomp($number_of_domains);
    if ($number_of_domains eq 1) {
        return `cat ~/.boost/subdomain_list |egrep '^([^\.]+\.){3,6}\t'|cut -s -f1|sed 's/.\$//'|grep -v drac|egrep "$param" `;
    }

    if ($param !~ /\./) {
        my $cmd    = 'select i in `cat ~/.boost/subdomain_list|sort|egrep \'^([^\.]+\.){3,6}\t\'|cut -s -f1|sed \'s/.$//\'|grep -v drac|egrep "' . $param . '"`; do echo $i;break;done';
        my $domain = `$cmd`;
        chomp($domain);

        return $domain;
    }

    return $param;
}
