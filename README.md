dyndns-refresh
==============

a small bash-script to refresh your dyn A entry. Works with many providers.

features
--------

 - simple bash-script (you don't have to install a program)
 - logging (the response of the provider will be logged)

usage
-----

 - clone the repository (for example in your home directory) and make [`dyndns.sh`](dyndns.sh) executeable

```bash
git clone https://github.com/sedrubal/dyndns-refresh.git && cd dyndns-refresh
chmod +x dyndns.sh
```

 - copy the [`config.cfg.example`](config.cfg.example) to `config.cfg` and edit it. You only have not to provide every variable:
```bash
cp config.cfg.example config.cfg
editor config.cfg
# provide following configs:
# - $url
# - $loggerpath
# - $logfile
```

 - set file permissions:

```bash
sudo chown -R $USER:$GROUP .
sudo chmod 400 config.cfg
```
 - check, if the script works

```bash
./dyndns.sh
tail $logfile
```

 - create a crontab (`crontab -e $USER`) like this:

```bash
 0 * * * * /home/$USER/dyndns.sh >/dev/null 2>&1
 │ └─┴─┴─┴─ every hour, day, month, weekday
 └───────── when minute == 0
```

functionality
-------------

 - a crontab will trigger this script (default: every hour; you can change the interval)
 - this scripts uses `curl` to request the update-website of the provider. He will notice your ip.
 - the output will be saved as log

dependencies
------------

 - unix based os
 - curl
 - cron
 - logger
 - (logrotate)

supported providers
-------------------

 - joker.com
 - no-ip.com ?
 - ...

not implemented yet / todo
--------------------------

 - (automatic installation and support for crontab)

license
-------

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a>
<br/>
<a href="https://github.com/sedrubal/dyndns-refresh">dyndns-refresh</a> by <a href="https://github.com/sedrubal/">sedrubal</a>
 is licensed under a <a href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.

