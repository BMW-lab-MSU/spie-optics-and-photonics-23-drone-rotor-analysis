% Creates the vectors for the drone lidar data, a 1x178 column
% matrix that contains a 0 for open air, a 1 for a hard target
% 
% Run this from the initial-prop-tests folder to create all of the labels
% in the correct places.

hard_target = 1;

% Orientation:
% On-Axis --> 2
orientation_on_axis = 2;
% Perpendicular, undersides toward lidar --> 3
orientation_perp = 3;

% Position:
% Middle of Prop wing --> 2
pos_middle_of_prop = 2;
% Middle of Motor and Prop --> 3
pos_motor_and_prop = 3;
% Middle of motor body --> 4
pos_motor = 4;
% 
% Speed:
% Stationary --> 1
speed_stationary = 1;
% 1666 2/3 --> 2
speed_slow = 2;
% 2166 2/3 --> 3
speed_medium = 3;
% 3333 1/3 --> 4
speed_fast = 4;

blankVec = zeros(178,1);

% % 12-15-2022 Shots
% drone_prop_test142749_label = blankVec;
% drone_prop_test142749_label(1:3) = 2;
% drone_prop_test142749_label(6:8) = 1;
% label = drone_prop_test142749_label;
% save("2022-12-15/drone-prop-test142749/orientation_label.mat","label");
% drone_prop_test142749_label = blankVec;
% drone_prop_test142749_label(1:3) = 2;
% drone_prop_test142749_label(6:8) = 1;
% label = drone_prop_test142749_label;
% save("2022-12-15/drone-prop-test142749/position_label.mat","label");
% drone_prop_test142749_label = blankVec;
% drone_prop_test142749_label(1:3) = 2;
% drone_prop_test142749_label(6:8) = 1;
% label = drone_prop_test142749_label;
% save("2022-12-15/drone-prop-test142749/speed_label.mat","label");
% 
% drone_prop_test143759_label = blankVec;
% drone_prop_test143759_label(2:5) = XXX;
% drone_prop_test143759_label(7:9) = 1;
% label = drone_prop_test143759_label;
% save("2022-12-15/drone-prop-test143759/orientation_label.mat","label");
% drone_prop_test143759_label = blankVec;
% drone_prop_test143759_label(2:5) = XXX;
% drone_prop_test143759_label(7:9) = 1;
% label = drone_prop_test143759_label;
% save("2022-12-15/drone-prop-test143759/position_label.mat","label");
% drone_prop_test143759_label = blankVec;
% drone_prop_test143759_label(2:5) = XXX;
% drone_prop_test143759_label(7:9) = 1;
% label = drone_prop_test143759_label;
% save("2022-12-15/drone-prop-test143759/speed_label.mat","label");
% 
% drone_prop_test144402_label = blankVec;
% drone_prop_test144402_label(2:5) = POSITION;
% drone_prop_test144402_label(7:10) = 1;
% label = drone_prop_test144402_label;
% save("2022-12-15/drone-prop-test144402/orientation_label.mat","label");
% 
% drone_prop_test145738_label = blankVec;
% drone_prop_test145738_label(2:4) = POSITION;
% drone_prop_test145738_label(7:10) = 1;
% label = drone_prop_test145738_label;
% save("2022-12-15/drone-prop-test145738/orientation_label.mat","label");

% 12-16-2022 Shots
drone_prop_test102918_label = blankVec;
drone_prop_test102918_label(2:4) = orientation_on_axis;
drone_prop_test102918_label(7:10) = hard_target;
label = drone_prop_test102918_label;
save("2022-12-16/drone-prop-test102918/orientation_label.mat","label");
drone_prop_test102918_label(2:4) = pos_middle_of_prop;
label = drone_prop_test102918_label;
save("2022-12-16/drone-prop-test102918/position_label.mat","label");
drone_prop_test102918_label(2:4) = speed_stationary;
label = drone_prop_test102918_label;
save("2022-12-16/drone-prop-test102918/speed_label.mat","label");

