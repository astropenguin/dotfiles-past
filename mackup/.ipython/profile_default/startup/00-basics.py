# coding: utf-8

# the standard library
import os
import re
import sys
import glob
import json
import time
from datetime import datetime, timedelta
from functools import partial
from inspect import getargspec, stack

# dependent packages
import numpy as np
import numpy.ma as ma
from astropy.io import fits
from astropy import units as u
from scipy import signal
from scipy import fftpack
from scipy import ndimage
from scipy import optimize
from scipy import interpolate
