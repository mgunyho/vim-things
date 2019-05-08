#!/usr/bin/python3
# -*- coding: utf-8 -*-
import subprocess, sys, shlex, threading

def shell(cmd, silent = False):
  # run shell command string (like 'ls -l') and return a dict containing the stdout and stderr as lists and the return code
  # the option 'silent' suppresses printing output to stdout during execution

  #{{{
  proc = subprocess.Popen(shlex.split(cmd),
      stdout = subprocess.PIPE,
      stderr = subprocess.PIPE,
      universal_newlines = True
      )

  # print output of command while also storing it in lists, separate threads for stdout and stderr
  # based on https://stackoverflow.com/a/4985080
  def tee(fd_in, fd_out, target_list):
    # print fd_in to fd_out and also collect it into a list
    for line in iter(fd_in):
      if not silent:
        fd_out.write(line)
      target_list.append(line)

  stdout = []
  stderr = []

  t_stdout = threading.Thread(target=tee, args = (proc.stdout, sys.stdout, stdout))
  t_stderr = threading.Thread(target=tee, args = (proc.stderr, sys.stderr, stderr))
  t_stdout.start()
  t_stderr.start()

  proc.wait()

  t_stdout.join()
  t_stderr.join()

  #}}}

  ret = {
      "stdout": stdout,
      "stderr": stderr,
      "exit_status": proc.returncode
      }

  return ret

res = shell("ls -l")
print(res["stdout"])
print(res["stderr"])
print(res["exit_status"])

# vim: set fdm=marker :
