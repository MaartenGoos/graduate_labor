use "$rdata/data_fig_c9", clear

*Appendix Figure C9: Private sector unionization rate, by education group
twoway (connected unionrate_educ year if educ_cat_broad==1, lcolor(navy) mcolor(navy)) ///
		(connected unionrate_educ year if educ_cat_broad==2, lcolor(cranberry) mcolor(cranberry)) ///
	, graphregion(color(white)) legend(order(1 "High School or Some College" 2 "BA +")) ///
	xtitle("") ytitle("Union coverage rate")
	graph export "$rfigures/AppendixFigureC9.png", replace

