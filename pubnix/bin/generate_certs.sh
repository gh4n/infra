certbot --nginx -d astral.social -d www.astral.social --non-interactive --agree-tos -m webmaster@astral.social
SLEEPTIME=$(awk 'BEGIN{srand(); print int(rand()*(3600+1))}'); echo "0 0,12 * * * root sleep $SLEEPTIME && certbot renew -q" | tee -a /etc/crontab > /dev/null
