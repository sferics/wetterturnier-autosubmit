# wetterturnier-autosubmit
A small python script which does the submission the bet submission on "wetterturnier.de". The only thing needed is a small ASCII-text file. The python code also returns error codes fetched from either wget or the server side autosubmit script on wetterturnier.de (e.g., if login was incorrect). ©odebase by ®eto Stauffer and forked by myself.

DESCRIPTION:

A lot of stuff can go wrong with the URL's as they are not as easy to read at all. Therefore RETO wrote a small python script which does the submission for you. The only thing needed is a small ASCII-text file. The python code also returns error codes fetched from either wget or the server side autosubmit script on wetterturnier.de (e.g., if login was incorrect).Script Usage:python autosubmit.py -f MyFile.txtHere is an example of such a file (note that the template contains some more comments and help descriptions, this is the short form):

# -----------------------------------------------
# General
# -----------------------------------------------
[general settings]

url       =  https://www.wetterturnier.de/autosubmit/
logfile   =  autosubmit_%city%_%user%.txt
user      =  USERNAME
password  =  PASSWORD
city      =  IBK
#tdate     =  YYYY-mm-dd

# -----------------------------------------------
# Parameter settings.
# -----------------------------------------------
[parameters]
RR_1  =         3.2
RR_2  =         2.4
fx_1  =         0
fx_2  =         25
N_1   =          8
N_2   =          5

NEW: the optional "tdate" setting can be given e.g. to send a belated automaton/MOS submission. This is only allowed for "Wetterturnier Admin" users (all MOSes have this capability)! The privileges get checked during the procedure and if the user sending the data is no admin, AUTOSUBMIT ERRORCODE 403 is returned.Should be relatively straight forward. The python script can be found here (version 0.1-3)  including the template as shown above. Developed for "python 2.7.6" using base packages "optparse", "ConfigParser", "subprocess", and "re". The tarball includes a few test-files (with missing/additional parameters/days). As a template you should use the one with the correct input called autosubmit_MyFile.txt.There are a few extra options, please call with option "--help" to get the (minimalistic) usage of the script.python autosubmit.py --helpWhat happens if a parameter is missingThe script automatically checks if (for a given city) a parameter was not set. You'll get a warning message and the script will stop - the data wont be stored in the database at all as we can't judge bets where one or more forecasts are missing.PARSING POST PARAMETERS

=======================
Parsing parameters.
Found city Innsbruck (IBK,ID 4) for input IBK
[!] Parameter "FF" missing for forecast day "1". If not all parameters are sent we cannot store your forecast/bet!
AUTOSUBMIT ERRORCODE 15

What happens if a day is missing?
Here the same holds as for "a parameter is missing". The script won't store any data as we can't judge bets with missing forecasts at all.

PARSING POST PARAMETERS
=======================
Parsing parameters.
Found city Innsbruck (IBK,ID 4) for input IBK
[!] While checking parameters: The wetterturnier expects to get data for the next 2 days. Day "2" seems not to be delivered! Stop!
AUTOSUBMIT ERRORCODE 15

What if my script sends more data than expected?
Well, that's no problem at all. The idea is that the wetterturnier takes what it needs. if you are delivering more data or more forecast days these days will be dropped. This gives you a note, but the necessary forecast values will be stored.

Additional parameter:  IGNORED PARAMETERS
  ------------------
  Ignored: day_1 ZZ: Forecast parameter ZZ for day 1 ignored. This was not requested for this city.  Everything fine. This is just a note that you are sending more data than necessary.
  Ignored: day_2 YY: Forecast parameter YY for day 2 ignored. This was not requested for this city.  Everything fine. This is just a note that you are sending more data than necessary.
  Additional day:  IGNORED PARAMETERS
  ------------------
  Ignored: day_3: Forecasts for day 3 ignored. They were not requested. Everything fine. This is just a note that you are sending more data than necessary.
