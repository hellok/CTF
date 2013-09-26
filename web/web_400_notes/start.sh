#!/bin/bash

rackup web.ru -p 8080&
rackup web.ru -p 8081&
sleep 31536000
