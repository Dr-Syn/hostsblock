clean:
	rm hostsblock.deb
all: 
	dpkg-deb -b debian hostsblock.deb
install:
	sudo dpkg -i hostsblock.deb
