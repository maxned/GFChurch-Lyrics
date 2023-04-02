import glob
import unicodedata
import os

# with open(filepath) as song_file:

for filepath in glob.iglob("/Users/maxned/ProPresenter/Libraries/eGFC/" + "*"):
  # os.rename(filepath, unicodedata.normalize('NFC', filepath))
  print("{:100} - {}, {}".format(filepath, len(filepath), len(unicodedata.normalize('NFC', filepath))))
