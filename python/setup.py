#!/usr/bin/env python3
#! -*- coding: utf-8 -*-

"""
description: Setup tools to create python package
author: Tyler Wayne
data created:
last modified:
"""

######################################################################
### SETUP
######################################################################

import setuptools


######################################################################
### MAIN
######################################################################

if __name__ == '__main__':

    with open("README", "r") as fh:
        long_description = fh.read()

    setuptools.setup(
        name="<Name of the app here>",
        version="0.0.1",
        author="Tyler Wayne",
        author_email="tylerwayne3@gmail.com",
        description="<Description of the app here>",
        long_description=long_description,
        long_description_content_type="text/markdown",
        url="<URL to the github repo here",
        packages=["app"],
        classifiers=[
            "Programming Language :: Python :: 3",
            "License :: OSI Approved :: MIT License",
            "Operating System :: OS Independent",
        ],
        python_requires='>=3.6',
    )
