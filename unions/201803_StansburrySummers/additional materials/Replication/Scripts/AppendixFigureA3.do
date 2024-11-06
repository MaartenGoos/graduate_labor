use "$rdata/data_fig_a3", clear

*APPENDIX FIGURE A3: Standard deviation of longitudinal wage fixed effects
twoway connected c6 year, ///
	graphregion(color(white)) xtitle("") ytitle("St. dev. of sector log wage fixed effect," "longitudinal estimate, employment-weighted")
graph export "$rfigures/AppendixFigureA3.png", replace