function ctrl = getControls(agent_goal,vmax,agent_pos,agent_v,current_head,time_sample,R,obst_v,obst_pos,obst_bool,lb,ub)
    init = [0 0];
    A = [];
    b = [];
    Aeq = [];
    beq = [];
    rel_pos = obst_pos - agent_pos;
    v_desired=vmax*(agent_goal-agent_pos)/norm(agent_goal-agent_pos);
    cost = @(u)norm(v_desired-(u(1)*[cos(current_head + time_sample*u(2)) sin(current_head + time_sample*u(2))]));
    if (obst_bool)
    constr = @(u)getConstraints(u,current_head,R,agent_v(2),rel_pos(1),rel_pos(2),agent_v(1),obst_v,time_sample);
    ctrl = fmincon(cost,init,A,b,Aeq,beq,lb,ub,constr);
    else
    ctrl = fmincon(cost,init,A,b,Aeq,beq,lb,ub);
    end
%     cost = @(u)norm([agent_pos(1)+u(1)*time_sample*cos((current_head+u(2)*time_sample)) agent_pos(2)+u(1)*time_sample*sin((current_head+u(2)*time_sample))]-agent_goal);
    
end
