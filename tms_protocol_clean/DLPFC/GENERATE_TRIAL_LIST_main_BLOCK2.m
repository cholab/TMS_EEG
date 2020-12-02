%% R21 Trial list generator for Single and Paired Pulse Paradigm
%TOTTRIAL 	= Total trials
%TRIALNUM 	= specific line of the protocol
%AGAIN    	= proportion of stimulator intensity (%)
%BARAT	 	= paired pulse ratio expressed as B/A (%)
%DELAYTIME 	= delay to wait before stimulating (ms)
%IPITIME	 	= interpulse interval (ms)
%MODE		= [0|2] Single vs paired pulse
%  [MODE IPITIME AGAIN BARAT ]
trial_types = ...
   [0    10      120   120; ... % single pulse
    2    3       70    170; ... % SICI BA should be 170 so that B is at 120% RMT
    2    100     120   100; ... % LICI BA ratio should be 100% to ensure B is also 120% RMT
    2    20      80    150];    % ICF should be 150 so that B is at 120% RMT

%Random sample of interpulse delays with specific weights to determine
%their frequency
delays=[2000 3000 4000 5000];
weights=[.25 .25 .25 .25];
ntrials=120;
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
dlmwrite('TRIAL_LIST_DLPFC_BLOCK_2',TRIALS);
