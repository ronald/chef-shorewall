## DESCRIPTION

Manages the Shorewall configuration for a node.

## REQUIREMENTS

Only tested on Debian 6.0.

## USAGE

The shorewall:default recipe checks for Shorewall rules defined via attributes on the node.

````ruby
override_attributes(
  :shorewall => {
    :zones => ['vpn ipv4'], # optional
    :interfaces => ['vpn tun0 - routeback'], # optional
    :rules => ['ACCEPT pub loc udp 1194'], # optional
    :policies => ['vpn loc ACCEPT', 'vpn pub ACCEPT'], # optional
    :masquerades => ['eth0 10.0.1.0/24'], # optional
    :clamp_mss => 'No', # optional
    :ip_forwarding => 'Keep' # optional
  }
)
````
