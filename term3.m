function t3 = term3(v,w,theta0,time_sample,iter)
    t3 = 0;
    for i = 1:iter
        t3 = t3  - v(i)*(time_sample)^2*sin((theta0+sum(w(1:iter))/180*pi)*time_sample)*(w-w(i));
    end
end