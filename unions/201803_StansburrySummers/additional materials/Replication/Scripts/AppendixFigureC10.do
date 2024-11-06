use "$rdata/data_fig_c10", clear

*Appendix Figure C10: Graph of private sector union wage premium over time, by education group
twoway (connected uwp year if educ_cat_broad==1, lcolor(navy) mcolor(navy)) ///
		(connected uwp year if educ_cat_broad==2, lcolor(cranberry) mcolor(cranberry)) ///
	, graphregion(color(white)) legend(order(1 "High School or Some College" 2 "BA+")) ///
	xtitle("") ytitle("Log union wage premium")
	graph export "$rfigures/AppendixFigureC10.png", replace
	