#!/bin/bash

curl -s http://ipinfo.io/$1 | grep country | awk '{print $2}'