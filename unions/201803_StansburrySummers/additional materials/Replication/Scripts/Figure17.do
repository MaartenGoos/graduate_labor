
*Figure 17
use "$rdata/data_fig_17", clear
keep if year>=1980
twoway ///
	(connected nominal year  `cond',mcolor(navy) lcolor(navy)) (lfit nominal year `cond', lcolor(navy) lpattern(dash)) ///
	(connected real year `cond', mcolor(cranberry) lcolor(cranberry)) (lfit real year `cond', lcolor(cranberry) lpattern(dash)) ///
	, legend(order (1 "Net investment / net value added, nonfinancial corporate" 3 "Real net investment / real net value added, nonfinancial corporate") rows(2)) graphregion(color(white)) xscale(range(1980 2016)) xlabel(1980(5)2015) xtitle("")
graph export "$rfigures/Figure17.png", replace
