*********************************************************************
*	"PRODUCTIVITY AND PAY: IS THE LINK BROKEN?"
*	ANNA STANSBURY AND LAWRENCE SUMMERS
*	REPLICATION DO FILES
*	12.18.2017	
*********************************************************************
*	
*						FIGURES 
*	 										    
*********************************************************************

clear
set more off
   
cd "C:\Users\Anna\Dropbox\0. Summers\Wages and Productivity\Final Dec 2017\Stata"
use final, clear
	*Final dataset is created from raw.dta using replication_datasetup.do


*Figure 1: Productivity-compensation divergence 1948-2016*
twoway (line prodtenet year, lc(black)) /*
*/ (line comptecpi year, lc(blue) lp(dash)) /*
*/ (line comppnsepi year, lc(green) lp(dash_dot)/*
*/ xtitle("") ytitle("Index 1948=100")/*
*/ note("Data from BLS, BEA and Economic Policy Institute")/*
*/ graphregion(color (white)) bgcolor(white)/*
*/ legend(size(medsmall) rows(2) label(1 "Productivity") label(2 "Average compensation")/*
*/ label(3 "Production/nonsupervisory compensation")))
graph export Figure1.png, width (2550) replace	

*Figure 2: Productivity-compensation divergence decomposition*
twoway (line prodtegross73 year if year>1969, lc(gray) lp(shortdash_dot)) /*
*/ (line prodtenet73 year if year>1969, lc(black)) /*
*/  (line comptendppi73 year if year>1969, lc(purple) lp(dot) lw(thick)) /*
*/  (line comptecpi73 year if year>1969, lc(blue) lp(longdash)) /*
*/  (line medcompepi73 year if year>1969, lc(red) lp(longdash_dot)) /*
*/  (line comppnsepi73 year if year>1969, lc(green) lp(shortdash)/*
*/ xtitle("") ytitle("Index 1973=100")/*
*/ xsc(r(1973 2016)) /*
*/ note("Data from BLS, BEA and Economic Policy Institute" /*
*/ "Avg. comp. NDPPI refers to average compensation deflated by the NDP price index" /*
*/ "Avg. comp. CPI refers to average compensation deflated by the CPI"/*
*/ "P/NS comp. refers to average production/nonsupervisory worker compensation"/*
*/ "Mediand and P/NS compensation are deflated by the CPI")/*
*/ graphregion(color (white)) bgcolor(white)/*
*/ legend(size(medsmall) rows(2) label(1 "Gross prod.") label(2 "Net prod.")/*
*/ label(3 "Avg. comp. NDPPI") label(4 "Avg. comp. CPI") label(5 "Median comp.") /*
*/ label(6 "P/NS comp.")))
graph export Figure2.png, width (2550) replace

*Figure 3: Changes in Productivity, median and production/nonsupervisory compensation*
twoway (line dlogprodtenet_ma2 year if year>1950, lc(black))/*
*/ (line dlogmedcompepi73_ma2 year if year>1975, lc(green) lp(dash))/*
*/(line dlogcomppnsepi_ma2 year if year>1950, lc(blue) lp(dash_dot) /*
*/ xtitle("") ytitle("Change in log, 3-year moving average")/*
*/ note("Data from BLS, BEA and Economic Policy Institute""Series are 3-year backward-looking moving averages of change in log variable")/*
*/ graphregion(color (white)) bgcolor(white)/*
*/ legend(size(medsmall) rows(2) label(1 "Net productivity") label(2 "Median compensation")/*
*/ label(3 "Production/nonsupervisory compensation")))
graph export Figure3.png, width (2550) replace

*Figure 4: Changes in Productivity and average compensation
twoway (line dlogprodtenet_ma2 year if year>1950, lc(black))/*
*/(line dlogcomptecpi_ma2 year if year>1950, lc(green) lp(dash) /*
*/ xtitle("") ytitle("Change in log, 3-year moving average")/*
*/ note("Data from BLS, BEA and Economic Policy Institute""Series are 3-year backward-looking moving averages of change in log variable")/*
*/ graphregion(color (white)) bgcolor(white)/*
*/ legend(size(medsmall) rows(2) label(1 "Net productivity") label(2 "Average compensation")))
graph export Figure4.png, width (2550) replace

*APPENDIX*
*Figure A1: Compensation share by wage percentile*
use compensationsharebypercentile,clear
twoway (line pointestimate percentile, lc(blue))/*
*/ (line lowerbound percentile, lc(blue) lp(shortdash))/*
*/ (line upperbound percentile, lc(blue) lp(shortdash) /*
*/ xtitle("Wage percentile") ytitle("Benefits share of total compensation (percent)")/*
*/ note("Data from BLS National Compensation Survey (Monaco and Pierce 2015)")/*
*/ graphregion(color (white)) bgcolor(white)/*
*/ legend(size(medsmall) cols(3) label(1 "Point estimate") label(2 "Lower bound") label(3 "Upper bound")))
graph export FigureA1.png, width (2550) replace

*Figure A2: Median equivalized household disposable income and productivity*
use crosscountrymedianincome, clear

gen pos = 3
replace pos = 2 if country == "IRL"
replace pos = 9 if country=="SWE"|country=="PRT"|country=="CAN"|country=="LUX"

twoway (scatter medinc productivity, mlab(country) mlabv(pos) /*
*/ xtitle("GDP per hour worked, 2007 PPP USD") ytitle("Median equivalized disposable household income, 2007 PPP USD") /*
*/ note("Data from OECD Productivity Indicators and OECD Society at a Glance 2011") /*
*/  graphregion(color (white)) bgcolor(white))
graph export FigureA2.png, width (2550) replace


