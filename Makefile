PREFIX=/usr/local/bin

install:
	install -Dm755 listen.sh ${PREFIX}/abr-listen
	install -Dm755 notify.py ${PREFIX}/abr-notify