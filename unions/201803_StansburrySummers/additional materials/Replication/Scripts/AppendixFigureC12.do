use "$rdata/data_fig_c12", clear

*Appendix Figure C12
twoway (line wp_half_reltozero_6 year if educ_cat_broad==1, lcolor(navy)) (line wp_half_reltozero_6 year if educ_cat_broad==2, lcolor(cranberry)) ///
	, by(sectorshort) graphregion(color(white)) legend(order(1 "No college or some college" 2 "BA+")) xtitle("") ytitle("Estimated log wage premium")
	graph export "$rfigures/AppendixFigureC12.png", replace