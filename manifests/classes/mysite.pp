class mysite {
	include apache

	file { '/etc/apache2/sites-enabled/mysite.conf':
		owner => root, group => root, mode => 0644,
		source => "puppet:///files/mysite/mysite_apache.conf",
		notify => Service['apache2'],
	}

	file { '/home/www':
		ensure => directory,
	}

	file { '/home/www/mysite.drpl.sis':
		ensure => directory,
	}

	file { '/home/www/mysite.drpl.sis/index.html':
		owner => root, group => root, mode => 0644,
		source => "puppet:///files/mysite/www/index.html",
	}
}

