#!/bin/sh

ps -ax | grep "Google Chrome" | grep -v grep | awk '{print $1;}' | xargs kill -9



