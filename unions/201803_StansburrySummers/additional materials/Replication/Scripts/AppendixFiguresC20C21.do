use "$rdata/data_figs_c20_c21", clear

*Appendix Figure C20: Changes in labor market tightness (VU Ratio) and unionization rate
capture drop pos
gen pos = 3 
replace pos = 9 if ind=="Prof_bus_serv"
replace pos = 10 if ind=="Arts_rec"
replace pos = 4 if ind=="Health"
twoway ///
	(scatter vuratio_d0019 unionrate_d0019  ///
	, mlabel(ind) mcolor(cranberry) msymbol(Oh) mlabv(pos)) ///
	(lfit vuratio_d0019 unionrate_d0019  [aw=avgemp], lcolor(cranberry)) ///
	, graphregion(color(white)) xtitle("Change in union coverage rate, 2000/1-2018/9") ///
	ytitle("Change in vacancy/unemployment ratio, 2000/1-2018/9") legend(off)
	graph export "$rfigures/AppendixFigureC20.png", replace
	

*Appendix Figure C21: Changes in labor market tightness (VU ratio) and Labor rent share
capture drop pos
gen pos = 3
replace pos = 2 if ind=="Arts_rec"
twoway ///
	(scatter vuratio_d0019 implabrentshare_d0016  ///
	, mlabel(ind) mcolor(cranberry) msymbol(Oh)  mlabv(pos)) ///
		(lfit vuratio_d0019 implabrentshare_d0016  [aw=avgemp], lcolor(cranberry)) ///
	, graphregion(color(white)) xtitle("Change in labor rent share, 2000-2016") ///
	ytitle("Change in vacancy/unemployment ratio, 2000-2019") legend(off)
		graph export "$rfigures/AppendixFigureC21.png", replace
		
		