drone_prop_test103404_label = blankVec;
drone_prop_test103404_label(2:4) = orientation_on_axis;
drone_prop_test103404_label(7:10) = hard_target;
label = drone_prop_test103404_label;
save("2022-12-16/drone-prop-test103404/orientation_label.mat","label");
label(2:4) = pos_middle_of_prop;
save("2022-12-16/drone-prop-test103404/position_label.mat","label");
label(2:4) = speed_slow;
save("2022-12-16/drone-prop-test103404/speed_label.mat","label");

drone_prop_test103905_label = blankVec;
drone_prop_test103905_label(2:4) = orientation_on_axis;
drone_prop_test103905_label(7:10) = hard_target;
label = drone_prop_test103905_label;
save("2022-12-16/drone-prop-test103905/orientation_label.mat","label");
label(2:4) = pos_middle_of_prop;
save("2022-12-16/drone-prop-test103905/position_label.mat","label");
label(2:4) = speed_fast;
save("2022-12-16/drone-prop-test103905/speed_label.mat","label");

drone_prop_test104801_label = blankVec;
drone_prop_test104801_label(2:5) = orientation_on_axis;
drone_prop_test104801_label(7:9) = hard_target;
label = drone_prop_test104801_label;
save("2022-12-16/drone-prop-test104801/orientation_label.mat","label");
label(2:5) = pos_motor_and_prop;
save("2022-12-16/drone-prop-test104801/position_label.mat","label");
label(2:5) = speed_stationary;
save("2022-12-16/drone-prop-test104801/speed_label.mat","label");

drone_prop_test105107_label = blankVec;
drone_prop_test105107_label(2:5) = orientation_on_axis;
drone_prop_test105107_label(7:9) = hard_target;
label = drone_prop_test105107_label;
save("2022-12-16/drone-prop-test105107/orientation_label.mat","label");
label(2:5) = pos_motor_and_prop;
save("2022-12-16/drone-prop-test105107/position_label.mat","label");
label(2:5) = speed_slow;
save("2022-12-16/drone-prop-test105107/speed_label.mat","label");

drone_prop_test105352_label = blankVec;
drone_prop_test105352_label(2:5) = orientation_on_axis;
drone_prop_test105352_label(7:9) = hard_target;
label = drone_prop_test105352_label;
save("2022-12-16/drone-prop-test105352/orientation_label.mat","label");
label(2:5) = pos_motor_and_prop;
save("2022-12-16/drone-prop-test105352/position_label.mat","label");
label(2:5) = speed_fast;
save("2022-12-16/drone-prop-test105352/speed_label.mat","label");

drone_prop_test105707_label = blankVec;
drone_prop_test105707_label(2:5) = orientation_on_axis;
drone_prop_test105707_label(7:9) = hard_target;
label = drone_prop_test105707_label;
save("2022-12-16/drone-prop-test105707/orientation_label.mat","label");
label(2:5) = pos_motor_and_prop;
save("2022-12-16/drone-prop-test105707/position_label.mat","label");
label(2:5) = speed_medium;
save("2022-12-16/drone-prop-test105707/speed_label.mat","label");

drone_prop_test110009_label = blankVec;
drone_prop_test110009_label(2:4) = orientation_on_axis;
drone_prop_test110009_label(7:10) = hard_target;
label = drone_prop_test110009_label;
save("2022-12-16/drone-prop-test110009/orientation_label.mat","label");
label(2:4) = pos_middle_of_prop;
save("2022-12-16/drone-prop-test110009/position_label.mat","label");
label(2:4) = speed_medium;
save("2022-12-16/drone-prop-test110009/speed_label.mat","label");

drone_prop_test110935_label = blankVec;
drone_prop_test110935_label(2:5) = orientation_perp;
drone_prop_test110935_label(7:9) = hard_target;
label = drone_prop_test110935_label;
save("2022-12-16/drone-prop-test110935/orientation_label.mat","label");
label(2:5) = pos_middle_of_prop;
save("2022-12-16/drone-prop-test110935/position_label.mat","label");
label(2:5) = speed_stationary;
save("2022-12-16/drone-prop-test110935/speed_label.mat","label");

