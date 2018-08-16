.PHONY = install uninstall

NAME = python-simple-server
INSTALL_LOCATION = /opt/${NAME}
SERVICE_SCRIPT = /etc/systemd/system/${NAME}.service

install:
	@sudo cp ${NAME}.service ${SERVICE_SCRIPT}
	@sudo mkdir -p ${INSTALL_LOCATION}
	@sudo cp app.py ${INSTALL_LOCATION}
#	@sudo cp -r public ${INSTALL_LOCATION}
	@sudo systemctl daemon-reload

uninstall:
	@sudo rm -rf ${INSTALL_LOCATION}
	@sudo rm -rf ${SERVICE_SCRIPT}
