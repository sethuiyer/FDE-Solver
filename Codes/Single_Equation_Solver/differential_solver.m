
alpha=1/4;k=8;
af=@(x) x^(1/3);
ff=@(x) (3/(2*gamma(2/3)))*x^(2/3)+x^(4/3);
A=return_a_matrix(af,k);
F=return_fvalue_vector(ff,k);
F=F';
H=return_operational_matrix(k,0);
P=return_p_matrix(alpha,k);


E=P*H;
E=E*A;
E=E+H;

C=F/E;

Y=[];X=[];
for i=1:k
    [h,x]=return_h_column(i,k);
    y=C*P*h;
    X=[X,x];
    Y=[Y,y];
end
q=0:.05:1;
NY=interp1(X,Y,q);
plot(q,NY);

% Y=[];
% C=load('C.mat');
% C=C.C;
% PE=return_p_matrix(alpha,1024);
% 
% for i=1:k
%     h=return_h_column_x((2*i-1)/(2*k),1024);
%     y=C*PE*h;   
%     Y=[Y,y];
% end







