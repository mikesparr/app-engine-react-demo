#!/usr/bin/env bash

source .env # includes app name and project id

gcloud app services delete $APP_NAME
