function t2 = term2(v,w,theta0,time_sample,iter)
    t2 = 0;
    for i = 1:iter
        t2 = t2 + time_sample*cos((theta0+sum(w(1:iter))/180*pi)*time_sample)*(v-v(i));
    end
end