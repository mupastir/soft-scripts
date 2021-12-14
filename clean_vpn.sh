#!/bin/sh
for i in $(openvpn3 sessions-list | grep Path | awk '{print $2}'); do openvpn3 session-manage --disconnect --path $i; done
