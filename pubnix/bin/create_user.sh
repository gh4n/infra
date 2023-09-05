#!/bin/bash
set -eu

uname=$1
auth_key=$2
quota_soft='960M'
quota_hard='1024M'

# create user and set quotas
adduser --disabled-password --gecos '' $uname 
setquota -u $uname $quota_soft $quota_hard 0 0 -a

# get home directory
home_dir=$(getent passwd $uname | cut -d: -f6)

# configure ssh dir
ssh_dir="$home_dir/.ssh"
mkdir -vp $ssh_dir
chmod -v 700 $ssh_dir
echo $auth_key > "$ssh_dir/authorized_keys"
chmod 600 "$ssh_dir/authorized_keys"

# chown home dir
chown -vR "$uname:$uname" $home_dir

