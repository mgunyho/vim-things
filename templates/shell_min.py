#!/usr/bin/python3
# -*- coding: utf-8 -*-
import subprocess

def sh(cmd: str, return_string: bool = True):
  """
  Run chell command 'cmd' and return stdout.
  """
    res = subprocess.check_output(cmd, shell=True)
    if return_string:
        res = res.decode()

    return res
