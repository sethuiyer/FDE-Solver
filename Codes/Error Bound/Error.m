k=8;l=2;m=1;alpha=1/4;
Q=return_operational_matrix(k,0);
C=sym('c',[1 k]);
Y=load('Y');
Y=Y.Y;

LHS=[];
for i=1:k
    LHS=[LHS,C*Q*return_h_column(i,k)];
end

[c1 c2 c3 c4 c5 c6 c7 c8] = vpasolve(Y==LHS,C)

c1=double(c1);
c2=double(c2);
c3=double(c3);
c4=double(c4);
c5=double(c5);
c6=double(c6);
c7=double(c7);
c8=double(c8);

C=[c1,c2,c3,c4,c5,c6,c7,c8];

Z=[];
for i=1:l
    Z=[Z,C*return_h_column_x((i-1)/(l),k)];
end
    
E=return_error_bound(max(Z),k,m,alpha);

