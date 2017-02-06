k=4;
alpha=3;
f1=@(x,u1,u2,u3) 2*u2^2;
f2=@(x,u1,u2,u3) x*u1;
f3=@(x,u1,u2,u3) u2*u3;

A=sym('a',[1 k]);
B=sym('b',[1 k]);
C=sym('c',[1 k]);

P=return_p_matrix(alpha,k);

LHSA=[];
for i=1:k
    LHSA=[LHSA;A*return_h_column(i,k)];
end

LHSB=[];
for i=1:k
    LHSB=[LHSB;B*return_h_column(i,k)+1];
end

LHSC=[];
for i=1:k
    LHSC=[LHSC;C*return_h_column(i,k)+1];
end

RHSA=[];
RHSB=[];
RHSC=[];
for i=1:k
    
    JB=A*P*return_h_column(i,k);
    JC=B*P*return_h_column(i,k);
    JD=C*P*return_h_column(i,k);
    J1=f1((2*i-1)/(2*k),JB,JC,JD);
    J2=f2((2*i-1)/(2*k),JB,JC,JD);
    J3=f3((2*i-1)/(2*k),JB,JC,JD);
    RHSA=[RHSA;J1];
    RHSB=[RHSB;J2];
    RHSC=[RHSC;J3];
end

LHS=[LHSA;LHSB;LHSC];
RHS=[RHSA;RHSB;RHSC];

EQN=[];
for i=1:3*k
    EQN=[EQN,LHS(i)==RHS(i)];
end

VAR=[A,B,C];

[a1,a2,a3,a4,b1,b2,b3,b4,c1,c2,c3,c4]=vpasolve(EQN,VAR);
[wl,x]=wpfun('db1',k);
PK=wl(0,:)*a1(0)+wl(1,:)*a2(0)+wl(2,:)*a3(0)+wl(4,:)*a4(0);
plot(x,pk);
