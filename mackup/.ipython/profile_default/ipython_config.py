# coding: utf-8

c = get_config()

# autorestore
c.StoreMagics.autorestore = True

# autoreload
c.InteractiveShellApp.extensions = ['autoreload']
c.InteractiveShellApp.exec_lines = ['%autoreload 2']

# print function
c.InteractiveShellApp.exec_lines = ['from __future__ import print_function']