drone_prop_test111351_label = blankVec;
drone_prop_test111351_label(2:6) = orientation_perp;
drone_prop_test111351_label(7:10) = hard_target;
label = drone_prop_test111351_label;
save("2022-12-16/drone-prop-test111351/orientation_label.mat","label");
label(2:6) = pos_middle_of_prop;
save("2022-12-16/drone-prop-test111351/position_label.mat","label");
label(2:6) = speed_slow;
save("2022-12-16/drone-prop-test111351/speed_label.mat","label");

drone_prop_test111720_label = blankVec;
drone_prop_test111720_label(2:6) = orientation_perp;
drone_prop_test111720_label(7:10) = hard_target;
label = drone_prop_test111720_label;
save("2022-12-16/drone-prop-test111720/orientation_label.mat","label");
label(2:6) = pos_middle_of_prop;
save("2022-12-16/drone-prop-test111720/position_label.mat","label");
label(2:6) = speed_medium;
save("2022-12-16/drone-prop-test111720/speed_label.mat","label");

drone_prop_test112019_label = blankVec;
drone_prop_test112019_label(2:6) = orientation_perp;
drone_prop_test112019_label(2:6) = hard_target;
label = drone_prop_test112019_label;
save("2022-12-16/drone-prop-test112019/orientation_label.mat","label");
label(2:6) = pos_middle_of_prop;
save("2022-12-16/drone-prop-test112019/position_label.mat","label");
label(2:6) = speed_fast;
save("2022-12-16/drone-prop-test112019/speed_label.mat","label");

drone_prop_test112606_label = blankVec;
drone_prop_test112606_label(2:6) = orientation_perp;
drone_prop_test112606_label(7:9) = hard_target;
label = drone_prop_test112606_label;
save("2022-12-16/drone-prop-test112606/orientation_label.mat","label");
label(2:6) = pos_motor;
save("2022-12-16/drone-prop-test112606/position_label.mat","label");
label(2:6) = speed_stationary;
save("2022-12-16/drone-prop-test112606/speed_label.mat","label");

drone_prop_test112945_label = blankVec;
drone_prop_test112945_label(2:6) = orientation_perp;
drone_prop_test112945_label(7:9) = hard_target;
label = drone_prop_test112945_label;
save("2022-12-16/drone-prop-test112945/orientation_label.mat","label");
label(2:6) = pos_motor;
save("2022-12-16/drone-prop-test112945/position_label.mat","label");
label(2:6) = speed_slow;
save("2022-12-16/drone-prop-test112945/speed_label.mat","label");

drone_prop_test113233_label = blankVec;
drone_prop_test113233_label(2:6) = orientation_perp;
drone_prop_test113233_label(7:9) = hard_target;
label = drone_prop_test113233_label;
save("2022-12-16/drone-prop-test113233/orientation_label.mat","label");
label(2:6) = pos_motor;
save("2022-12-16/drone-prop-test113233/position_label.mat","label");
label(2:6) = speed_medium;
save("2022-12-16/drone-prop-test113233/speed_label.mat","label");

drone_prop_test113600_label = blankVec;
drone_prop_test113600_label(2:6) = orientation_perp;
drone_prop_test113600_label(7:9) = hard_target;
label = drone_prop_test113600_label;
save("2022-12-16/drone-prop-test113600/orientation_label.mat","label");
label(2:6) = pos_motor;
save("2022-12-16/drone-prop-test113600/position_label.mat","label");
label(2:6) = speed_fast;
save("2022-12-16/drone-prop-test113600/speed_label.mat","label");

