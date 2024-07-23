FROM ubuntu:24.04

RUN apt update && apt install -y \
  build-essential \
  libssl-dev \
  libcurl4-openssl-dev \
  libpq-dev \
  git

RUN echo "net.ipv4.tcp_mtu_probing=40" >> /etc/sysctl.conf
RUN echo "net.ipv6.conf.all.disable_ipv6=yes" >> /etc/sysctl.conf
RUN sysctl -p /etc/sysctl.conf
COPY . .

RUN ip link add zs1 type zs1
RUN ip addr add 192.0.2.1/24 brd 192.0.2.255 dev zs1

RUN echo "options ipv6 disable=1" >> /etc/modprobe.d/ipv6.conf
RUN update-initramfs -u

CMD /zscaler
