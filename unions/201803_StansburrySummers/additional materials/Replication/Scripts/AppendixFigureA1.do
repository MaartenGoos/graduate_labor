use "$rdata/data_fig_a1", clear

*Appendix Figure A1: Graph of different estimates of the union wage premium
twoway ///
	(connected uwp_bb_ma5 year, mcolor(cranberry) lcolor(cranberry)) ///
	(connected uwp_hs_ma5 year, mcolor(dkorange) lcolor(dkorange)) ///
	(connected uwp_hm_ma5 year, mcolor(dkgreen) lcolor(dkgreen)) ///
	(connected uwp_ss_ma5 year, mcolor(navy) lcolor(navy)) ///
	, legend(order(4 "Stansbury/Summers" 1 "Blanchflower/Bryson" 2 "Hirsch/Schumacher" 3 "Hirsch/Macpherson")) graphregion(color(white)) xtitle("") ytitle("Union log wage premium," "5-year centered moving avg.")
	graph export "$rfigures/AppendixFigureA1.png", replace