drone_prop_test113902_label = blankVec;
drone_prop_test113902_label(2:6) = orientation_perp;
drone_prop_test113902_label(7:9) = hard_target;
label = drone_prop_test113902_label;
save("2022-12-16/drone-prop-test113902/orientation_label.mat","label");
label(2:6) = pos_motor_and_prop;
save("2022-12-16/drone-prop-test113902/position_label.mat","label");
label(2:6) = speed_stationary;
save("2022-12-16/drone-prop-test113902/speed_label.mat","label");

drone_prop_test114132_label = blankVec;
drone_prop_test114132_label(2:6) = orientation_perp;
drone_prop_test114132_label(7:10) = hard_target;
label = drone_prop_test114132_label;
save("2022-12-16/drone-prop-test114132/orientation_label.mat","label");
label(2:6) = pos_motor_and_prop;
save("2022-12-16/drone-prop-test114132/position_label.mat","label");
label(2:6) = speed_slow;
save("2022-12-16/drone-prop-test114132/speed_label.mat","label");

drone_prop_test114547_label = blankVec;
drone_prop_test114547_label(2:6) = orientation_perp;
drone_prop_test114547_label(7:10) = hard_target;
label = drone_prop_test114547_label;
save("2022-12-16/drone-prop-test114547/orientation_label.mat","label");
label(2:6) = pos_motor_and_prop;
save("2022-12-16/drone-prop-test114547/position_label.mat","label");
label(2:6) = speed_medium;
save("2022-12-16/drone-prop-test114547/speed_label.mat","label");

drone_prop_test114827_label = blankVec;
drone_prop_test114827_label(2:6) = orientation_perp;
drone_prop_test114827_label(7:10) = hard_target;
label = drone_prop_test114827_label;
save("2022-12-16/drone-prop-test114827/orientation_label.mat","label");
label(2:6) = pos_motor_and_prop;
save("2022-12-16/drone-prop-test114827/position_label.mat","label");
label(2:6) = speed_fast;
save("2022-12-16/drone-prop-test114827/speed_label.mat","label");

drone_prop_test115513_label = blankVec;
drone_prop_test115513_label(2:5) = orientation_on_axis;
drone_prop_test115513_label(7:9) = hard_target;
label = drone_prop_test115513_label;
save("2022-12-16/drone-prop-test115513/orientation_label.mat","label");
label(2:5) = pos_motor_and_prop;
save("2022-12-16/drone-prop-test115513/position_label.mat","label");
label(2:5) = speed_stationary;
save("2022-12-16/drone-prop-test115513/speed_label.mat","label");

drone_prop_test115825_label = blankVec;
drone_prop_test115825_label(2:5) = orientation_on_axis;
drone_prop_test115825_label(7:9) = hard_target;
label = drone_prop_test115825_label;
save("2022-12-16/drone-prop-test115825/orientation_label.mat","label");
label(2:5) = pos_motor_and_prop;
save("2022-12-16/drone-prop-test115825/position_label.mat","label");
label(2:5) = speed_slow;
save("2022-12-16/drone-prop-test115825/speed_label.mat","label");

drone_prop_test120102_label = blankVec;
drone_prop_test120102_label(2:5) = orientation_on_axis;
drone_prop_test120102_label(7:9) = hard_target;
label = drone_prop_test120102_label;
save("2022-12-16/drone-prop-test120102/orientation_label.mat","label");
label(2:5) = pos_motor_and_prop;
save("2022-12-16/drone-prop-test120102/position_label.mat","label");
label(2:5) = speed_medium;
save("2022-12-16/drone-prop-test120102/speed_label.mat","label");

drone_prop_test120340_label = blankVec;
drone_prop_test120340_label(2:5) = orientation_on_axis;
drone_prop_test120340_label(7:9) = hard_target;
label = drone_prop_test120340_label;
save("2022-12-16/drone-prop-test120340/orientation_label.mat","label");
label(2:5) = pos_motor_and_prop;
save("2022-12-16/drone-prop-test120340/position_label.mat","label");
label(2:5) = speed_fast;
save("2022-12-16/drone-prop-test120340/speed_label.mat","label");
