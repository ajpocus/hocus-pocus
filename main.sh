#!/bin/bash

ssh root@$1 'bash -s ' < ./setup_remote_server.sh || exit;
