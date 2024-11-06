use "$rdata/data_fig_a2", clear

*APPENDIX FIGURE A2: Scatter plot by decade
twoway (scatter mwp mwp_l if p5==1|p5==2 [aw=mcompensation] , msymbol(Oh) msize(vsmall)) ///
	(scatter mwp mwp_l if p5==3|p5==4 [aw=mcompensation] , msymbol(Oh) msize(vsmall)) ///
	(scatter mwp mwp_l if p5==5|p5==6 [aw=mcompensation] , msymbol(Oh) msize(vsmall)) ///
	(scatter mwp mwp_l if p5==7|p5==8 [aw=mcompensation] , msymbol(Oh) msize(vsmall)) ///
	, graphregion(color(white)) xtitle("Longitudinal wage fixed effect, relative to Retail Trade") ///
	ytitle("Cross-sectional wage fixed effect," "relative to Retail Trade") ///
	legend(order(1 "1980s" 2 "1990s" 3 "2000s" 4 "2010s") rows(1))
graph export "$rfigures/AppendixFigureA2.png", replace