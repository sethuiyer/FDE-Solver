function [J,K] = generate_j_k( n )
    j=0;k=0;J=[];K=[];
    for i=1:n   
    k=0;
    while i~=2^j+k
        k=k+1;
        if k==2^j
            j=j+1;k=0;
            break
        end
    end
    J=[J,j];
    K=[K,k];  
    end 
end







