collator.sh
Written by Victor Estrada
vict0198@rackspace.com

Description: This script reads the directory names given, matches keywords
"blocksize", "iodepth", and "rwmixwrite" from a fio.job file within the 
directories read in.  Each directory is expected to have a "fio.job" file.
A new subdirectory name is created using the matched values and the previous
directory is moved into the new directory.
