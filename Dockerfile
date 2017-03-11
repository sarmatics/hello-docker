FROM mongo:latest
RUN apt-get update && apt-get install -y cron vim rsyslog
RUN mkdir /backup

COPY backup.sh   /root/backup.sh 

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/mongo-backup
# Grant execution rights on the cron job
RUN chmod 0644 /etc/cron.d/mongo-backup
# Create the log file
RUN touch /var/log/cron.log

CMD cron

VOLUME ["/backup"]

