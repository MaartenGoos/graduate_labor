use "$rdata/data_fig_c3", replace

*Figure C3: Graph of wage premia and concentration, two periods
local indep cr20

 twoway ///
 (lfit wagepremium_ma5 `indep' if year<=1997 & sector_sic!="Retail trade", lpattern(dash) lcolor(navy)) ///
 (lfit wagepremium_ma5 `indep' if year>1997 & sector_sic!="Retail trade", lpattern(dash) lcolor(cranberry)) ///
	 (scatter wagepremium_ma5 `indep' if sector_sic=="Manufacturing" & year>1997 , mcolor(black) msymbol(Oh) ) ///
  (scatter wagepremium_ma5 `indep' if sector_sic=="Services"& year>1997 , mcolor(black) msymbol(Dh)) ///
   (scatter wagepremium_ma5 `indep' if sector_sic=="Wholesale trade"& year>1997 , mcolor(black) msymbol(Th)) ///
    (scatter wagepremium_ma5 `indep' if sector_sic=="Transportation and utilities"& year>1997 , mcolor(black) msymbol(Sh)) ///
	 (scatter wagepremium_ma5 `indep' if sector_sic=="Finance, insurance, and real estate"& year>1997 , mcolor(black) msymbol(+)) ///
 (scatter wagepremium_ma5 `indep' if sector_sic=="Manufacturing" & year<=1997 , mcolor(navy) msymbol(O) ) ///
  (scatter wagepremium_ma5 `indep' if sector_sic=="Services"& year<=1997 , mcolor(navy) msymbol(D)) ///
   (scatter wagepremium_ma5 `indep' if sector_sic=="Wholesale trade"& year<=1997 , mcolor(navy) msymbol(T)) ///
    (scatter wagepremium_ma5 `indep' if sector_sic=="Transportation and utilities"& year<=1997 , mcolor(navy) msymbol(S)) ///
	 (scatter wagepremium_ma5 `indep' if sector_sic=="Finance, insurance, and real estate"& year<=1997 , mcolor(navy) msymbol(+)) ///
	  (scatter wagepremium_ma5 `indep' if sector_sic=="Manufacturing" & year>1997 , mcolor(cranberry) msymbol(O) ) ///
  (scatter wagepremium_ma5 `indep' if sector_sic=="Services"& year>1997 , mcolor(cranberry) msymbol(D)) ///
   (scatter wagepremium_ma5 `indep' if sector_sic=="Wholesale trade"& year>1997 , mcolor(cranberry) msymbol(T)) ///
    (scatter wagepremium_ma5 `indep' if sector_sic=="Transportation and utilities"& year>1997 , mcolor(cranberry) msymbol(S)) ///
	 (scatter wagepremium_ma5 `indep' if sector_sic=="Finance, insurance, and real estate"& year>1997 , mcolor(cranberry) msymbol(+)) ///
,  ytitle("Log wage premium, rel. to Retail Trade") xtitle("Top 20 Firm Concentration Ratio") ///
legend(order(1 "Blue: 1982, 1987, 1992, 1997" 2 "Red: 2002, 2007, 2012" 3 "Manufacturing" 4 "Services" 5 "Wholesale Trade" 6 "TCU" 7 "FIRE") rows(4)) ///
graphregion(color(white)) xsc(range(0.2 0.7)) xlabel(0.2(0.1)0.7) 
graph export "$rfigures/AppendixFigureC3.png", replace
