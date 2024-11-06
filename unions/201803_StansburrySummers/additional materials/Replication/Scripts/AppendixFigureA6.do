use "$rdata/data_fig_a6", clear

*APPENDIX FIGURE A6: Graph of pattern over time for raw industry fixed effects, employment-weighted and non-employment-weighted
twoway ///
(line c6_wsd_sectornum year, lcolor(navy)) ///
(scatter c6_wsd_sectornum year, mcolor(navy)) ///
(line c6_wsd_indcode year, lcolor(cranberry)) ///
(scatter c6_wsd_indcode year, mcolor(cranberry)) ///
(line c6_wsd_ind_3d year, lcolor(dkorange)) ///
(scatter c6_wsd_ind_3d year, mcolor(dkorange)) ///
(line c6_sd_sectornum year, lcolor(navy) lpattern(dash)) ///
(line c6_sd_indcode year, lcolor(cranberry) lpattern(dash)) ///
(line c6_sd_ind_3d year, lcolor(dkorange) lpattern(dash)), ///
	ytitle("Std. dev. of industry log wage fixed effects") ///
	legend(order (1 "Sector, Emp-wt" 3 "Industry, Emp-wt" 5 "Detailed industries, Emp-wt" ///
		7 "Sector, No wt" 8 "Industry, No wt" 9 "Detailed industries, No wt") rows(3)) ///
	graphregion(color(white)) xtitle("")	 ysc(r(0.04 0.16))
graph export "$rfigures/AppendixFigureA6.png", replace