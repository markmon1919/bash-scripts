#!/usr/bin/python

import os
import subprocess


getPath = os.path.expanduser('~/Documents/Scripts/')
scriptsPath = subprocess.check_output("ls -l " + getPath + " | grep -v ^d | awk '{print$9}'", shell=True)
scripts = scriptsPath.split()
otherScriptsPath = subprocess.check_output("ls -la " + getPath + "others/" + " | grep -v ^d | awk '{print$9}'", shell=True)
otherScripts = otherScriptsPath.split()
fetchPlistsPath = subprocess.check_output("ls -la " + getPath + "fetchPlists/" + " | grep -v ^d | awk '{print$9}'", shell=True)
fetchPlists = fetchPlistsPath.split()
os.system("mkdir " + getPath + "compressed")


for name in scripts:
	file_contents = os.system("tar -C " + getPath + " -zvcf " + getPath + "compressed/" + name + ".zip " + name)
 	print (file_contents)

for name in otherScripts:
	file_contents = os.system("tar -C " + getPath + "others/ -zvcf " + getPath + "compressed/" + name + ".zip " + name)
 	print (file_contents)

for name in fetchPlists:
	file_contents = os.system("tar -C " + getPath + "fetchPlists/ -zvcf " + getPath + "compressed/" + name + ".zip " + name)
 	print (file_contents)

os.system("chmod +x " + getPath + "compressed/*.zip")