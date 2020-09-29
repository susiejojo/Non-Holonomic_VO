function [constr,ceq] = getConstraints(controls,theta0,R,w0,rrobx,rroby,vrob,vobs,dt)
vr = controls(1);
w = controls(2);
t0 = term1(rrobx,rroby,vrob,vobs,R,w0,theta0,dt);
t1 = term2(rrobx,rroby,vobs,vrob,w0,theta0,dt,vr,w,R);
t2 = term3(rrobx,rroby,vobs,vrob,w0,theta0,dt,vr,w,R);
constr = t0 + t1*controls(1) + t2*controls(2);
constr
ceq = [];
end