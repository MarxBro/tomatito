all: install

clean:
	rm /usr/bin/tomatito

install:
	cp tomatito.sh /usr/bin/tomatito
	chmod +x /usr/bin/tomatito
	cp alert.mp3 /usr/share/sounds/alert.mp3
	chmod +r /usr/share/sounds/alert.mp3
