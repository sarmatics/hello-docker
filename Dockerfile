FROM mongo:latest
RUN apt-get update && apt-get install -y cron vim rsyslog
RUN mkdir /backup

COPY backup.sh   /root/backup.sh 

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/mongo-backup
# Grant execution permissings to the cron job
RUN chmod 0644 /etc/cron.d/mongo-backup
# Create the log file
RUN touch /var/log/cron.log
# Grant execution permissions to backup script
RUN chmod 0755 /root/backup.sh

VOLUME ["/backup"]

