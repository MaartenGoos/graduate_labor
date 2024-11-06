use "$rdata/data_fig_c11", clear

*Appendix Figure C11: Private sector large firm wage effects, by education group
twoway ///
(connected estimate period if  educ_cat_broad==2 & firmsize_num==3, lcolor(cranberry) mcolor(cranberry))  ///
(connected estimate period if educ_cat_broad==2 & firmsize_num==2, lcolor(cranberry) mcolor(cranberry) lpattern(dash)) ///
(connected estimate period if educ_cat_broad==1 & firmsize_num==3, lcolor(navy) mcolor(navy))  ///
(connected estimate period if educ_cat_broad==1 & firmsize_num==2, lcolor(navy) mcolor(navy) lpattern(dash)) ///
	, graphregion(color(white)) legend(size(small) order(3 "500+ workers, High School or Some College" 1 "500+ workers, BA + " 4 "100-499 workers, High School or Some College" 2 "100-499 Workers, BA +")) ///
	xtitle("") ytitle("Log wage premium, relative to 100 workers or less") ///
  xlabel(1 "1990-94" 2 "1995-99" 3 "2000-04" 4 "2005-09" 5 "2010-14" 6 "2015-19")
  graph export "$rfigures/AppendixFigureC11.png", replace