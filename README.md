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

 - save the ![dyndns-script](dyndns.sh) (for example in your home directory) and make it executeable
 <pre><code>wget https://github.com/sedrubal/dyndns-refresh/raw/master/dyndns.sh
 sudo chmod +x dyndns.sh </pre></code>
 - adapt the settings in the script
 - create a logfile (write and readeable for crontab user):
 <pre><code>sudo touch /var/log/dyndns-refresh.log
 sudo chmod 666 /var/log/dyndns-refresh.log</pre></code>
 - create a crontab (crontab -e) like this:
 <pre><code>0 * * * * /home/$user/dyndns.sh >/dev/null 2>&1
 │ └─┴─┴─┴─ every hour, day, month, weekday
 └───────── when minute == 0</pre></code>

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

supported providers
-------------------

 - joker.com
 - no-ip.com ?
 - ...

not implemented yet
-------------------

 - automatic installation and support for crontab
 - automatic generation of update url
 - automatic logfile shortener

license
-------

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a>
<br/>
<span xmlns:dct="http://purl.org/dc/terms/" property="dct:title"><a href="https://github.com/sedrubal/dyndns-refresh">dyndns-refresh</a></span>
 by 
<a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/sedrubal/" property="cc:attributionName" rel="cc:attributionURL">sedrubal</a>
 is licensed under a 
<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.
