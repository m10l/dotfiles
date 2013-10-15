# =============
# Path Variable
# =============

export PATH="/usr/local/bin:$PATH":~/bin

# =======
# Aliases
# =======

# Nicer List output

alias ll="ls -Glha"

# Global IP Address

alias ip="curl -s http://checkip.dyndns.org | sed 's/[a-zA-Z/<> :]//g'"

# Fix Typos...

alias cd..="cd .."

# =========
# Functions
# =========

# Simple Web Server

function serve {
	open http://localhost:1337/
	python -m SimpleHTTPServer 1337
}

# New Front End Project

function new-front-end-project {

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

function new-angular-site {
	
	# Make our new directory
	mkdir ~/Sites/$1
	
	# CD into it
	cd ~/Sites/$1

	# Scaffold out our project with Yeoman
	yo angular $1

}

# Set Up New WordPress Vagrant Box

function new-wordpress-vagrant-box {

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

# Search History

function search-history {
	history | grep $1
}

# =================
# Fancy Bash Prompt
# =================

export PS1="\n \[\033[0;30m\]================================================\[\033[0m\] \n \n 😺  \w/ \[\033[0;35m\]❯ \[\033[0m\]"
