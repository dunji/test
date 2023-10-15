yum update -y
yum install -y vim expect crontabs wget net-tools screen
yum install -y epel-release
yum install -y openconnect

sed -i 's/enforcing/disabled/g' /etc/selinux/config
systemctl stop firewalld.service
systemctl disable firewalld.service
systemctl start crond.service
systemctl enable crond.service
chmod +x /etc/rc.d/rc.local
echo -e "\n" >> /etc/rc.local
echo -e "rm -rf /var/log/shadowsocksr.log\n" >> /etc/rc.local
echo -e "sleep 15\n" >> /etc/rc.local
echo -e "screen -dmS ssr bash -c '/root/op.sh'" >> /etc/rc.local
echo -e "10 3 * * * /root/c92_restart.sh" > /var/spool/cron/root

wget --no-check-certificate https://raw.githubusercontent.com/dunji/test/master/op.sh
wget --no-check-certificate https://raw.githubusercontent.com/dunji/test/master/c92_restart.sh
chmod +x op.sh
chmod +x c92_restart.sh

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
