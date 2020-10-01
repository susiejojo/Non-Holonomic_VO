function cost1 = cost_fn(v,w,agent_goal,agent_pos,agent_v)
%     xnew = term1(v,w,x0,theta0,time_sample,iter)+term2(v,w,theta0,time_sample,iter)+term3(v,w,theta0,time_sample,iter);
%     ynew = term1(v,w,x0,theta0,time_sample,iter)+term2(v,w,theta0,time_sample,iter)+term3(v,w,theta0,time_sample,iter);
    v_desired=vmax*(agent_goal-agent_pos)/norm(agent_goal-agent_pos);
    fun = @(u)norm(v_desired-((agent_v(1)+u(1))*[cos(current_head + dt*(agent_v(2)+u(2))) sin(current_head + dt*(agent_v(2)+u(2)))])) ;

end