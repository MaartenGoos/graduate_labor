use "$rdata/data_fig_a8", clear


*Appendix Figure A8: Comparison of sector fixed effects estimated with equal weighting vs. wage weighting in underlying regressions
keep if year==2016
gen pos =3 
	replace pos = 9 if sectorshort == "Mining"|sectorshort=="Construction"
	replace pos = 1 if sectorshort == "Finance and Insurance"|sectorshort=="Agriculture"
	replace pos = 6 if sectorshort == "Manufacturing"
	replace pos = 4 if sectorshort == "Administrative"|sectorshort=="Transportation and Warehousing"|sectorshort=="Wholesale Trade"
twoway ///
(scatter c6_wageweight c6_equalweight, mlabel(sectorshort) mlabv(pos)) ///
(function y=x, range(-0.03 0.26)) ///
, graphregion(color(white)) xtitle("Sector fixed effects, estimated w. equal weighting") ///
ytitle("Sector fixed effects, estimated w. wage weighting") legend(off) ///
ysc(r(-0.03 0.2)) xsc(r(-0.03 0.2)) ylabel(0 (0.05) 0.25) xlabel(0 (0.05) 0.25)
graph export "$rfigures/AppendixFigureA8.png", replace
