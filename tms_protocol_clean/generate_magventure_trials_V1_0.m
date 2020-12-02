%% Generate Magventure Protocols
% Authors: Nicholas Murphy, Nithya Ramakrishan, Christopher Walker
% Institute: Baylor College of Medicine
% Year: 2020
% Version: 1.0

%% Development notes
% 08/12/2020 --- NM
% aim = loop through tms protocol files
% run the shell script and save in appropriate directory
% check directory each time
% use "!" to iniate linux 
% example: cd ..... (to matlab/shell location)...
% source generate_TMS_protocol_mainBlock1.sh test

% !source generate_TMS_protocol_mainBlock1.sh /data/rcho/TMS_EEG/experiment_items/test


%% DLPFC
cd('/data/rcho/TMS_EEG/experiment_items/tms_protocol_clean/DLPFC/');
!source generate_TMS_protocol_mainBlock1.sh /data/rcho/TMS_EEG/experiment_items/tms_protocol_clean/DLPFC/trials_update/dlpfc_block1
!source generate_TMS_protocol_mainBlock2.sh /data/rcho/TMS_EEG/experiment_items/tms_protocol_clean/DLPFC/trials_update/dlpfc_block2
!source generate_TMS_protocol_mainBlock3.sh /data/rcho/TMS_EEG/experiment_items/tms_protocol_clean/DLPFC/trials_update/dlpfc_block3
!source generate_TMS_protocol_mainBlock4.sh /data/rcho/TMS_EEG/experiment_items/tms_protocol_clean/DLPFC/trials_update/dlpfc_block4
%% MOTOR
cd('/data/rcho/TMS_EEG/experiment_items/tms_protocol_clean/MOTOR/');
!source generate_TMS_protocol_motor.sh /data/rcho/TMS_EEG/experiment_items/tms_protocol_clean/MOTOR/trials/motor_trials
%% SHAM
cd('/data/rcho/TMS_EEG/experiment_items/tms_protocol_clean/SHAM/');
!source generate_TMS_protocol_sham.sh /data/rcho/TMS_EEG/experiment_items/tms_protocol_clean/SHAM/trials/sham_trials