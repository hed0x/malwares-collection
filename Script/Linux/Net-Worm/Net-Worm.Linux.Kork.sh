#!/bin/sh
cat results.log | xargs -P 30 -l ./.hack
