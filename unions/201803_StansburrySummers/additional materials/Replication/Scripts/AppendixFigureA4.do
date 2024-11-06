use "$rdata/data_fig_a4", clear

*Appendix Figure A4
gen pos = 3
replace pos = 9 if sector=="Mining"
replace pos = 12 if sector=="Construction"
replace pos = 4 if sector=="Wholesale trade"
twoway (scatter wp_avg wp_rents_abowd, mlabel(sector) mlabv(pos)) (function y=x, range(wp_rents_abowd)), graphregion(color(white)) legend(off) xtitle("Industry rents approximated using Abowd et al (2012) & Sorkin (2018), 1990-2001") ytitle("Industry wage premia estimated in CPS, 1990-2001 avg")
graph export "$rfigures\AppendixFigureA4.png", replace
