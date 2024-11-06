use "$rdata/data_figs_a9_a10", clear

*Appendix Figure A9: Graph of pattern over time for Q measures, employment-weighted and non-employment-weighted
twoway ///
(line a1_q_wsd year, lcolor(navy)) ///
(scatter a1_q_wsd year, mcolor(navy)) ///
(line a1m_q_wsd year, lcolor(cranberry)) ///
(scatter a1m_q_wsd year, mcolor(cranberry)) ///
(line a1med_q_wsd year, lcolor(dkorange)) ///
(scatter a1med_q_wsd year, mcolor(dkorange)) ///
(line a1_q_sd year, lcolor(navy) lpattern(dash)) ///
(line a1m_q_wsd year, lcolor(cranberry) lpattern(dash)) ///
(line a1med_q_sd year, lcolor(dkorange) lpattern(dash)), ///
	ytitle("Std. dev. of industry-level Q measures") ///
	legend(order (1 "Aggregate Q, VA-wt sd" 3 "Simple average Q, VA-wt sd" 5 "Median Q, VA-wt sd" ///
		7 "Aggregate Q, sd" 8 "Simple average Q, sd" 9 "Median Q, sd") rows(3)) ///
	graphregion(color(white)) xtitle("") xsc(r(1987 2016)) xlabel(1990 (5) 2016)
graph export "$rfigures/AppendixFigureA9.png", replace


*Appendix Figure A10: Standard deviation of profits per worker, over time
twoway ///
(line grossprofitpw_wsd year, lcolor(navy)) ///
(scatter grossprofitpw_wsd year, mcolor(navy)) ///
(line netprofitpw_wsd year, lcolor(cranberry)) ///
(scatter netprofitpw_wsd year, mcolor(cranberry)) ///
(line grossprofitpw_sd year, lcolor(navy) lpattern(dash)) ///
(line netprofitpw_sd year, lcolor(cranberry) lpattern(dash)), ///
	ytitle("Std. dev. of industry-level profit per worker") ///
	legend(order (1 "Gross op. surplus per worker, VA-wt sd" 3 "Net op. surplus per worker, VA-wt sd"  ///
		5 "Gross op. surplus per worker, sd" 6 "Net op. surplus per worker, sd") rows(4)) ///
	graphregion(color(white)) xtitle("") xsc(r(1987 2016)) xlabel(1990 (5) 2016) ysc(r(0 0.15)) ylabel(0 (0.05) 0.15)
graph export "$rfigures/AppendixFigureA10.png", replace
	