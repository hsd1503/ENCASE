#!/bin/bash
#
# file: prepare-entry.sh
#
# This script shows how to run the example code (setup.sh and next.sh)
# over the validation set, in order to produce the list of expected
# answers (answers.txt) which must be submitted as part of your entry.
# This script itself does not need to be included in your entry.

set -e
set -o pipefail

echo "==== running setup script ===="

./setup.sh

echo "==== running entry script on validation set ===="

rm -f answers.txt
# use GNU parallel if available
if parallel -k </dev/null >/dev/null 2>/dev/null; then
    parallel -k --halt=1 < validation/RECORDS \
        echo {} \; \
        ln -sf validation/{}.hea . \; \
        ln -sf validation/{}.mat . \; \
        ./next.sh {}
else
    for r in `cat validation/RECORDS`; do
        echo $r
        ln -sf validation/$r.hea .
        ln -sf validation/$r.mat .
        ./next.sh $r
    done
fi
