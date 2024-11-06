use "$rdata/data_state_figs_tables", clear

*Figure 9: Scatter plot of changes in state-level labor share and labor rent share, long differences
twoway (scatter  laborshare_d8416 imprentshare_d8416 if year==2014, ///
	mlab(statecode)) ///
	(lfit laborshare_d8416 imprentshare_d8416 if year==2014, lcolor(cranberry)) ///
	, graphregion(color(white)) legend(off) ytitle("Change in labor share of state GDP, 1984-88 to 2012-16") xtitle("Change in imputed labor rent share of state GDP, 1984-88 to 2012-16")
	graph export "$rfigures/Figure9.png", replace	
	
*Figure 14: Scatter plot of changes in state-level unemployment and labor rent share, long differences
twoway (scatter  unemploymentrate_d8416 imprentshare_d8416 if year==2014, ///
	mlab(statecode)) ///
	(lfit unemploymentrate_d8416 imprentshare_d8416  if year==2014, lcolor(cranberry)) ///
	, graphregion(color(white)) legend(off) ytitle("Change in state unemployment rate, 1984-88 to 2012-16") xtitle("Change in imputed labor rent share of state GDP, 1984-88 to 2012-16") 
	graph export "$rfigures/Figure14.png", replace

*Appendix Figure C18: Change in industry rent share and union rent share, by state	
twoway scatter imprentshare_iwd_d8416 imprentshare_uwp_d8416 if year==2014 ///
	, graphregion(color(white)) mlabel(statecode) ///
	ytitle("Imputed industry rent share, change 1984-88 to 2012-16") ///
	xtitle("Imputed union rent share, change 1984-88 to 2012-16")
graph export "$rfigures/AppendixFigureC18.png", replace

*Appendix Figure C19: Change in firm size rent share and union rent share, by state
twoway scatter imprentshare_fs_d8416 imprentshare_uwp_d8416 if year==2014 ///
	, graphregion(color(white)) mlabel(statecode) ///
	ytitle("Imputed firm size rent share, change 1984-88 to 2012-16") ///
	xtitle("Imputed union rent share, change 1984-88 to 2012-16")
graph export "$rfigures/AppendixFigureC19.png", replace
	

