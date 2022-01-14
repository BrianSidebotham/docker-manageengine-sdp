FROM centos:centos7
WORKDIR /

RUN yum install -y unzip iproute expect wget

COPY ./entry_point.sh /
COPY ./install_manageengineplus.exp /

RUN chmod +x /entry_point.sh \
    && wget https://www.manageengine.com/products/service-desk/91677414/ManageEngine_ServiceDesk_Plus_64bit.bin \
    && chmod +x /ManageEngine_ServiceDesk_Plus_64bit.bin \
    && /install_manageengineplus.exp \
    && echo Installed \
    && chmod 755 /root \
    && rm -f /ManageEngine_ServiceDesk_Plus_64bit.bin

EXPOSE 8080

CMD [ "/entry_point.sh"]
