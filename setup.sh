#! /bin/bash
#
# file: setup.sh
#
# This bash script performs any setup necessary in order to test your
# entry.  It is run only once, before running any other code belonging
# to your entry.

set -e
set -o pipefail

#pip3 install --user python-dateutil-2.5.2.tar.gz
#pip3 install --user pytz-2012h.tar.gz
#pip3 install --user pandas-0.19.2.tar.gz
#pip3 install --user patsy-0.2.1.tar.gz
#pip3 install --user statsmodels-0.8.0.tar.gz
pip3 install --user dill-0.2.6.zip

# Example: compile a C module (viterbi_Schmidt) for Octave
#mkoctfile -mex viterbi_Springer.c

# Example: compile a C module for Matlab
#mex viterbi_Springer.c
