touch log.txt;
echo "Begin script" >> log.txt;
sudo apt update; sudo apt upgrade;
sudo apt install ufw;
sudo systemctl enable ufw;
sudo systemctl start ufw;
echo "Enabled and Started UFW firewall" >> log.txt;
passwd root; 
echo "changed root password" >> log.txt;
sed -i 's/PASS_MAX_DAYS.*$/PASS_MAX_DAYS 90/;s/PASS_MIN_DAYS.*$/PASS_MIN_DAYS 10/;s/PASS_WARN_AGE.*$/PASS_WARN_AGE 7/' /etc/login.defs;
echo "set login reqiurements" >> log.txt;

if grep -qF 'PermitRootLogin' /etc/ssh/sshd_config; then sed -i 's/^.*PermitRootLogin.*$/PermitRootLogin no/' /etc/ssh/sshd_config; else echo 'PermitRootLogin no' >> /etc/ssh/sshd_config; fi
PermitRootLogin no
ChallengeResponseAuthentication no
PasswordAuthentication no
UsePAM no
PermitEmptyPasswords no;
echo "set ssh settings" >> log.txt;
echo "list of all users" >> log.txt;
cut -d: -f1 /etc/passwd >> log.txt;
echo "end list" >> log.txt;
