function [] = get_figure(d_H_FW,r_,n_,d,m,SNR) 
    figure
    styles = ["b-*","g-*","b-*","k-*","r--s","g--s","b--s","k--s"];
    plot(r_,round(d_H_FW,2),styles(1),'MarkerSize',12,'LineWidth', 1.75);
    xlabel('$r$','Interpreter','Latex','Fontsize',17);
	ylabel('$d_H/n$','Fontsize',17,'Interpreter','Latex');
	grid('on')
	xticklabels = (r_);
	xticks = (r_);
	set(gca, 'XTick', xticks, 'XTickLabel', xticklabels,'FontSize',13);
	title(['$ n = $',num2str(n_),' $d = $',num2str(d), ' $m = $',num2str(m), ' $\textrm{SNR} = $',num2str(SNR)],'interpreter','Latex',...
        'FontSize',13)
end
