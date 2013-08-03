#!/usr/bin/env python

from fabric.api import run

def setup_server():
  run('uname -a')
  