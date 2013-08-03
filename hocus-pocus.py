#!/usr/bin/env python

import sys

def setup_server(server=None):
  if server == None: raise "Please enter your server's IP or name"
  print "Setting up your server at %s." % server

if __name__ == '__main__':
  setup_server(sys.argv[1])
