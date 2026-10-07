---
author: adrian
comments: true
date: 2014-04-11 12:30:21+00:00
layout: post
slug: simple-shell-script-backing-databases-separate-files
title: Simple shell script for backing up databases into separate files
wordpress_id: 625
categories:
    - miscellaneous
---

```bash
#!/bin/bash

# Example usage
# --
# ./db-backup.sh -u username -p password -t /target/

while getopts u:p:t: option
do
    case "${option}"
    in
	    u) USER=${OPTARG};;
        p) PASSWORD=${OPTARG};;
        t) TARGET=${OPTARG};;
    esac
done

for D in `mysql -u $USER -p$PASSWORD -N -B -e 'show databases'`;
do
    echo "Backing up $D to $TARGET"
    mysqldump --skip-comments --compact -u $USER -p$PASSWORD $D | gzip -9 > $TARGET/$D.sql.gz
done;
```

[view as a gist](https://gist.github.com/navitronic/10451484)

<!-- TODO -->
