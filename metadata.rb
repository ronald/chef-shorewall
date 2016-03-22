name             'chef-shorewall'
maintainer       'Trond Arve Nordheim'
maintainer_email 't@binarymarbles.com'
license          'Apache 2.0'
description      'Installs and configures Shorewall'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.0'

supports         'debian'

recipe           'shorewall', 'Installs and configures Shorewall'

attribute 'shorewall',
  :display_name => 'Shorewall',
  :description => 'Hash of Shorewall attributes.',
  :type => 'hash'

attribute 'shorewall/ip_forwarding',
  :display_name => 'IP Forwarding',
  :description => 'Enable IP Forwarding.',
  :default => 'Keep'
  
attribute 'shorewall/clamp_mss',
  :display_name => 'Clamp MSS',
  :description => 'Clamp MSS to PTMU.',
  :default => 'No'
  
attribute 'shorewall/zones',
  :display_name => 'Shorewall zones',
  :description => 'An array of additional zones to configure in the Shorewall configuration.',
  :type => 'array'

attribute 'shorewall/interfaces',
  :display_name => 'Shorewall interfaces',
  :description => 'An array of additional interfaces to configure in the Shorewall configuration.',
  :type => 'array'
  
attribute 'shorewall/policies',
  :display_name => 'Shorewall policies',
  :description => 'An array of Shorewall policies to add to the Shorewall configuration.',
  :type => 'array'
  
attribute 'shorewall/rules',
  :display_name => 'Shorewall rules',
  :description => 'An array of Shorewall rules to add to the Shorewall configuration.',
  :type => 'array'

attribute 'shorewall/masquerades',
  :display_name => 'Masquerades',
  :description => 'An array of Shorewall masquerading rules to add to the Shorewall configuration.',
  :type => 'array'

attribute 'shorewall/tunnels',
  :display_name => 'Tunnels',
  :description => 'An array of Shorewall tunnel definitions to add to the Shorewall configuration.',
  :type => 'array'
