crumb=$(curl -u "jenkins:1234" -s 'http://jenkins.local:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
#curl -u "jenkins:1234" -H "$crumb" -X POST http://jenkins.local:8080/job/ENV/build?delay=0sec
#curl -u "jenkins:1234" -H "$crumb" -X POST http://jenkins.local:8080/job/db-ansible-users/buildWithParameters?LIST_AGE=23
curl -u "jenkins:1234" -H "$crumb" -X POST  http://jenkins.local:8080/job/backup-db-to-aws/buildWithParameters?DB_HOST=db_host&DB_NAME=testdb&AWS_S3_BUCKET_NAME=gustavo-jenkins-udemy

