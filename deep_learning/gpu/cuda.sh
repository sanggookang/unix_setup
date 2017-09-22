#!/bin/bash
to_update=`${BASESETUPDIR}/utils/compare.sh ${BASESETUPDIR}/deep_learning/gpu/.prof ~/.profile`
echo $to_update
if [ $to_update == 'false' ]; then
  cat ${BASESETUPDIR}/deep_learning/gpu/.prof >> ~/.profile
fi
source ~/.profile
