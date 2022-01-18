str = pwd;
k   = strfind(str,'\');
str = str(1:k(end-1));
cd (str)
addpath('code\misc',...
        'code\rlus')
clc
close all;
MC              = 25;
SNR             = 100;
d               = 50;
m               = 50;
r_              = [20 25 30 40 50];
n_              = [600];
d_H_fw          = zeros(length(n_),length(r_));
X               = randn(d,m);
B               = randn(max(n_),d); 
Y               = B*X;
Y               = Y/norm(X,'fro');
noise_var   	= 1  / (SNR*m);
W_big           = sqrt(noise_var)*randn(max(n_),m,MC);
options  = optimoptions('linprog','Display','none');
    for j = 1 : length(r_)
		r           = r_(j);
        for i = 1 : length(n_)
            n          = n_(i);
            Y_         = Y(1:n,:);
            for k = 1 : MC
                pi_                = make_r_local_permutation(n,r);
                Y_permuted         = pi_*Y_;
                Y_permuted_noisy   = Y_permuted + W_big(1:n,:,k);
                [pi_fw,~]          = rlus(B,Y_permuted_noisy,r);
                d_H                = sum(sum(pi_ ~= pi_fw))/(2*n);
                d_H_fw(i,j)        = d_H + d_H_fw(i,j);
            end
        end
    end
d_H_fw       = d_H_fw/MC;
get_figure(d_H_fw,r_,n_,d,m,SNR) 