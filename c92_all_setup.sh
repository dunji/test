yum update -y
yum install -y vim expect crontabs wget net-tools screen lm_sensors
yum install -y epel-release
yum install -y openconnect

sed -i 's/enforcing/disabled/g' /etc/selinux/config
systemctl stop firewalld.service
systemctl disable firewalld.service
systemctl start crond.service
systemctl enable crond.service
chmod +x /etc/rc.d/rc.local
echo -e "\n"                                          >> /etc/rc.local
echo -e "rm -rf /var/log/shadowsocksr.log"            >> /etc/rc.local
echo -e "sleep 15"                                    >> /etc/rc.local
echo -e "screen -dmS ssr bash -c '/root/op.sh'"       >> /etc/rc.local
echo -e "while true"                                  >> /etc/rc.local
echo -e "do"                                          >> /etc/rc.local
echo -e "sleep 60"                                    >> /etc/rc.local
echo -e "if test -z "$(screen -ls | grep ssr)"; then" >> /etc/rc.local
echo -e "screen -dmS ssr bash -c '/root/op.sh'"       >> /etc/rc.local
echo -e "fi"                                          >> /etc/rc.local
echo -e "done"                                        >> /etc/rc.local
echo -e "10 3 * * * screen -S ssr -X quit"            >  /var/spool/cron/root
echo -e "11 3 * * * rm -rf /var/log/shadowsocksr.log" >> /var/spool/cron/root

wget --no-check-certificate https://raw.githubusercontent.com/dunji/test/master/op.sh
chmod +x op.sh

cd
mkdir ssr
cd ssr
wget --no-check-certificate https://raw.githubusercontent.com/dunji/test/master/shadowsocksR.sh
wget --no-check-certificate https://raw.githubusercontent.com/dunji/test/master/shadowsocks.json
wget --no-check-certificate https://raw.githubusercontent.com/dunji/test/master/ssr_setup.sh
chmod +x shadowsocksR.sh
chmod +x ssr_setup.sh
./ssr_setup.sh


sleep 10
reboot
