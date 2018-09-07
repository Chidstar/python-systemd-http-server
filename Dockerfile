FROM python
COPY app.py /opt/python-systemd-http-server/app.py
COPY public /opt/python-systemd-http-server/public
ENTRYPOINT ["/opt/python-systemd-http-server/app.py"]

