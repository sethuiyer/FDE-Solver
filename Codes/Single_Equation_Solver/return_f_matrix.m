function [ F ] = return_f_matrix( alpha,k )
e=@(x)(((x+1)^(alpha+1))-(2*x^(alpha+1))+((x-1)^(alpha+1)));
F=eye(k);

for i=1:k
    for j=(i+1):k
        F(i,j)=e(j-i);    
    end 
end

F=F./(k^alpha);
F=F./(gamma(alpha+2));

end

