# Ensure script is run with root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root or sudo privileges "
  exit 1
fi


# Install docker for sonarqube server to run
apt update
apt install -y docker.io
usermod -a -G docker $USER

if [ $? -ne "0" ]; then
  echo "============================================================="
  echo "Kindly Restart the server"
  echo "============================================================="
  exit 1;
else
  docker run -d --name sonar -p 9000:9000 sonarqube:community
fi



sleep 5; clear
echo "   =================================="
echo "** Your Sonarqube scanner server is ready for use **"
echo "** Type URL in browser : http://<ip-address>:9000 to check if it is running" 
echo "   =================================="
