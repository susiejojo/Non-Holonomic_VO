function t1 = term1(v,w,x0,theta0,time_sample,iter)
    t1 = x0;
    for i = 1:iter
        t1 = t1 + v(i)*time_sample*cos((theta0+sum(w(1:iter))/180*pi)*time_sample);
    end
end