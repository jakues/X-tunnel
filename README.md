<h1 align="center">X-tunnel for Raspberry Pi gen 3</h1>

for ssh tunneling

# [ Prerequisites ]

The installation scripts require the following:

* The Raspberry Pi 3 and 4 with operating system [openWRT](https://openwrt.org/toh/raspberry_pi_foundation/raspberry_pi)

# [ Install ]

  * First update repo and install tools
    * `opkg update ; opkg install bash wget libustream-openssl`
  * Then install it
    * `wget --no-check-certificate https://raw.githubusercontent.com/jakues/X-tunnel/master/x -O /usr/bin/x ; chmod +x /usr/bin/x`
  * Type `x setup`

Copyright: https://www.facebook.com/groups/openwrtunnel/
