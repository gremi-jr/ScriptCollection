#!/usr/bin/env python3
# Clone from https://github.com/vinniemo90/downloads-cleanup
import os
import glob
import time
import sys
import datetime
import logging

path = '/Users/timo.gremler/Downloads/'
os.chdir(path)

# create logger with 'DIRECTORY_CLEANUP'
logger = logging.getLogger('DIRECTORY_CLEANUP')
logger.setLevel('INFO')
# create file handler which logs even debug messages
fh = logging.FileHandler(f'cleanup_{datetime.date.today()}.log')
fh.setLevel('INFO')
# create formatter and add it to the handlers
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
fh.setFormatter(formatter)
# add the handlers to the logger
logger.addHandler(fh)

for filename in glob.glob('*'):
    filename = os.path.join(path, filename)
    mod_date = datetime.date.fromtimestamp(os.stat(filename).st_mtime)
    
    if mod_date < (datetime.date.today() - datetime.timedelta(days=7)):
        try:
            if os.path.isfile(filename):
                logger.info(f'delete {filename}')
                os.remove(filename)
        except:
            logger.error(f'Unable to delete {filename}')

