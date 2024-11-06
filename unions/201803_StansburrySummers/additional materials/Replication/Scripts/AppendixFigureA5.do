*Make Appendix Figure A5

use "$rdata/data_figs_3_a5", clear

*APPENDIX FIGURE A5: Graph of pattern over time for raw industry fixed effects, employment-weighted and non-employment-weighted
local cond if year>=1984
twoway ///
(line c6_wsd_sectornum year `cond', lcolor(navy)) ///
(scatter c6_wsd_sectornum year `cond', mcolor(navy)) ///
(line c6_wsd_indcode year `cond', lcolor(cranberry)) ///
(scatter c6_wsd_indcode year `cond', mcolor(cranberry)) ///
(line c6_wsd_ind_3d year `cond', lcolor(dkorange)) ///
(scatter c6_wsd_ind_3d year `cond', mcolor(dkorange)) ///
(line c6_sd_sectornum year `cond', lcolor(navy) lpattern(dash)) ///
(line c6_sd_indcode year `cond', lcolor(cranberry) lpattern(dash)) ///
(line c6_sd_ind_3d year `cond', lcolor(dkorange) lpattern(dash)), ///
	ytitle("Std. dev. of industry log wage fixed effects") ///
	legend(order (1 "Sector, Emp-wt" 3 "Industry, Emp-wt" 5 "Detailed industries, Emp-wt" ///
		7 "Sector, No wt" 8 "Industry, No wt" 9 "Detailed industries, No wt") rows(3)) ///
	graphregion(color(white)) xtitle("")	 ysc(r(0.04 0.16))
graph export "$rfigures/AppendixFigureA5.png", replace
