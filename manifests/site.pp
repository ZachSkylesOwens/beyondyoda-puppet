import 'classes/*.pp'

$mysql_password = 'password'

class toolbox {
	file { '/usr/local/sbin/puppetsimple.sh':
		owner => root, group => root, mode => 0755,
		content => "#!/bin/sh\npuppet agent --onetime --no-daemonize --verbose $1\n",
	}
}

node 'web01.drpl.sis' {
	include toolbox
	include mysite
}

node 'web02.drpl.sis' {
	include toolbox
	include mysite
}

node 'mysql01.drpl.sis' {
	include toolbox
	include beyondyoda_mysql::server
}

node 'mysql02.drpl.sis' {
	include toolbox
	include beyondyoda_mysql::server
	beyondyoda_mysql::db { 'test':
		user => 'user',
		password => 'password',
	}
}
