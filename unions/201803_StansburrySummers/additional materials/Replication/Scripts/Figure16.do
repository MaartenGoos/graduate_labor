use "$rdata/data_fig_16", clear

*Figure 16
twoway (connected diff_unemp year, lcolor(cranberry) mcolor(cranberry) yaxis(1)) /// 
(connected rel_unemp year, lcolor(navy) mcolor(navy) yaxis(2)) ///
, graphregion(color(white)) xtitle("") ytitle("Unemployment rate difference, 3yma") ///
ytitle("Unemployment rate ratio, 3yma", axis(2)) ///
legend(order(1 "Unemployment rate difference (no college - BA+)" 2 "Unemployment rate ratio (no college/BA+)") rows(2))
graph export "$rfigures/Figure16.png", replace
	

