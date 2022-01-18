clc
str = pwd;
k   = strfind(str,'\');
str = str(1:k(end-1));
cd (str)
addpath('code\misc',...
        'code\rlus',...
        'code\gw')
MC              = 25;
SNR_log         = 0.1:3;
SNR_            = 10.^(linspace(SNR_log(1),SNR_log(end),10));
d               = 25;
m               = 25;
r               = 50;
n               = 600;
d_H_lp          = zeros(1,length(SNR_));
d_H_fw          = zeros(1,length(SNR_));
d_H_gw          = zeros(1,length(SNR_));
X               = randn(d,m);
B               = randn(n,d); 
Y               = B*X;
Y               = Y/norm(X,'fro');
X               = X/norm(X,'fro'); %not needed
epsilon         = 5e-3;
options  = optimoptions('linprog','Display','none');
    for j = 1 : length(SNR_)
        SNR       = SNR_(j);
        noise_var = 1  / (SNR*m);
        W_big     = sqrt(noise_var)*randn(n,m,MC);
            for k = 1 : MC
                 pi_                = make_r_local_permutation(n,r);
                 Y_permuted         = pi_*Y;
                 Y_permuted_noisy   = Y_permuted + W_big(1:n,:,k);
                 [pi_fw,Y_hat_lp]   = rlus(B,Y_permuted_noisy,r);
                 d_H                = sum(sum(pi_ ~= pi_fw))/2;
                 d_H_fw(j)          = d_H/n + d_H_fw(j);
                 [~,pi_gw]          = gw_l2(epsilon,50,300,r,...
                                      B,Y_hat_lp,Y_permuted_noisy);
                 d_H                = sum(sum(pi_ ~= pi_gw'))/2;
                 d_H_gw(j)          = d_H/n + d_H_gw(j);
            end
    end
d_H_lp       = d_H_lp/MC
d_H_fw       = d_H_fw/MC
d_H_gw       = d_H_gw/MC
get_figures(d_H_fw,d_H_gw,r,n,d,m,SNR_,SNR_log,epsilon) 