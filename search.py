#!/usr/bin/env python

import auth
import os
from time import sleep
import requests
import tweepy
import subprocess

DEST = auth.DEST

api = auth.api()
for tweet in api.user_timeline():
  if tweet.text and "http://t.co" in tweet.text:
    print "Processing tweet..."
    print tweet.text
    print tweet.id
    if not "media" in tweet.entities:
      print "Nothing to process"
      continue
    image_url = tweet.entities['media'][0]['media_url_https']
    url = image_url
    page = requests.get(url)
    filename = url.split('/')[-1]
    print filename
    with open("/tmp/uploads/" + filename, 'wb') as fo:
      fo.write(page.content)
    subprocess.call(["./run.sh", "/tmp/uploads/" + filename ])
