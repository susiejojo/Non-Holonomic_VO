clc;clear;
agent_pos = [0 0];
agent_goal = [7 7];
obst_pos = [3 3];
time_sample = 0.1;
iter = 1;
vmax = 0.5;
wmax = 1;
theta = atan2(agent_goal(2)-agent_pos(2),agent_goal(1)-agent_pos(1));
% theta = [1 1];
agent_rad = 0.3;
obst_rad = 0.2;
agent_velo = [1.5 0];
obst_velo = [-0.1 -0.1];
agent_pos_list = [];
v = zeros(100000,1);
while (norm(agent_pos-agent_goal)>0.1)
    ctrl = getControls(agent_goal,vmax,wmax,agent_pos,agent_velo,theta,time_sample,agent_rad+obst_rad,obst_velo,obst_pos);
    agent_velo = [ctrl(1) ctrl(2)];
    ctrl
    agent_pos = [agent_pos(1)+ctrl(1)*time_sample*cos((theta+ctrl(2)*time_sample)),agent_pos(2)+ctrl(1)*time_sample*sin((theta+ctrl(2)*time_sample))];
    theta = theta + ctrl(2)*time_sample;
    agent_pos_list = [agent_pos_list;agent_pos];
    F(iter) = plot_figs(agent_pos,agent_rad,agent_goal,theta,obst_pos,obst_rad);
    obst_pos = [obst_pos(1)+time_sample*obst_velo(1) obst_pos(2)+time_sample*obst_velo(2)];
    basefilename = sprintf('snap%d.png',iter);
    fullname = fullfile('data/',basefilename);
    saveas(F(iter),fullname);
    clf;
    hold on;
    plot(agent_pos_list(:,1),agent_pos_list(:,2),'b*');
    iter=iter+1;
end