#!/usr/bin/env python3
#! -*- coding: utf-8 -*-

"""
description:
author: Tyler Wayne
data created:
last modified: 
"""

######################################################################
### SETUP
######################################################################

import json
import logging
import argparse
from logging.config import fileConfig

fileConfig('configs/logging.ini')
logger = logging.getLogger()


######################################################################
### FUNCTIONS
######################################################################


######################################################################
### CONFIGURATIONS
######################################################################

try:
    with open('configs/configs.json', 'r') as f:
        configs = json.load(f)
except Exception as e:
    logger.exception('Unable to load configuration file')

######################################################################
### MAIN
######################################################################

if __name__ == '__main__':

    ## COMMAND-LINE ARGUMENTS
    ##############################
    parser = argparse.ArgumentParser(description='Description')
    parser.add_argument('input', nargs=1, help='Input file')
    
    args = parser.parse_args()
    input_file = args.input[0] 

