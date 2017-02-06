function [ fvalue ] = return_fvalue_vector( f,k)
fvalue=[];

for i=1:k
   fvalue=[fvalue;f(((2*i-1)/(2*k)))];
end

end

