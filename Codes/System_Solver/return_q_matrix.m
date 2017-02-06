function [ Q ] = return_q_matrix( k )
    Q=[];
    if k == 1
        Q=1/2;    
    else
        Q=[2*k*return_q_matrix(k/2),-return_operational_matrix(k/2,0);inv(-return_operational_matrix(k/2,0)),zeros(k/2)]/2;    
end

