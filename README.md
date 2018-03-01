SCRIPT NAME	Description	Usage
AHA_fix	Flushes DNS.	AppleConnect related issues
	Kills Process and Services for Safari, iLog, SafeView,	 - can't login to AppleConnect
	AppleConnect, Avalon and FortiClient.	iLog related issues
	Back-up Safari Bookmarks.	 - iLog dashboard
	Hang-Up mDNSResponder	 - iLog AUX issues
	Clears All Caches	 - can't hear voice in iLog
	Clears All AppleConnect Network Settings	 - can't launch iLog
	Clears All AppleConnect Settings	 - can't login to iLog
	Clears All iLog Settings	Avalon related issues
	Clears All SafeView Settings	 - can't launch Avalon Desktop
	Clears All Avalon Settings	SafeView related issues
	Removes Temporary Files	 - cant' launch SafeView
	Imports Safari Bookmarks	 - screensharing issues
	Sets Computer/Host Name & Department from VPN cert	RONA's
	Changes Ownership to root:wheel à SafeView, iLog, AppleConnect & FortiClient	 - can't hear voice over phone
	Changes Permissions to 755 à SafeView, iLog, AppleConnect & FortiClient	 - can't answer / rolled over
	Restarts Mac	
safariReset	Flushes DNS.	Safari Related Issues
	Kills Safari Process and Services	 - can't browse any website
	Hang-Up mDNSResponder	
	Back-up Safari Bookmarks.	
	Clears All Caches	
	Clears All Cookies	
	Clears All History	
	Removes Temporary Files	
	Imports Safari Bookmarks	
refreshAll	Flushes DNS.	Mac is running slow
	Kills Process and Services for Safari, iLog, SafeView,	Mac is hanging up
	AppleConnect, Avalon and FortiClient.	
	Hang-Up mDNSResponder	
	Clears All Caches	
	Removes Temporary Files	
	Changes Ownership to root:wheel à SafeView, iLog, AppleConnect & FortiClient	
	Changes Permissions to 755 à SafeView, iLog, AppleConnect & FortiClient	
fortiReset	Flushes DNS.	FortiClient related issues
	Back-ups FortiClient profile	 - can't launch FortiClient
	Kills FortiClient Process and Services	 - can't connect to FortiClient
	Hang-Up mDNSResponder	 - recreate FortiClient profile
	Removing all Forticlient services, libraries and settings	
	Clears All Caches	
	Removes Temporary Files	
	Imports FortiClient profile	
	Changes Ownership to root:wheel àFortiClient	
	Changes Permissions to 755 à FortiClient	
keychainFix	Flushes DNS.	Keychain related issues
	Kills Process and Services for Safari, iLog, SafeView,	 - clear all items in Keychain Access
	AppleConnect, Avalon and FortiClient.	 - removes all startup keychain problems
	Hang-Up mDNSResponder	 - login issues
	Back-up Safari Bookmarks.	
	Clears All Caches	
	Clears All AppleConnect Network Settings	
	Clears All AppleConnect Settings	
	Clears All iLog Settings	
	Clears All SafeView Settings	
	Clears All Avalon Settings	
	Removes Temporary Files	
	Imports Safari Bookmarks	
	Changes Ownership to root:wheel à SafeView, iLog, AppleConnect & FortiClient	
	Changes Permissions to 755 à SafeView, iLog, AppleConnect & FortiClient	
	Removes All Keychain Items	
	Restarts Mac	
adobeconnectFix	Flushes DNS.	AdobeConnect related issues
	Kills Safari Process and Services	 - can't install AdobeConnect
	Hang-Up mDNSResponder	 - AdobeConnect opens on Safari
	Back-up Safari Bookmarks.	 - flash plugin issues in Adobe
	Clears All Caches	
	Clears All Cookies	
	Clears All History	
	Removes Temporary Files	
	Imports Safari Bookmarks	
	Removes FlashPlayer Plugin	
	Clear All AdobeConnect Settings	
	Changes Ownership to root:wheel à SafeView, iLog, AppleConnect & FortiClient	
	Changes Permissions to 755 à SafeView, iLog, AppleConnect & FortiClient	
ADP_fix	Flushes DNS.	ADP related issues
	Kills Safari Process and Services	 - can't browse ADP website
	Hang-Up mDNSResponder	 - java issues in ADP
	Back-up Safari Bookmarks.	 - flash plugin issues in ADP
	Clears All Java Plugins	
	Clears All Caches	
	Clears All Cookies	
	Clears All History	
	Removes Temporary Files	
	Imports Safari Bookmarks	
	Disable Block Pop-ups in Safari	
	Download and Install Java JRE Plugin	
checkJitter	Flushes DNS.	Network related issues
	Pings Router 25 times	 - intermittent connection
	Pings GreenVille VPN 25 times	 - slow network connection
	Pings Phoenix VPN 25 times	 - network dropping
	Pings Google DNS 25 times	
	Displays max, min and average	
	Displays results for packets transmitted	
	Displays results for packets received	
	Displays results for packets loss	
	Displays jitter results	
	Displays results with rating (EXCELLENT, VERY GOOD, GOOD, FAIR, BAD & POOR)	
	Conducts speedtest and prints results (download and upload speed)	
userAccountFix	Checks the largest folder size on the /Users folder dir	User account related issues
	Matches the /Users folder dir to account name	 - make sure to run script on an admin user account "localadmin, admin, _casper"
	Gets the accounts RealName, RecordName and NFSHomeDir	 - fixes duplicate user account on "workathomeagent"
	Removes all other paths in /Users except admin accounts	 - matches the correct accountname to user home path
	Removes all other user accounts	- removes all users except "admin accounts"
	Migrates current /Users/path to /Users/workathomeagent	 - fixes login issues for workathomeagent credentials
	Migrates current Account to workathomeagent	
	Links RealName, RecordName and NFSHomeDirectory to workathomeagent path	
	Changes Ownership of /Users/workathomeagent to workathomeagent	
	Changes Permissions of /Users/workathomeagent to 755	
	Restarts Mac	
messagesFix	Flushes DNS.	Messages/Jabber related issues
	Kills Process and Services for Messages.	 - can't login to Messages/Jabber
	Hang-Up mDNSResponder	 - can't connect to Messages/Jabber
	Clears All Caches	
	Clears All Messages Settings	
	Deletes "spark.concentrix.com" certificate	
