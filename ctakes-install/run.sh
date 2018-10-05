#!/bin/sh
#
# Requires JAVA JDK 1.8+

# Check for UMLS credentials
if [ ! -f $PWD/ctakes-install/umls.sh ]; then
    printf "\033[91mERROR:\033[0m You need to provide UMLS credentials in the file ./umls.sh" 1>&2
	exit 1
else
# Source UMLS credentials
	printf "\033[92m\u0F36\033[0m UMLS credentials file confirmed!\n\n"
	. ./ctakes-install/umls.sh
fi

# Only set CTAKES_HOME if not already set
[ -z "$CTAKES_HOME" ] && CTAKES_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )/apache-ctakes-4.0.0"
cd $CTAKES_HOME

# Launch

bin/runClinicalPipeline.sh -i /home/a1d3n/Desktop/cTAKES-Python-API/ctakes-test/ctakes_input  --xmiOut /home/a1d3n/Desktop/cTAKES-Python-API/ctakes-test/ctakes_output --user $UMLS_USERNAME --pass $UMLS_PASSWORD
