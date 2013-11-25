heroku pgbackups:capture --expire
rm -r backups
mkdir backups
curl -o backups/latest.dump `heroku pgbackups:url`
pg_restore -d heynk_development backups/latest.dump
rake db:migrate
rm -r backups