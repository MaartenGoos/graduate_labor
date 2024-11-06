*Make Figure 3
use "$rdata/data_figs_3_a5", clear

*FIGURE 3: Graph of pattern over time for raw industry fixed effects, employment-weighted
local i 6
local cond if year>=1984
twoway ///
(line c`i'_wsd_sectornum year `cond', lcolor(navy)) ///
(scatter c`i'_wsd_sectornum year `cond', mcolor(navy)) ///
(line c`i'_wsd_indcode year `cond', lcolor(cranberry)) ///
(scatter c`i'_wsd_indcode year `cond', mcolor(cranberry)) ///
(line c`i'_wsd_ind_3d year `cond', lcolor(dkorange)) ///
(scatter c`i'_wsd_ind_3d year `cond', mcolor(dkorange)), ///
	ytitle("Employment-weighted std. dev. of" "industry log wage fixed effects") ///
	legend(order (1 "Sector" 3 "Industry" 5 "Detailed industries") rows(1)) ///
	graphregion(color(white)) xtitle("")	 ysc(r(0.04 0.15))
graph export "$rfigures/Figure3.png", replace
