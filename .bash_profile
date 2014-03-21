# =============
# Path Variable
# =============

export PATH="/usr/local/bin:$PATH":~/bin

# =======
# Aliases
# =======

# Nicer List output
alias ll="ls -Glha"

# Clear Apple System Logs
alias clear-apple-system-logs="sudo rm -rfv /private/var/log/asl/*.asl"

# Clear DNS Cache
alias clear-cache="sudo killall -HUP mDNSResponder"

# Edit .bash_profile in Sublime Text 2
alias edit-bash-profile="subl ~/.bash_profile"

# Refresh .bash_profile
alias refresh-bash-profile="source ~/.bash_profile"

# List Functions Defined in .bash_profile or .bashrc
alias list-functions="compgen -A function"

# Fix Typos...
alias cd..="cd .."
alias cd~="cd ~"

# =========
# Functions
# =========

# CD to the path of the front Finder window
function cd-finder() {
	target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
	if [ "$target" != "" ]; then
		cd "$target"; pwd
	else
		echo 'No Finder window found' >&2
	fi
}

# Mkdir and CD into it
function md() {
	mkdir $1 && cd $1
}

# Search History
function search-history() {
	history | grep $1
}

# Get Local / Global IP Addresses
function ip() {

	if [ "$1" = "-g" ]; then
		curl -s http://checkip.dyndns.org | sed 's/[a-zA-Z/<> :]//g'
	elif [ "$1" = "-l" ]; then
		ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'
	else
		echo -e "Local & Global IP Address\n=========================\nOptions: -g for global IP or -l for local IP\n"
		curl -s http://checkip.dyndns.org | sed 's/[a-zA-Z/<> :]//g'
		ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'
	fi
}

# Simple Web Server
function serve() {
	open http://localhost:1337/
	python -m SimpleHTTPServer 1337
}

# New Mean Stack
# see mean.io for instructions
function mean-app() {
	git clone https://github.com/linnovate/mean.git $1
	cd $1
	npm install
}

# New Front End Project
function new-front-end-project() {

	# Make our new directory
	mkdir ~/Sites/$1

	# CD into it
	cd ~/Sites/$1

	# Init an empty Git repo
	git init

	# Pull GitHub FrontEndTemplate repo
	git pull https://github.com/m10l/FrontEndTemplate.git

	# Install Node dependencies
	npm install 

	# Install template dependencies via Bower
	bower install

	# Open dev files in Sublime Text 2
	subl dev/

	# Start Grunt server
	grunt server

}

# Set Up New Angular Project
function new-angular-site() {
	
	# Make our new directory
	mkdir ~/Sites/$1
	
	# CD into it
	cd ~/Sites/$1

	# Scaffold out our project with Yeoman
	yo angular $1

}

# Set Up New WordPress Vagrant Box
function new-wordpress-vagrant-box() {

	# Go to our Sites directory
	cd ~/Sites

	# Clone VagrantPress into a specifed directory
	git clone https://github.com/chad-thompson/vagrantpress.git $1

	# CD into our specified directory
	cd $1

	# Boot our Vagrant Box
	vagrant up

	# Open our website in the browser
	open http://localhost:8080/wordpress

	# Open the WordPress directory in Sublime Text
	subl wordpress

}

# Parse current Git branch
parse_git_branch () {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

# =================
# Fancy Bash Prompt
# =================

export PS1="\n \[\033[0;30m\]================================================\[\033[0m\] \n \n 😺 \[\033[0;34m\]\$(parse_git_branch)\[\033[0m\] \w/ \[\033[0;35m\]❯ \[\033[0m\]
