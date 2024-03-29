function [pi_fw,Y_hat_A] = rlus(B,Y_permuted_noisy,r)
pi_lp            = stage_A_rlus(B,Y_permuted_noisy,r);
Y_hat_A          = B*(...
                   B...
                   \(pi_lp'*Y_permuted_noisy)...
                   );
[pi_fw]          = stage_B_rlus(r,...
                          Y_hat_A,...
                          Y_permuted_noisy,...
                          pi_lp); 
