PREFIX="${HOME}/.local"

install:
	install -Dm755 listen.sh ${PREFIX}/bin/abr-listen
	install -Dm755 kill.sh ${PREFIX}/bin/abr-kill
	install notify-send.lua ${PREFIX}/share/notify-send.lua