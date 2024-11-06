*Run this file for:
	*Figures 6, 10, 11, 12, 13, 15
	*Appendix Figures B5, B6, B7, B8, B10, B11, B12, B13, C5, C6, C7, C8, C16, C17, C22, C23, C24
	
********************************************************************************
use "$rdata/data_industry_figs_tables", clear

*Figure 6: Scatter graphs of increase in low wage import penetration and change in rents/profits
capture drop temp*
gen temp_labpos = 3
	replace temp_labpos = 2 if indcode=="Nondur_textile"
	replace temp_labpos = 4 if indcode=="Nondur_petro"
twoway ///
(scatter implabrentshare_d8907 pen5_d8907 if year==2005 & sector=="Manufacturing" [aw=emp], mlabvpos(temp_labpos) msymbol(Oh) mcolor(cranberry) mlabcolor(navy) mlabel(indcode)), graphregion(color(white)) xtitle("Change in low wage import penetration, 1989-2007") ytitle("Change in imputed labor rent share of value added," "1989-2007") legend(off)
graph export "$rfigures/Figure6.png", replace

*Appendix Figure B10: Scatter graphs of increase in low wage import penetration and change in rents/profits
capture drop temp*
gen temp_labpos = 3
	replace temp_labpos = 2 if indcode=="Dur_furniture"|indcode=="Dur_misc"|indcode=="Dur_prim_metal"|indcode=="Dur_fab_metal"|indcode=="Nondur_chemical"
	replace temp_labpos = 4 if indcode=="Nondur_plastic"|indcode=="Nondur_textile"
	replace temp_labpos = 5 if indcode=="Nondur_food"
twoway ///
(scatter nprofitminustrate_d8907 pen5_d8907 if year==2005 & sector=="Manufacturing" [aw=emp], mlabvpos(temp_labpos) msymbol(Oh) mcolor(cranberry) mlabcolor(navy) mlabel(indcode)), graphregion(color(white)) xtitle("Change in low wage import penetration, 1989-2007") ytitle("Change in profit rate to capital," "1989-2007") legend(off)
graph export "$rfigures/AppendixFigureB10.png", replace

*Appendix Figure B11: Scatter of initial level of rent share and change in import penetration
capture drop temp*
gen temp_labpos = 3
	replace temp_labpos = 2 if indcode=="Dur_machinery"
	replace temp_labpos = 2 if indcode=="Nondur_textile"|indcode=="Dur_electrical"|indcode=="Nondur_chemical"
twoway ///
(scatter pen5_d8907 implabrentshare_ma5_1989 if year==2005 & sector=="Manufacturing" [aw=emp], mlabvpos(temp_labpos) msymbol(Oh) mcolor(cranberry) mlabcolor(navy) mlabel(indcode)), graphregion(color(white)) xtitle("Industry labor rent share, 1987-91") ytitle("Change in low-wage import penetration," "1989-2007") legend(off)
graph export "$rfigures/AppendixFigureB11.png", replace

*Appendix Figure B12: Scatter of initial level of rent share and absolute change in rent share
capture drop temp*
gen temp_labpos = 3
	replace temp_labpos = 1 if indcode=="Dur_machinery"|indcode=="Nondur_plastic"
	replace temp_labpos = 4 if indcode=="Nondur_textile"
twoway ///
(scatter implabrentshare_d8907 implabrentshare_ma5_1989 if year==2005 & sector=="Manufacturing" [aw=emp], mlabvpos(temp_labpos) msymbol(Oh) mcolor(cranberry) mlabcolor(navy) mlabel(indcode)), graphregion(color(white)) xtitle("Industry labor rent share, 1987-91") ytitle("Change in labor rent share," "1989-2007") legend(off)
graph export "$rfigures/AppendixFigureB12.png", replace

*Appendix Figure B13: Scatter of initial level of rent share and percentage change in rent share
capture drop temp*
gen temp_labpos = 3
	replace temp_labpos = 2 if indcode=="Nondur_apparel"|indcode=="Nondur_printing"
	replace temp_labpos = 1 if indcode=="Dur_computer"
