use "$rdata/data_fig_2", clear

*Figure 2
twoway  ///
  (connected estimate period if firmsize_num==4 , lcolor(dkorange) lwidth(thick) mcolor(dkorange)) ///
    (connected estimate period if  firmsize_num==3 , lcolor(cranberry) mcolor(cranberry) lwidth(thick)) ///
  (connected estimate period if firmsize_num==2 , lcolor(navy) mcolor(navy) lwidth(thick)) ///
  , legend(order(3 "100 to 499" 2 "500 to 999" 1 "1,000+") rows(1)) graphregion(color(white)) ///
 xtitle("") ytitle("Log wage premium, rel. to small firms (<100)")  ///
  xlabel(1 "1990-94" 2 "1995-99" 3 "2000-04" 4 "2005-09" 5 "2010-14" 6 "2015-19")
  graph export "$rfigures/Figure2.png", replace