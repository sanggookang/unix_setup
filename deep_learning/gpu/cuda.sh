#!/bin/bash
to_update=`python ${BASESETUPDIR}/utils/compare.py ${BASESETUPDIR}/deep_learning/gpu/.prof ~/.profile`
echo $to_update
if [ $to_update == 'false' ]; then
  cat ${BASESETUPDIR}/deep_learning/gpu/.prof >> ~/.profile
fi
source ~/.profile
