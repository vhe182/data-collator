#collator

##Description 
This script reads the directory names given, matches keywords
"blocksize", "iodepth", and "rwmixwrite" from a fio.job file within the 
directories read in.  Each directory is expected to have a "fio.job" file.
A new subdirectory name is created using the matched values and the previous
directory is moved into the new directory.

__Note__: collator should be called from a directory above the work area.

##Arguments
Only one argument is expected with each call to collator:
  * Job Descriptor: is placed at the front of the subdirectory name.

##Example:
```
../collator large
```
