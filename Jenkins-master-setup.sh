# Ensure script is run with root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root or sudo privileges "
  exit 1
fi


# Install Java for jenkins server to run
apt update
apt install -y fontconfig openjdk-21-jre
java -version

#Install Jenkins
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian/jenkins.io-2023.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
apt-get update
apt-get -y install jenkins


sleep 5; clear
echo "   =================================="
echo "** Your Jenkins-Master server is ready for use **"
echo "** Type URL in browser : http://<ip-address>:8080 to check if it is running" 
echo "   =================================="
