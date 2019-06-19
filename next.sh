#! /bin/bash
#
# file: next.sh
#
# This bash script analyzes the record named in its command-line
# argument ($1), and writes the answer to the file 'answers.txt'.
# This script is run once for each record in the Challenge test set.
#
# The program should print the record name, followed by a comma,
# followed by one of the following characters:
#   N   for normal rhythm
#   A   for atrial fibrillation
#   O   for other abnormal rhythms
#   ~   for records too noisy to classify
#
# For example, if invoked as
#    next.sh A00001
# it analyzes record A00001 and (assuming the recording is
# considered to be normal) writes "A00001,N" to answers.txt.

set -e
set -o pipefail

RECORD=$1

rm -rf data1
mkdir data1
matlab -nodisplay -nosplash -r \
    "preprocess_sub('$RECORD'); quit"

python3 code/challenge.py

# Example (Matlab)
# matlab -nodisplay -nodisplay -nosplash -r \
#    "try x = challenge('$RECORD'); \
#     f = fopen('answers.txt', 'a'); fprintf(f, '$RECORD,%s\n', x); fclose(f); \
#     catch e; display(getReport(e)); exit(1); end; quit"

# Example (Octave)
#octave -q -f --eval \
#    "pkg load signal; pkg load statistics;
#     x = challenge('$RECORD');
#     f = fopen('answers.txt', 'a'); fprintf(f, '$RECORD,%s\n', x); fclose(f);"
