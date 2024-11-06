
use "$rdata/data_figs_c1_c2", clear


*Appendix Figure C1: Graph of decline over time, actual unionization rates
capture drop pos
	gen pos = 3
	replace pos = 2 if sector_short=="Services"
	replace pos = 2 if sector_short=="Mining"
twoway ///
	(connected unionrate_ma3 year if sector_sic=="Agriculture, forestry, and fishing", lcolor(gray) mcolor(gray)) ///
	(connected unionrate_ma3 year if sector_sic=="Construction", lcolor(dkgreen) mcolor(dkgreen)) ///
	(connected unionrate_ma3 year if sector_sic=="Finance, insurance, and real estate", lcolor(gold) mcolor(gold)) ///
	(connected unionrate_ma3 year if sector_sic=="Manufacturing", lcolor(navy) mcolor(navy)) ///
	(connected unionrate_ma3 year if sector_sic=="Mining", lcolor(cranberry) mcolor(cranberry)) ///
	(connected unionrate_ma3 year if sector_sic=="Retail trade", lcolor(teal) mcolor(teal)) ///
	(connected unionrate_ma3 year if sector_sic=="Services", lcolor(sienna) mcolor(sienna)) ///
	(connected unionrate_ma3 year if sector_sic=="Transportation and utilities", lcolor(dkorange) mcolor(dkorange)) ///
	(connected unionrate_ma3 year if sector_sic=="Wholesale trade", lcolor(brown) mcolor(brown)) ///
	(scatter unionrate_ma3 year if sector_sic=="Agriculture, forestry, and fishing" & year==2018, mcolor(gray) mlab(sector_short) mlabcolor(gray) mlabv(pos)) ///
	(scatter unionrate_ma3 year if sector_sic=="Construction" & year==2018, mcolor(dkgreen) mlab(sector_short) mlabcolor(dkgreen) mlabv(pos)) ///
	(scatter unionrate_ma3 year if sector_sic=="Finance, insurance, and real estate" & year==2018, mcolor(gold) mlab(sector_short) mlabcolor(gold) mlabv(pos)) ///
	(scatter unionrate_ma3 year if sector_sic=="Manufacturing" & year==2018, mcolor(navy) mlab(sector_short) mlabcolor(navy) mlabv(pos)) ///
	(scatter unionrate_ma3 year if sector_sic=="Mining" & year==2018, mcolor(cranberry) mlab(sector_short) mlabcolor(cranberry) mlabv(pos)) ///
	(scatter unionrate_ma3 year if sector_sic=="Retail trade" & year==2018, mcolor(teal) mlab(sector_short) mlabcolor(teal) mlabv(pos)) ///
	(scatter unionrate_ma3 year if sector_sic=="Services" & year==2018, mcolor(sienna) mlab(sector_short) mlabcolor(sienna) mlabv(pos)) ///
	(scatter unionrate_ma3 year if sector_sic=="Transportation and utilities" & year==2018, mcolor(dkorange) mlab(sector_short) mlabcolor(dkorange) mlabv(pos)) ///
	(scatter unionrate_ma3 year if sector_sic=="Wholesale trade" & year==2018, mcolor(brown) mlab(sector_short) mlabcolor(brown) mlabv(pos)) ///
	, legend(off) xtitle("") xsc(r(1984 2025)) xlabel(1985 (5) 2020) graphregion(margin(large)) ///
	graphregion(color(white)) ytitle("Unionization rate, 3-year moving average") ///
	xtitle("")
	graph export "$rfigures/AppendixFigureC1.png", replace	

*Appendix Figure C2: Graph of decline over time, indexed to 1984-86 level of unionization
twoway ///
	(connected u_ma3_i85 year if sector_sic=="Agriculture, forestry, and fishing", lcolor(gray) mcolor(gray)) ///
	(connected u_ma3_i85 year if sector_sic=="Construction", lcolor(dkgreen) mcolor(dkgreen)) ///
	(connected u_ma3_i85 year if sector_sic=="Finance, insurance, and real estate", lcolor(gold) mcolor(gold)) ///
	(connected u_ma3_i85 year if sector_sic=="Manufacturing", lcolor(navy) mcolor(navy)) ///
	(connected u_ma3_i85 year if sector_sic=="Mining", lcolor(cranberry) mcolor(cranberry)) ///
	(connected u_ma3_i85 year if sector_sic=="Retail trade", lcolor(teal) mcolor(teal)) ///
	(connected u_ma3_i85 year if sector_sic=="Services", lcolor(sienna) mcolor(sienna)) ///
	(connected u_ma3_i85 year if sector_sic=="Transportation and utilities", lcolor(dkorange) mcolor(dkorange)) ///
	(connected u_ma3_i85 year if sector_sic=="Wholesale trade", lcolor(brown) mcolor(brown)) ///
	(scatter u_ma3_i85 year if sector_sic=="Agriculture, forestry, and fishing" & year==2018, mcolor(gray) mlab(sector_short) mlabcolor(gray)) ///
	(scatter u_ma3_i85 year if sector_sic=="Construction" & year==2018, mcolor(dkgreen) mlab(sector_short) mlabcolor(dkgreen)) ///
	(scatter u_ma3_i85 year if sector_sic=="Finance, insurance, and real estate" & year==2018, mcolor(gold) mlab(sector_short) mlabcolor(gold)) ///
	(scatter u_ma3_i85 year if sector_sic=="Manufacturing" & year==2018, mcolor(navy) mlab(sector_short) mlabcolor(navy)) ///
	(scatter u_ma3_i85 year if sector_sic=="Mining" & year==2018, mcolor(cranberry) mlab(sector_short) mlabcolor(cranberry)) ///
	(scatter u_ma3_i85 year if sector_sic=="Retail trade" & year==2018, mcolor(teal) mlab(sector_short) mlabcolor(teal)) ///
	(scatter u_ma3_i85 year if sector_sic=="Services" & year==2018, mcolor(sienna) mlab(sector_short) mlabcolor(sienna)) ///
	(scatter u_ma3_i85 year if sector_sic=="Transportation and utilities" & year==2018, mcolor(dkorange) mlab(sector_short) mlabcolor(dkorange)) ///
	(scatter u_ma3_i85 year if sector_sic=="Wholesale trade" & year==2018, mcolor(brown) mlab(sector_short) mlabcolor(brown)) ///
	, legend(off) xtitle("") xsc(r(1984 2025)) xlabel(1985 (5) 2020) graphregion(margin(large)) ///
	graphregion(color(white)) ytitle("Unionization rate, 3-year moving average," "relative to 1984-1986 level (indexed to 100)") ///
	xtitle("")
	graph export "$rfigures/AppendixFigureC2.png", replace
	
