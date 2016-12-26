all: install

clean:
	rm /usr/bin/tomatito

install:
	cp tomatito.sh /usr/bin/tomatito
	chmod +x /usr/bin/tomatito
