function [ H ] = return_h_column_x( x,k )
   
    f=@(x,j,k) ((x<((0.5+k)/2^j))&&(x>=(k/2^j)))-(x<((1+k)/2^j)&&(x>=((0.5+k)/2^j)));
    [J K]=generate_j_k(k-1);    
    H=1;
    
    for j=1:k-1
        H=[H;((2^(J(j)/2))*f(x,J(j),K(j)))];
    end
end

