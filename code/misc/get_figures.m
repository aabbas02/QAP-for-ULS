function [] = get_figures(d_H_fw,d_H_gw,r,n,d,m,SNR_,SNR_log,epsilon) 
    figure
    hold on;
    styles = ["b-*","g-*","b-*","k-*","r--s","g--s","b--s","k--s"];
    plot(log10(SNR_),round(d_H_fw,2),styles(1),'DisplayName',['QAP'],...
             'MarkerSize',11,'LineWidth',1.75);
    plot(log10(SNR_),round(d_H_gw,2),styles(2),'DisplayName',['GW'],...
            'MarkerSize',11,'LineWidth', 1.75);
    xlabel('$\log_{10} (SNR)$','Interpreter','Latex','Fontsize',15);
	ylabel('$d_H/n$','Fontsize',15,'Interpreter','Latex');
	grid('on')
    xticks   = SNR_log;
    xlabels  = SNR_log;
    %yticks  = unique(round(yticks/0.05,0)*0.05);
	set(gca, 'XTick', xticks, 'XTickLabel', xlabels,'FontSize',12);
	%set(gca, 'YTick', yticks, 'YTickLabel', yticks,'FontSize',12); 
	title(['n = ', num2str(n),' $d = $',num2str(d), ' $m = $',num2str(m),' $r = $',num2str(r)],'interpreter','Latex')
	Lgnd =  legend('show');
	set(Lgnd, 'Interpreter','latex','Location','northeast')
	%saveas(gcf,['r_',num2str(r),'gw_n_',num2str(n),'_d =_',num2str(d),'_m =_',num2str(m)])
end
