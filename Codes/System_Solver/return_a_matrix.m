function [ A ] = return_a_matrix( f,k )
v=[];
for i=1:k
    v=[v,f((2*i-1)/(2*k))];
end

A=diag(v);

end

