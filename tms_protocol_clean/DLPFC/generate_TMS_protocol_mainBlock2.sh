#!/bin/bash -f

cat TEMPLATE_HEADER.CG3 > ${1}

matlab -nosplash -nodesktop -r "GENERATE_TRIAL_LIST_main_BLOCK2; exit"

TRNUM=`cat TRIAL_LIST_DLPFC_BLOCK_2 | wc -l`
echo "Generating ${TRNUM} trials..."
sed -i "s/TOTTRIALS/${TRNUM}/g" ${1}

for line in `cat TRIAL_LIST_DLPFC_BLOCK_2`; do
	cat TEMPLATE_TRIAL.CG3 > tmp

	IFS=',' read -ra ARGS <<< "$line"
	sed -i "s/TRIALNUM/${ARGS[0]}/g" tmp
	sed -i "s/DELAYTIME/${ARGS[1]}/g" tmp
	sed -i "s/MODE/${ARGS[2]}/g" tmp
	sed -i "s/IPITIME/${ARGS[3]}/g" tmp
	sed -i "s/AGAIN/${ARGS[4]}/g" tmp
	sed -i "s/BARAT/${ARGS[5]}/g" tmp
	cat tmp >> ${1}
done

echo "Done. Saved in ${1}."
