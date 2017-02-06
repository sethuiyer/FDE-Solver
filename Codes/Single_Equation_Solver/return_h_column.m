function [ H,X ] = return_h_column( i,k )
   
    f=@(x,j,k)
 ((x<((0.5+k)/2^j))&&(x>=(k/2^j)))-(x<((1+k)/2^j)&&(x>=((0.5+k)/2^j)));
    [J K]=generate_j_k(k-1);    
    H=1;
    X=(2*i-1)/(2*(k));
    for j=1:k-1
        H=[H;((2^(J(j)/2))*f(X,J(j),K(j)))];
    end
    
    


end

