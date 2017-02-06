function [ E ] = return_error_bound(M,k,m,alpha )

E=M/(gamma(alpha)*gamma(m-alpha)*alpha*(m-alpha)*((1-2^(2*(alpha-m)))^(1/2))*(k^(m-alpha)));
end

