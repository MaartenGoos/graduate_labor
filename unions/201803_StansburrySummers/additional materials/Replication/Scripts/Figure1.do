use "$rdata/data_fig1", clear

*Figure 1: Union membership and coverage rates, private sector, over time
twoway ///
	(connected unionmem year, mcolor(navy) lcolor(navy)) /// 
	(connected unioncov year, mcolor(cranberry) lcolor(cranberry)) ///
	, graphregion(color(white)) ///
	xtitle("") ytitle("Union membership/coverage rate, private sector") ///
	legend(order(1 "Union membership rate" 2 "Union coverage rate")) ///
	ysc(r(0 0.25))
graph export "$rfigures/Figure1.png", replace