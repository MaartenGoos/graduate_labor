use "$rdata/data_figs_b3_b4_b5", clear

*Make panel
xtset educ_cat_broad year

*Smooth variables
local mavars netimplabrentshare implabrentshareofcomp
foreach var of local mavars{
	tssmooth ma `var'_ma3 = `var', window(1 1 1)
	tssmooth ma `var'_ma5 = `var', window(2 1 2)
	}

*Labor rent share of total net value added, by education group
gen helper1 = netimplabrentshare_ma3 if educ_cat_broad==1
bysort year: egen helper2 = mean(helper1)
gen area = netimplabrentshare_ma3 + helper2

drop if year<1984

*AppendixFigure B3: Labor rents for college and non-college workers, as share of total NFCB value added
twoway (area area netimplabrentshare_ma3 year if educ_cat_broad==2  & year>1984 & year<2016, color(navy cranberry) lcolor(navy cranberry)), ///
	graphregion(color(white)) legend(order(1 "High School or Some College" 2 "BA+")) ///
	xtitle("") ytitle("Labor rents as share of net value added," "Nonfinancial corporate business, 3yma") xsc(r(1984 2016)) xlabel(1985 1990 1995 2000 2005 2010 2015) ysc(r(0 0.12))
	graph export "$rfigures/AppendixFigureB3.png", replace
	
*AppendixFigureB4: Labor rent share of each education group's imputed compensation
twoway (connected implabrentshareofcomp_ma3 year if educ_cat_broad==1  & year>1984 & year<2016, lcolor(navy) mcolor(navy)) (connected implabrentshareofcomp_ma3 year if educ_cat_broad==2  & year>1984 & year<2016, lcolor(cranberry) mcolor(cranberry)), ///
	graphregion(color(white)) legend(order(1 "High School or Some College" 2 "BA+")) ///
	xtitle("") ytitle("Labor rents, % of education group's compensation," "Nonfinancial corporate business, 3yma") ///
	xsc(r(1984 2016)) xlabel(1985 1990 1995 2000 2005 2010 2015)
	graph export "$rfigures/AppendixFigureB4.png", replace


*Appendix Figure B5: Graph of firm size rents: calculations, and interpolations
twoway (connected imprents_fs_sc year if educ_cat_broad==1 & year>=1990, lcolor(navy) mcolor(navy)) ///
	(line imprentshare_fs_sc_pred year if educ_cat_broad==1, lcolor(navy) lpattern(dash) ) ///
	(connected imprents_fs_sc year if educ_cat_broad==2 & year>=1990, lcolor(cranberry) mcolor(cranberry)) ///
	(line imprentshare_fs_sc_pred year if educ_cat_broad==2, lcolor(cranberry) lpattern(dash) ) ///
	, graphregion(color(white)) legend(order(1 "No college" 2 "No college, trend" 3 "BA+" 4 "BA+, trend") rows(2)) ///
	xtitle("") ytitle("Imputed firm size rents as share of" "education category's compensation")
		graph export "$rfigures/AppendixFigureB5.png", replace

