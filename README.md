
<html><body><h1 style="font-size:50px;color:blue;">WEZVA TECHNOLOGIES (ADAM) | <font style="color:red;"> www.wezva.com | <font style="color:green;"> +91-9739110917 </h1>
<h1> Subscribe to our youtube channel: 
<a href="https://www.youtube.com/c/DevOpsLearnEasy">https://www.youtube.com/c/DevOpsLearnEasy</a> </h1>
</body></html>


# PRODUCTION GRADE DEVSECOPS CICD Pipeline

## Prereq: Create 3 EC2 servers
- [ ] Jenkins_Master server with 4 GB memory - t2.medium
- [ ] Build server with 15GB storage - t2.meduim
- [ ] Sonarqube server with 4 GB memory - t2.medium

## Step 1: Ensure all the necessary plugins are installed in Jenkins Master
- [ ] Parameterized trigger plugin
- [ ] Gitlab plugin/Github Plugin 
- [ ] Docker Pipeline
- [ ] Pipeline: AWS steps
- [ ] SonarQube Scanner
- [ ] Quality Gates

## Step 2: Install Jenkins on one of t2.medium server name: Jenkins_Master
```
$ sudo ./Jenkins-master-setup.sh
```

## Step 3: Install Docker, Java8, Java11 & Trivy on Build Server
```
$ sudo ./Build-server-setup.sh
```

## Step 4: Install Sonrqube on the t2.medium server
```
$ sudo apt update
$ sudo apt install -y docker.io
$ sudo usermod -a -G docker ubuntu
$ sudo docker run -d --name sonar -p 9000:9000 sonarqube:lts-community

OR (via sonarqube-setup.sh script)

$sudo ./sonarqube-server-setup.sh

```

## Step 5: Add necessary credentials
- [ ] Generate Sonarqube token of type "global analysis token" and add it as Jenkins credential of type "secret text"
- [ ] Add dockerhub credentials as username/password type / or PAT token
- [ ] Add Gitlab/Github credentials 
- [ ] Add Build server credentials for Jenkins master to connect
- [ ] Generate NVD_API_KEY from visting this link: https://nvd.nist.gov/developers/request-an-api-key  
- [ ] Add NVD_API_KEY in jenkins credentails as secret.txt with ID: NVD_API_KEY

## Step 6: Enable Sonarqube webhook for Quality Gates & Install dependency-check plugin
- [ ] Generate webhook & add the Jenkins URL as follows - http://URL:8080/sonarqube-webhook/



