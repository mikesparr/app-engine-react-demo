#!/usr/bin/env bash

source .env # includes app name and project id

# set project
gcloud config set project $PROJECT_ID

# enable GCP apis
gcloud services enable appengine.googleapis.com

# bootstrap app using create-react-app
npx create-react-app $APP_NAME
cd $APP_NAME

# install app
npm install
npm audit fix # just in case vulnerabilities

# test it works, view in browser, then CTRL+C
npm start

# build app for production (creates build/ folder)
npm build

# deploy app to app engine (select region and confirm when prompted)
gcloud app deploy --project=$PROJECT_ID --quiet

# wait several minutes then visit the URL provided in output
gcloud app browse -s $APP_NAME
