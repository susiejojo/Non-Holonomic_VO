function ctrl = getControls(agent_goal,vmax,wmax,agent_pos,agent_v,current_head,time_sample,R,obst_v,obst_pos)
    init = [0 0];
    A = [];
    b = [];
    Aeq = [];
    beq = [];
    lb = [-vmax;-wmax];
    ub = [vmax;wmax];
    rel_pos = obst_pos - agent_pos;
    v_desired=vmax*(agent_goal-agent_pos)/norm(agent_goal-agent_pos);
    cost = @(u)norm(v_desired-(u(1)*[cos(current_head + time_sample*u(2)) sin(current_head + time_sample*u(2))]));
    constr = @(u)getConstraints(u,current_head,R,agent_v(2),rel_pos(1),rel_pos(2),agent_v(1),obst_v,time_sample);
%     cost = @(u)norm([agent_pos(1)+u(1)*time_sample*cos((current_head+u(2)*time_sample)) agent_pos(2)+u(1)*time_sample*sin((current_head+u(2)*time_sample))]-agent_goal);
    ctrl = fmincon(cost,init,A,b,Aeq,beq,lb,ub,constr);
end
