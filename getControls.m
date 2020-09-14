function ctrl = getControls(agent_goal,vmax,wmax,agent_pos,agent_v,current_head,time_sample)
    init = [0 0];
    A = [];
    b = [];
    Aeq = [];
    beq = [];
    lb = [-vmax;-wmax];
    ub = [vmax;wmax];
    v_desired=vmax*(agent_goal-agent_pos)/norm(agent_goal-agent_pos);
    cost = @(u)norm(v_desired-(u(1)*[cos(current_head + time_sample*u(2)) sin(current_head + time_sample*u(2))])) ;
    ctrl = fmincon(cost,init,A,b,Aeq,beq,lb,ub);
end
