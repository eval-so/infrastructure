#!/usr/bin/env bash

export _JAVA_OPTIONS="-Xms256m -Xmx512m"

cd /srv/www

mkdir /srv/www/frontend-1 /srv/www/frontend-2

pushd frontend
  git pull
  find /home/evalso/.sbt/staging/ -name .git -execdir git pull origin master \;
  sbt clean compile stage
popd

cp -r frontend/target/staged /srv/www/frontend-1
cp -r frontend/target/start  /srv/www/frontend-1

cp -r frontend/target/staged /srv/www/frontend-2
cp -r frontend/target/start  /srv/www/frontend-2

pushd /srv/www/frontend-1
  kill `cat pid`
  ./start -Dhttp.port=9000 &
  echo $! > pid
  disown `cat pid`
  sleep 2 # So the app has time to make RUNNING_PID which we have to nuke.
  rm /srv/www/RUNNING_PID
popd

pushd /srv/www/frontend-2
  kill `cat pid`
  ./start -Dhttp.port=9001 &
  echo $! > pid
  disown `cat pid`
  sleep 2 # So the app has time to make RUNNING_PID which we have to nuke.
  rm /srv/www/RUNNING_PID
popd
