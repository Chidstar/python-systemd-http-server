.PHONY = systemd_install systemd_uninstall docker_up docker_destroy

NAME = python-systemd-http-server
INSTALL_LOCATION = /opt/${NAME}
SERVICE_SCRIPT = /etc/systemd/system/${NAME}.service

systemd_install:
	@sudo cp ${NAME}.service ${SERVICE_SCRIPT}
	@sudo mkdir -p ${INSTALL_LOCATION}
	@sudo cp app.py ${INSTALL_LOCATION}
	@sudo cp -r public ${INSTALL_LOCATION}
	@sudo systemctl daemon-reload

systemd_uninstall:
	@sudo rm -rf ${INSTALL_LOCATION}
	@sudo rm -rf ${SERVICE_SCRIPT}

docker_up:
	@docker build -t chidstar/${NAME}:latest . 
	@docker run -d -p 9000:9000 --name ${NAME} chidstar/${NAME}

docker_destroy:
	@docker stop ${NAME}
	@docker rm ${NAME}
	@docker rmi chidstar/${NAME}


