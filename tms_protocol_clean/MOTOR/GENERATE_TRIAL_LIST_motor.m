%% R21 Trial list generator for MEP Paradigm
%TOTTRIAL 	= Total trials
%TRIALNUM 	= specific line of the protocol
%AGAIN    	= proportion of stimulator intensity (%)
%BARAT	 	= paired pulse ratio expressed as B/A (%)
%DELAYTIME 	= delay to wait before stimulating (ms)
%IPITIME	 	= interpulse interval (ms)
%MODE		= [0|2] Single vs paired pulse
%  [MODE IPITIME AGAIN BARAT ]
trial_types = ...
   [0    10      100   100];

%Random sample of interpulse delays with specific weights to determine
%their frequency
delays=[2000 3000 4000 5000];
weights=[.25 .25 .25 .25];
ntrials=50;
trialnum=1:ntrials;
times=randsample(delays,ntrials,true,weights);
%Check distribution, is it what you wanted? (This has been commented to 
%save time on the automated function)
% figure; hist(times);

%inflate the trial type matrix to the total number of trials
trials=repmat(trial_types,ntrials/size(trial_types,1),1);
shuffle_idx=randsample(trialnum,ntrials,false);

%abut the vectors and trial matrices and shuffle the trial type order
TRIALS=[trialnum' times' trials(shuffle_idx,:)];

%save it
dlmwrite('TRIAL_LIST_MOTOR',TRIALS);
