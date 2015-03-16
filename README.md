dyndns-refresh
==============

a small bash-script to refresh your dyn A entry. Works with many providers.

features
--------

 - fast update (you can decide, when this script should run and your dyn A entry will be updated immediately, if your provider is fast enough ;) )
 - simple bash-script (you don't have to install a program)
 - automatic log-file (the response of the provider will be logged)

usage
-----

 - clone the repository (for example in your home directory) and make [`dyndns.sh`](dyndns.sh) executeable

```bash
git clone https://github.com/sedrubal/dyndns-refresh.git && cd dyndns-refresh
chmod +x dyndns.sh
```

 - adapt the settings in the script
 - create a logfile (write- and readeable for crontab user):

```bash
sudo touch /var/log/dyndns-refresh.log
sudo chmod 666 /var/log/dyndns-refresh.log
```
 - check, if the script works

```bash
./dyndns.sh
tail /var/log/dyndns-refresh.log
```

 - create a crontab (crontab -e) like this:

```bash
 0 * * * * /home/$user/dyndns.sh >/dev/null 2>&1
 │ └─┴─┴─┴─ every hour, day, month, weekday
 └───────── when minute == 0
```

 - copy the [`dyndns-logrotate`](dyndns-logrotate) to `/etc/logrotate.d/dyndns-refresh`

functionality
-------------

 - a crontab will trigger this script (default: every hour; you can change the interval)
 - this scripts uses wget to call the update-website of the provider. He will notice your ip.
 - the wgetted site will be saved as log

dependencies
------------

 - linux
 - wget
 - cron
 - logrotate

supported providers
-------------------

 - joker.com
 - no-ip.com ?
 - ...

not implemented yet / todo
--------------------------

 - automatic installation and support for crontab
 - automatic generation of update url
 - use curl
 - use logger

license
-------

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a>
<br/>
<span xmlns:dct="http://purl.org/dc/terms/" property="dct:title"><a href="https://github.com/sedrubal/dyndns-refresh">dyndns-refresh</a></span>
 by 
<a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/sedrubal/" property="cc:attributionName" rel="cc:attributionURL">sedrubal</a>
 is licensed under a 
<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.

