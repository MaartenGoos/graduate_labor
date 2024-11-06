use "$rdata/data_aggregate_figs_table1", clear

sort year

*Figure 5: Graph of total imputed labor rents over time
local cond if industry=="Nonfinancial Corporate Business"
twoway ///
	(connected implabrentshare year `cond', mcolor(cranberry) lcolor(cranberry)) ///
	(connected netimplabrentshare year `cond', mcolor(dkorange) lcolor(dkorange)) ///
	, legend(order (1 "Imputed labor rents / Gross value added" 2 "Imputed labor rents / Net value added") rows(2)) graphregion(color(white)) xscale(range(1982 2016)) xlabel(1980(5)2015) xtitle("") ytitle("Share of value added," "non-financial corporate business")
graph export "$rfigures/Figure5.png", replace

*Figure 7: Graph of net labor share and fall in labor rents
local cond if industry=="Nonfinancial Corporate Business"
twoway ///
	(connected netlaborshare year  `cond', lcolor(navy) mcolor(navy))  ///
	(connected netimplabrentshare year `cond', lcolor(cranberry) mcolor(cranberry) yaxis(2)) ///
	, legend(order (1 "Net labor share: compensation/net value added" 2 "Labor rent share of net value added")  rows(2)) graphregion(color(white)) xscale(range(1982 2017)) xlabel(1980(5)2015) xtitle("") ytitle("Compensation share of net value added," "non-financial corporate business") ytitle("Labor rent share of net value added", axis(2)) ysc(r(0.65 0.77)) ylabel(0.66 (0.02) 0.76) ysc(r(0.03 0.15) axis(2))  ylabel(0.04 (0.02) 0.14, axis(2))
	graph export "$rfigures/Figure7.png", replace

*Figure 8: Graph of total profits/rents as share of net value added
local cond if industry=="Nonfinancial Corporate Business"
twoway ///
	(connected netcapitalshare year `cond', mcolor(navy) lcolor(navy)) (lfit netcapitalshare year `cond', lcolor(navy) lpattern(dash)) ///
	(connected netimptotalrentshare year `cond', mcolor(cranberry) lcolor(cranberry)) (lfit netimptotalrentshare year  `cond', lcolor(cranberry) lpattern(dash)) ///
	, legend(order (1 "Net capital share: net operating surplus/net value added" 3 "Net total profit share: (net operating surplus + labor rents)/net VA") rows(2)) graphregion(color(white)) xscale(range(1982 2016)) xlabel(1980(5)2015) xtitle("")
graph export "$rfigures/Figure8.png", replace


*Figure 18: Graph of net investment to net profits/rents
local cond if industry=="Nonfinancial Corporate Business"
twoway ///
	(connected netI_netOS year `cond', lcolor(navy) mcolor(navy)) (lfit netI_netOS year `cond', lcolor(navy) lpattern(dash)) ///
	(connected netI_netrents year `cond', lcolor(cranberry) mcolor(cranberry)) (lfit netI_netrents year `cond', lcolor(cranberry) lpattern(dash)) ///
	, legend(order (1 "Net investment / net operating surplus" 3 "Net investment / (net OS + labor rents)") rows(2)) graphregion(color(white)) xscale(range(1980 2016)) xlabel(1980(5)2015) xtitle("")
	graph export "$rfigures/Figure18.png", replace
	
*Appendix Figure B1: Graph of total imputed labor rents over time in the Corporate Business Sector
local cond if industry=="Corporate business"
twoway ///
	(connected implabrentshare year `cond', mcolor(cranberry) lcolor(cranberry)) ///
	(connected netimplabrentshare year `cond', mcolor(dkorange) lcolor(dkorange)) ///
	, legend(order (1 "Corporate sector: Imputed labor rents / Gross value added" 2 "Corporate sector: Imputed labor rents / Net value added") rows(2)) graphregion(color(white)) xscale(range(1980 2016)) xlabel(1980(5)2015) xtitle("") ytitle("Share of value added," "corporate business")
graph export "$rfigures/AppendixFigureB1.png", replace

*Appendix Figure B2: Categories of labor rents over time in the Corporate and Nonfinancial Corporate Business Sectors
local cond if industry=="Corporate business"
local cond2 if industry=="Nonfinancial Corporate Business"
twoway (connected implabrentshare_iiwd year `cond', lcolor(navy) mcolor(navy)) (line implabrentshare_iiwd year `cond2', lcolor(navy) lpattern(dash)) ///
(connected implabrentshare_uwp year `cond', lcolor(cranberry) mcolor(cranberry)) (line implabrentshare_uwp year `cond2', lcolor(cranberry) lpattern(dash)) ///
(connected implabrentshare_fs year `cond', lcolor(dkorange) mcolor(dkorange)) (line implabrentshare_fs year `cond2', lcolor(dkorange) lpattern(dash))  ///
, graphregion(color(white)) legend(order(1 "Corp Bus: Industry rent share" 2 "NFC: Industry rent share" 3 "Corp Bus: Union rent share" 4 "NFC: Union rent share" 5 "Corp Bus: Firm size rent share" 6 "NFC : Firm size rent share")) xtitle("") ytitle("Share of gross value added")
graph export "$rfigures/AppendixFigureB2.png", replace


*Appendix Figure C13: Graph of gross labor share and fall in labor rents
local cond if industry=="Nonfinancial Corporate Business"
twoway ///
	(connected laborshare year `cond', lcolor(navy) mcolor(navy))  ///
	(connected implabrentshare year `cond', lcolor(cranberry) mcolor(cranberry) yaxis(2)) ///
	, legend(order (1 "Gross labor share: compensation/value added" 2 "Labor rent share of gross value added")  rows(2)) graphregion(color(white)) xscale(range(1980 2016)) xlabel(1980(5)2015) xtitle("") ytitle("Compensation share of gross value added," "non-financial corporate business") ytitle("Labor rent share of value added", axis(2)) 	ysc(r(0.56 0.66)) ylabel(0.56 (0.02) 0.66)  ysc(r(0.02 0.12) axis(2))  ylabel(0.02 (0.02) 0.12, axis(2))
		graph export "$rfigures/AppendixFigureC13.png", replace
	
*Appendix Figure C14: Graph of total profits/rents as share of gross value added
local cond if industry=="Nonfinancial Corporate Business"
twoway ///
	(connected capitalshare year  `cond',mcolor(navy) lcolor(navy)) (lfit capitalshare year `cond', lcolor(navy) lpattern(dash)) ///
	(connected imptotalrentshare year `cond', mcolor(cranberry) lcolor(cranberry)) (lfit imptotalrentshare year `cond', lcolor(cranberry) lpattern(dash)) ///
	, legend(order (1 "Gross capital share: gross operating surplus / gross value added" 3 "Gross total profit share: (gross operating surplus + labor rents) / gross VA") rows(2)) graphregion(color(white)) xscale(range(1982 2016)) xlabel(1980(5)2015) xtitle("")
graph export "$rfigures/AppendixFigureC14.png", replace

*Appendix Figure C15: Graph of gross investment to gross profits/rents
local cond if industry=="Nonfinancial Corporate Business"
twoway ///
	(connected grossI_grossOS year  `cond' , lcolor(navy) mcolor(navy)) (lfit grossI_grossOS year  `cond' , lcolor(navy) lpattern(dash)) ///
	(connected grossI_grossrents year  `cond' , lcolor(cranberry) mcolor(cranberry)) (lfit grossI_grossrents year  `cond' , lcolor(cranberry) lpattern(dash)) ///
	, legend(order (1 "Gross investment / gross operating surplus" 3 "Gross investment / (gross OS + labor rents)") rows(2)) graphregion(color(white)) xscale(range(1980 2016)) xlabel(1980(5)2015) xtitle("")
	graph export "$rfigures/AppendixFigureC15.png", replace
	