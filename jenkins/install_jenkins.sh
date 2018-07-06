docker pull jenkins/jenkins:lts
docker run --name jenkins_opendata -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts

