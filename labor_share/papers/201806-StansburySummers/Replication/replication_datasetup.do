*********************************************************************
*	"PRODUCTIVITY AND PAY: IS THE LINK BROKEN?"
*	ANNA STANSBURY AND LAWRENCE SUMMERS
*	REPLICATION DO FILES
*	12.18.2017	
*********************************************************************
*	
*							DATA SETUP 
*	 										    
*********************************************************************


clear
set more off
   
cd "C:\Users\Anna\Dropbox\0. Summers\Wages and Productivity\Final Dec 2017\Stata"  /*Insert appropriate directory*/
use raw, clear
	*The data file raw.dta is from the Excel file replication_dataset.xls*
	*Data description is in the accompanying Excel file*

save final, replace

*Set up the dataset for time series*
	tsset year

*Index all deflators to 1948=100*
local index48vars cpiu pce ipdte ndppi
	foreach var of local index48vars {
		generate index`var' = 100*`var' / `var'[1] 
		drop `var'
		rename index`var' `var'
			}
			
*Link CPI-U and CPI-U-RS to make one series* 
rename cpiurs cpiursshort 
replace cpiursshort = 100*cpiursshort/104.4
gen cpi = cpiu if year<1978
replace cpi = cpiursshort*271.3329/100 if year>1977
drop cpiursshort

*Generate productivity variable*
gen prodtenet = (ndp/ndppi)/hours

*Deflating variables with different price indexes*
local compvars compte compnfb
local deflators  cpi ipdnfb ndppi pce
	foreach x of local compvars{
		foreach d of local deflators{
			gen `x'`d' = 100*(`x'/`d')  /*deflates by various deflators*/
			}
		}

*Index all series to 1948, except series starting in 1973*
local index48vars comppnsepi comptecpi compnfbcpi prodtegross prodtenet prodnfb comptendppi

local nominalvars48 compnfb compte  
foreach x of local nominalvars48 {
	foreach d of local deflators {
		local index48vars `index48vars' `x'`d'
		}
	}

	foreach var of local index48vars {
		generate index`var' = 100*`var' / `var'[1] 
		drop `var'
		rename index`var' `var'
			}

local index73vars medcompepi
	foreach var of local index73vars {
		generate index`var' = 100*`var' / `var'[26] 
		drop `var'
		rename index`var' `var'73
			}
local index73 prodtenet prodnfb prodtegross comppnsepi comptecpi compnfbcpi comptendppi
	foreach var of local index73 {
		generate `var'73 = 100*`var' / `var'[26] 
			}
			
*Index the decile wage variables*
foreach i in 10 20 30 40 50 60 70 80 90 95{
	gen p`i'i = 100*p`i'/p`i'[26]
	drop p`i'
	rename p`i'i p`i'
	}

*Generate additional variables*
	gen mmratiote = comptecpi73/medcompepi73 /*Mean-median ratio*/
	gen invlaborshare = 1/laborshare		/*Inverse labor share*/
	gen tot = cpi/ndppi 					/*"Terms of trade*/

*Label variables* 
	lab var prodtenet "Net labor productivity, total economy"
	lab var prodtenet73 "Net labor productivity, total economy"
	lab var comptecpi "Average compensation, total economy, CPI deflation"
	lab var comppnsepi "Average compensation, production/nonsupervisory workers, EPI deflation"
	lab var medcompepi73 "Median compensation, EPI deflation"
	lab var comptecpi73 "Real average compensation, total economy, CPI deflation"
	lab var comptendppi73 "Real average compensation, total economy, NDPPI deflation"
	lab var laborshare "Labor share"
	lab var mmratiote "Mean-median ratio, total economy"
	lab var pinv "Rel. price investment goods"
	lab var prodtenet "Gross labor productivity, total economy"
	lab var prodnfb "Gross labor productivity, nonfarm business sector"
	lab var compnfbcpi "Real hourly compensation, nonfarm business sector"
	
	foreach i in 10 20 30 40 50 60 70 80 90 95{
		lab var p`i' "Wage P`i'"
		}

*Generate change and change in log variables* 
	local dlogvars medcompepi73 comppnsepi comppnsepi73 comptecpi compnfbcpi comptecpi73 /*
	*/ p10 p20 p30 p40 p50 p60 p70 p80 p90 p95 /*
	*/ prodtenet prodtegross prodnfb prodtenet73 prodtegross73 prodnfb73/*
	*/ pinv laborshare laborsharete laborsharenfb mmratiote tot invlaborshare
		foreach x of local dlogvars{
			gen log`x' = ln(`x')
			gen dlog`x' = log`x' - l1.log`x'
			}

	gen dunemp = unemp-l1.unemp
		foreach i in 1 2 3 4 {
		gen lag`i'dunemp = l`i'.dunemp
			}

	
	local ddvars prodtenet prodtegross prodnfb prodtenet73 prodtegross73 prodnfb73 pinv
	foreach x of local ddvars{
		foreach i in 1 2 3 4 {
			gen lag`i'dlog`x' = l`i'.dlog`x'
			}
		gen ddlog`x' = dlog`x' - l1.dlog`x'
		}
		
*Generate moving average variables*
local mavars dunemp unemp
	foreach var of local dlogvars {
		local mavars `mavars' dlog`var'
		}
		
foreach var of local mavars{
	foreach i in 1 2 3 4{
		tssmooth ma `var'_ma`i' = `var', window(`i' 1 0)
	}
}
		*NOTE this means that the variable labeled ma`i' is actually an (`i'+1)-year backward looking moving average, 
		*which averages over the current and past `i' years. 
		
gen yearminusone = year-1
gen yearminustwo = year-2
gen yearminusthree = year-3

*Generate time trend and decade dummies*
gen t = (year-1948)/1000

gen fifties = 0
replace fifties = 1 if year<1960 & year>1949
gen sixties = 0
replace sixties = 1 if year<1970 & year>1959
gen seventies = 0
replace seventies = 1 if year<1980 & year>1969
gen eighties = 0 
replace eighties = 1 if year<1990 & year>1979
gen nineties = 0
replace nineties = 1 if year<2000 & year>1989
gen noughties = 0
replace noughties = 1 if year<2010 & year>1999


*Set up data for G7 countries*
	*Index West German compensation data*
	replace comp_wg = 100*comp_wg/comp_wg[44]
	
local countries ca fr wg ger ita jp uk
foreach c of local countries{
	gen compcpi_`c' = 100*comp_`c'/cpi_`c'
		local vars prod compcpi
		foreach var of local vars{
			gen log`var'_`c' = log(`var'_`c')
			gen dlog`var'_`c' = log`var'_`c' - l1.log`var'_`c'
			}
	gen dunemp_`c' = l1.unemp_`c'
	local mavars dlogprod dlogcompcpi unemp
	foreach var of local mavars{
		foreach i in 1 2 3 4{
			tssmooth ma `var'_`c'_ma`i' = `var'_`c', window(`i' 1 0)
				}
			}
		}


save final, replace
		



