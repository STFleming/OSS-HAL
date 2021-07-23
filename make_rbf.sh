#!/bin/bash

alterapath=~/altera/14.1
export SOCEDS_DEST_ROOT=${alterapath}/embedded
. ${SOCEDS_DEST_ROOT}/env.sh

SOF_FILE=`find . -name *.sof`
echo "SOF: $SOF_FILE"
RBF_FILE=`echo $SOF_FILE | sed "s/\.sof/\.rbf/"`
echo "RBF: $RBF_FILE"
quartus_cpf -c $SOF_FILE $RBF_FILE
readlink -f ${RBF_FILE}