twoway ///
(scatter implabrentshare_pd8907 implabrentshare_ma5_1989 if year==2005 & sector=="Manufacturing" [aw=emp], mlabvpos(temp_labpos) msymbol(Oh) mcolor(cranberry) mlabcolor(navy) mlabel(indcode)), graphregion(color(white)) xtitle("Industry labor rent share, 1987-91") ytitle("Percent Change in labor rent share," "1989-2007") legend(off)
graph export "$rfigures/AppendixFigureB13.png", replace

********************************************************************************
use "$rdata/data_industry_figs_tables", clear
keep if year>=1987

*Appendix Figure B5: Connected graph by industry, profitability and labor rents
*NOTE: Appendix Figure B5 contains this graph for indcode=="Nondur_apparel" and indcode=="Wholesale_trade"
local dep implabrents_FA_ma5
local indep nprofitminustrate_ma5
	*Panel 1: Nondur_apparel
	twoway ///
	(connected `dep' `indep' if indcode=="Nondur_apparel" & year>=1989 & year<=2014, mcolor(cranberry) mlab(year) mlabsize(small) mlabcolor(cranberry)) ///
	, graphregion(color(white)) ytitle("Rent rate to labor") xtitle("Profit rate to capital") ///
	legend(off) title("`indcode'")
	graph export "$rfigures/AppendixFigureB5_Nondur_apparel.png", replace
	*Panel 2: Wholesale_trade
	twoway ///
	(connected `dep' `indep' if indcode=="Wholesale_trade" & year>=1989 & year<=2014, mcolor(cranberry) mlab(year) mlabsize(small) mlabcolor(cranberry)) ///
	, graphregion(color(white)) ytitle("Rent rate to labor") xtitle("Profit rate to capital") ///
	legend(off) title("`indcode'")
	graph export "$rfigures/AppendixFigureB5_Wholesale_trade.png", replace

*Appendix Figure B6: Manufacturing
graph hbar nprofitminustrate_ma5 implabrents_FA_ma5 if (year==1989|year==2014) & (strpos(indcode,"Dur")>0|strpos(indcode,"Nondur")>0) & strpos(indcode,"Finance")==0 & strpos(indcode,"Legal")==0 & strpos(indcode,"Insurance")==0, ///
over(year, relabel(1 "1987-91" 2 "2012-16") label(labsize(vsmall)))  over(indcode, sort(nrentminustrate_ma5)) bar(1, color(navy)) bar(2, color(cranberry)) ///
 graphregion(color(white)) stack legend(order(1 "Profit rate to capital" 2 "Rent rate to labor")) ysc(range(-0.1 0.5)) ylabel(-0.1 (0.1) 0.4)
 graph export "$rfigures/AppendixFigureB6.png", replace
 
*Appendix Figure B7: Other large industries
graph hbar nprofitminustrate_ma5 implabrents_FA_ma5 if (year==1989|year==2014) & (strpos(indcode,"Transp")>0|strpos(indcode,"Construction")>0|strpos(indcode,"Utilities")>0|strpos(indcode,"Min_")>0|strpos(indcode,"_trade")>0) & strpos(indcode,"Finance")==0 & strpos(indcode,"Legal")==0 & strpos(indcode,"Insurance")==0, ///
over(year, relabel(1 "1987-91" 2 "2012-16") label(labsize(vsmall)))  over(indcode, sort(nrentminustrate_ma5)) bar(1, color(navy)) bar(2, color(cranberry)) ///
 graphregion(color(white)) stack legend(order(1 "Profit rate to capital" 2 "Rent rate to labor")) ysc(range(-0.1 0.5)) ylabel(-0.1 (0.1) 1)
 graph export "$rfigures/AppendixFigureB7.png", replace
 
*Appendix Figure B8: Services
graph hbar nprofitminustrate_ma5 implabrents_FA_ma5 if (year==1989|year==2014) & (strpos(indcode,"Acc")>0|strpos(indcode,"Adm")>0|strpos(indcode,"Arts")>0|strpos(indcode,"serv")>0|strpos(indcode,"Health")>0|strpos(indcode,"Educ")>0|strpos(indcode,"Inf")>0|strpos(indcode,"Other")>0|strpos(indcode,"Waste")>0) & strpos(indcode,"Finance")==0 & strpos(indcode,"Legal")==0 & strpos(indcode,"Insurance")==0, ///
over(year, relabel(1 "1987-91" 2 "2012-16") label(labsize(vsmall)))  over(indcode, sort(nrentminustrate_ma5)) bar(1, color(navy)) bar(2, color(cranberry)) ///
 graphregion(color(white)) stack legend(order(1 "Profit rate to capital" 2 "Rent rate to labor")) ysc(range(-0.1 0.5)) ylabel(-0.1 (0.1) 0.8)
 graph export "$rfigures/AppendixFigureB8.png", replace

 	
********************************************************************************
use "$rdata/data_industry_figs_tables", clear

*Figure 10: Scatter plot of change in labor share against change in imputed labor rent share
twoway ///
	(scatter laborshare_d8816 implabrentshare_d8816 if year==2014 [aw=emp], msymbol(Oh)) ///
		(lfit laborshare_d8816 implabrentshare_d8816 if year==2014 [aw=emp]) ///
	, graphregion(color(white)) xtitle("Change in imputed labor rent share of VA, 1988-92 to 2012-16") ytitle("Change in labor share of VA, 1988-92 to 2012-16") legend(off)
	graph export "$rfigures/Figure10.png", replace
 
*Figure 11: Scatter plot of change in labor share against change in top 20 sales concentration, import-adjusted (Compustat measure)
twoway ///
	(scatter laborshare_d8816 a1_cr20_impadj_d8816 if year==2014 [aw=emp], msymbol(Oh) ) ///
		(lfit laborshare_d8816 a1_cr20_impadj_d8816 if year==2014 [aw=emp]) ///
	,graphregion(color(white)) xtitle("Change in top 20 concentration (imp-adj), 1988-92 to 2012-16") ytitle("Change in labor share of VA, 1988-92 to 2012-16") legend(off) ///
	xsc(r(-0.75 0.5)) xlabel(-0.75(0.25)0.5)
	graph export "$rfigures/Figure11.png", replace

*Figure 12: Scatter plot of change in gross profit rate against change in imputed labor rent share
twoway ///
	(scatter grossprofitrate_d8816 implabrentshare_d8816 [aw=emp] if year==2014 & strpos(indcode,"Finance")==0, msymbol(Oh)) ///
	(lfit grossprofitrate_d8816 implabrentshare_d8816 [aw=emp] if year==2014 & strpos(indcode,"Finance")==0) ///
	, graphregion(color(white)) legend(off) ytitle("Change in gross op. surplus/fixed assets," "1988-92 to 2012-16") ///
	xtitle("Change in imputed labor rent share, 1988-92 to 2012-16")
		graph export "$rfigures/Figure12.png", replace
	
*Figure 13: Scatter plot of change in gross profit rate against change in top 20 sales concentration, import-adjusted (Compustat measure)	
twoway ///
	(scatter grossprofitrate_d8816 a1_cr20_impadj_d8816 [aw=emp] if year==2014 & strpos(indcode,"Finance")==0, msymbol(Oh)) ///
	(lfit grossprofitrate_d8816 a1_cr20_impadj_d8816 [aw=emp] if year==2014 & strpos(indcode,"Finance")==0) ///
	, graphregion(color(white)) legend(off) ytitle("Change in gross op. surplus/fixed assets," "1988-92 to 2012-16") ///
	xtitle("Change in top 20 concentration, imp-adj, 1984-88 to 2012-16")
		graph export "$rfigures/Figure13.png", replace	

*Figure 15: Scatter plot of change in unemployment rate and change in imputed labor rent share, long differences
twoway ///
	(scatter unemploymentrate_d8816 implabrentshare_d8816 [aw=emp] if year==2014, msymbol(Oh)) ///
	(lfit unemploymentrate_d8816 implabrentshare_d8816 [aw=emp] if year==2014) ///
	, graphregion(color(white)) legend(off) ytitle("Change in unemployment rate, 1988-92 to 2012-16") ///
	xtitle("Change in imputed labor rent share, 1988-92 to 2012-16")
		graph export "$rfigures/Figure15.png", replace
		
*Appendix Figure C22: Scatter plot of change in Unemployment rate and change in unionization rate, long differences
twoway ///
	(scatter unemploymentrate_d8419 unionrate_d8419 [aw=emp] if year==2014, msymbol(Oh)) ///
	(lfit unemploymentrate_d8419 unionrate_d8419 [aw=emp] if year==2014) ///
	, graphregion(color(white)) legend(off) ytitle("Change in unemployment rate, 1984-88 to 2015-19") ///
	xtitle("Change in unionization rate, 1984-88 to 2015-19")
		graph export "$rfigures/AppendixFigureC22.png", replace

*Appendix Figure C23: Scatter plot of change in gross investment-op surplus and change in imputed labor rent share, long differences
twoway ///
	(scatter grossI_grossOS_w_d8816 implabrentshare_d8816 [aw=emp] if year==2014 & grossI_grossOS_w_d8816>-1, msymbol(Oh)) ///
	(lfit grossI_grossOS_w_d8816 implabrentshare_d8816 [aw=emp] if year==2014 & grossI_grossOS_w_d8816>-1) ///
	, graphregion(color(white)) legend(off) ytitle("Change in investment-to-profits, 1988-92 to 2012-16") ///
	xtitle("Change in imputed labor rent share, 1988-92 to 2012-16") ysc(r(-1 (0.5) 1))
		graph export "$rfigures/AppendixFigureC23.png", replace
		
*Appendix Figure C24: Scatter plot of change in gross investment-op surplus and change in concentration, long differences		
twoway ///
	(scatter grossI_grossOS_w_d8816 a1_cr20_impadj_d8816 [aw=emp] if year==2014 & grossI_grossOS_w_d8816>-1, msymbol(Oh)) ///
	(lfit grossI_grossOS_w_d8816 a1_cr20_impadj_d8816 [aw=emp] if year==2014 & grossI_grossOS_w_d8816>-1) ///
	, graphregion(color(white)) legend(off) ytitle("Change in investment-to-profits, 1988-92 to 2012-16") ///
	xtitle("Change in top 20 concentration, imp-adj, 1988-92 to 2012-16") ysc(r(-1 (0.5) 1))
		graph export "$rfigures/AppendixFigureC24.png", replace


**********************************************************************************************************
use "$rdata/data_industry_figs_tables", clear

*Generate weights
local empvars emp emp_noncollege emp_baplus
foreach var of local empvars{
	gen `var'_int = round(`var')
	}
   
*Appendix Figure C5: Histogram of workers by the median Q of the industry they work in
local var a1med_q_ma5
twoway (histogram `var' if year==1982 [fw=emp_int], start(0.8) width(0.2) color(red%30)) ///        
       (histogram `var' if year==2015 [fw=emp_int], start(0.8) width(0.2) color(green%30)), ///   
       legend(order(1 "1980-1984" 2 "2013-2017" )) graphregion(color(white)) ///
	   xtitle("Median industry Q") ytitle("Density of employment by industry")
	   graph export "$rfigures/AppendixFigureC5.png", replace

*Appendix Figure C6: Histogram of profit rate (excluding finance) 
local var grossprofitrate_ma5
local cond & strpos(indcode,"Finance")==0
twoway (histogram `var' if year==1989 `cond' [fw=emp_int], start(-.1) width(0.1) color(red%30)) ///        
       (histogram `var' if year==2014 `cond' [fw=emp_int], start(-.1) width(0.1) color(green%30)), ///   
       legend(order(1 "1987-1991" 2 "2012-2016" )) graphregion(color(white)) ///
	     xtitle("Industry gross operating surplus/fixed assets") ytitle("Density of employment by industry")
	   graph export "$rfigures/AppendixFigureC6.png", replace
	
**********************************************************************************************************
use "$rdata/data_industry_figs_tables", clear

*Bar charts:
bysort year: egen tot_emp_noncollege = total(emp_noncollege)
bysort year: egen tot_emp_baplus = total(emp_baplus)
gen empshare_noncollege = emp_noncollege/tot_emp_noncollege
gen empshare_baplus = emp_baplus/tot_emp_baplus

local profitvars grossprofitrate_ma5 netprofitrate_ma5 a1med_q_ma5 a1m_q_ma5 a1_q_ma5
foreach var of local profitvars{
bysort year: egen `var'_quart  = xtile(`var'), n(4)
bysort year `var'_quart: egen qa_nc_`var' = total(empshare_noncollege)
bysort year `var'_quart: egen qs_ba_`var' = total(empshare_baplus)
	}

xtset indcode_num year

*Appendix Figure C7: Bar chart of employment shares for non-college and BA plus workers - by median industry Q 
graph bar L32.qa_nc_a1med_q_ma5 qa_nc_a1med_q_ma5 L32.qs_ba_a1med_q_ma5 qs_ba_a1med_q_ma5 if year==2015, over(a1med_q_ma5_quart) ///
	graphregion(color(white)) ///
	legend(order(1 "Non-college, 1980-84" 2 "Non-college, 2013-17" 3 "BA plus, 1980-84" 4 "BA plus, 2013-17")) ///
	bar(1, color(navy) fi(inten30)) bar(2, color(navy) fi(inten80)) bar(3, color(cranberry) fi(inten30)) bar(4, color(cranberry) fi(inten80)) ///
	b1title("Quartiles of median industry Q") ytitle("Share of employment in each quartile")
graph export "$rfigures/AppendixFigureC7.png", replace
		
*Appendix Figure C8: Bar chart of employment shares for non-college and BA plus workers - by industry gross profit rate
local var grossprofitrate_ma5
graph bar L25.qa_nc_`var' qa_nc_`var' L25.qs_ba_`var' qs_ba_`var' if year==2014, over(`var'_quart) ///
	graphregion(color(white)) ///
	legend(order(1 "Non-college, 1987-91" 2 "Non-college, 2012-16" 3 "BA plus, 1987-91" 4 "BA plus, 2012-16")) ///
	bar(1, color(navy) fi(inten30)) bar(2, color(navy) fi(inten80)) bar(3, color(cranberry) fi(inten30)) bar(4, color(cranberry) fi(inten80)) ///
	b1title("Quartiles of industry op surplus / fixed assets") ytitle("Share of employment in each quartile")
graph export "$rfigures/AppendixFigureC8.png", replace

**********************************************************************************************************
use "$rdata/data_industry_figs_tables", clear

*Appendix Figure C16: Change in labor share and change in unionization rate, long differences
twoway (scatter laborshare_d8716 unionrate_d8716 if year == 2014 & (strpos(indcode,"Dur_")>0|strpos(indcode,"Nondur_")>0) [aw=emp_ma5], mcolor(navy) msymbol(Oh)) ///
(scatter laborshare_d8716 unionrate_d8716 if year == 2014 & (strpos(indcode,"Dur_")==0 & strpos(indcode,"Nondur_")==0) [aw=emp_ma5], mcolor(cranberry) msymbol(Oh)) ///
(lfit laborshare_d8716 unionrate_d8716 if year==2014 [aw=emp_ma5], lcolor(dkorange)) ///
	, graphregion(color(white)) legend(order(1 "Manufacturing" 2 "Non-manufacturing")) ///
	ytitle("Labor share of gross value added," "change 1987-91 to 2012-16") xtitle("Unionization rate, change 1987-91 to 2012-16") ///
	ysc(r(-0.25 0.25)) ylabel(-0.25 (0.25) 0.25) xlabel(-0.3 (0.1) 0)
graph export "$rfigures/AppendixFigureC16.png", replace
	

*Appendix Figure C17: Change in industry and union rent shares, long differences
twoway (scatter implabrentshare_iwpc6_d8716 implabrentshare_uwp_d8716 if year == 2014 & (strpos(indcode,"Dur_")>0|strpos(indcode,"Nondur_")>0) [aw=emp_ma5], mcolor(navy) msymbol(Oh)) ///
(scatter implabrentshare_iwpc6_d8716 implabrentshare_uwp_d8716 if year == 2014 & (strpos(indcode,"Dur_")==0 & strpos(indcode,"Nondur_")==0) [aw=emp_ma5], mcolor(cranberry) msymbol(Oh)) ///
	, graphregion(color(white)) legend(order(1 "Manufacturing" 2 "Non-manufacturing")) ///
	ytitle("Industry rent share," "change 1987-91 to 2012-16") xtitle("Union rent share, change 1987-91 to 2012-16") 
graph export "$rfigures/AppendixFigureC17.png", replace

