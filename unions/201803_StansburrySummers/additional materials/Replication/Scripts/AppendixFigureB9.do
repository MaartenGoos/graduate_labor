
use "$rdata/data_fig_b9", clear

*Appendix Figure B9: Share of rent decline, by industry
keep if shareofrentdecline>0.01
drop if missing(shareofrentdecline)
graph hbar shareofrentdecline , over(indcode, sort(shareofrentdecline)) graphregion(color(white)) ytitle("Share of total decline in labor rents/VA accounted for by industry")
graph export "$rfigures/AppendixFigureB9.png", replace

