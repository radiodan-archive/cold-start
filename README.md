cold_start
==========

Build a base radiodan install from a clean raspbian distro.

How to use
----------

1. ssh into pi
2. `sudo apt-get update`
3. `sudo apt-get install upstart`
4. `sudo reboot` and ssh back into the pi
5. `sudo apt-get install puppet-common`
6. `git clone https://github.com/radiodan/cold_start.git`
7. `sudo puppet apply --modulepath=/home/pi/cold_start/modules -e "include radiodan"`
7. Run `sudo raspi-config` as usual to expand the filesystem etc.
