function t = term2(rrobx,rroby,vobs,vrob,w0,theta0,dt,vr,w,R)
  t=vr.*((2.*R.^2+(-1).*rrobx.^2+(-1).*rroby.^2+2.*dt.*(rrobx+rroby).* ...
  vobs+(-2).*dt.^2.*vobs.^2).*(vr+vrob)+(-2).*vobs.*(R.^2+(rrobx+( ...
  -1).*rroby).*(rroby+(-1).*dt.*vobs)).*cos(theta0+dt.*(w+w0))+( ...
  rrobx+(-1).*rroby).*(rrobx+rroby+(-2).*dt.*vobs).*(vr+vrob).*cos( ...
  2.*(theta0+dt.*(w+w0)))+(-2).*vobs.*(R.^2+(-1).*(rrobx+(-1).* ...
  rroby).*(rrobx+(-1).*dt.*vobs)).*sin(theta0+dt.*(w+w0))+2.*(rrobx+ ...
  (-1).*dt.*vobs).*(rroby+(-1).*dt.*vobs).*(vr+vrob).*sin(2.*( ...
  theta0+dt.*(w+w0))));
 
end