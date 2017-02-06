%-- Functional approximation using haar wavelets --%
function [ap,z,err] = approx()
tic
[wl,x]=wpfun('db1',63);

%-- wl is 63 X 130 matrix now --%
y=x;
%-- this is the function to approximate --%
for i=1:63
    g=y.*wl(i,:);
    s=sum(g(1:length(x)));
    c(i)=s/length(x);
end
%-- calculating <ui(x) fi(x)> --%
ap=0;
for i=1:63
    ap=ap+c(i).*wl(i,:);
end
%-- f(x) = summation i from 0 to k-1 ci * hi --%
z=x;
plot(x,ap); hold on; plot(x,y); xlabel('x'); ylabel('y');

%-- compare the approximation --%

err=sqrt(abs((ap-y).*(ap-y)));
%-- computes the error --%
toc
print -deps lalu9
end