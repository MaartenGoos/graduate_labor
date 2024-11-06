*Run this file for:
	*Regression results in Table 4, Table 6, Appendix Table C1
	*Decompositions in Appendix Table B1
	*Note that these analyses produce the results in separate word documents or in-line in the Stata window, and they need to be manually transferred into the Tables in the paper
	
********************************************************************************
use "$rdata/data_industry_figs_tables", clear

********************************************************************************
*Regressions for Table 4		
********************************************************************************

*Regressions of labor share on imputed labor rent share and concentration
*...with Compustat Concentration
local indepvars netimp imp
local depvars netlabor labor
foreach indep of local indepvars{
foreach dep of local depvars{
capture drop indep
gen indep = `indep'labrentshare
local cond 
reg `dep'share indep a1_cr20_impadj `cond', vce(cluster indcode_num)
	est sto one`dep'`indep'
reg `dep'share indep a1_cr20_impadj i.year `cond', vce(cluster indcode_num)
	est sto two`dep'`indep'	
areg `dep'share indep a1_cr20_impadj `cond', ab(indcode_num) vce(cluster indcode_num) 
	est sto three`dep'`indep'
areg `dep'share indep a1_cr20_impadj i.year `cond', ab(indcode_num) vce(cluster indcode_num)
	est sto four`dep'`indep'
esttab one`dep'`indep' two`dep'`indep' three`dep'`indep' four`dep'`indep' using "$rtables/Table4_`indep'_`dep'_CompC.rtf",  ///
	cells(b(star fmt(%9.2f)) se(par fmt(%9.2f))) ///
	 noomitted nobaselevels stats(N, fmt(%9.0g) labels(Observations)) legend label ///
	style(tex) starlevels(+ 0.10 * 0.05 ** 0.01) mlabels(, depvars) collabels(none) ///
	note("Standard errors are clustered at the industry level")  ///
	keep(indep a1_cr20_impadj) replace
}
}
	
*...with Census Concentration
local indepvars netimp imp
local depvars netlabor labor
foreach indep of local indepvars{
foreach dep of local depvars{
capture drop indep
gen indep = `indep'labrentshare
local cond 
reg `dep'share indep aa1_cr20_impadj `cond', vce(cluster indcode_num)
	est sto one`dep'`indep'
reg `dep'share indep aa1_cr20_impadj i.year `cond', vce(cluster indcode_num)
	est sto two`dep'`indep'	
areg `dep'share indep aa1_cr20_impadj `cond', ab(indcode_num) vce(cluster indcode_num) 
	est sto three`dep'`indep'
areg `dep'share indep aa1_cr20_impadj i.year `cond', ab(indcode_num) vce(cluster indcode_num)
	est sto four`dep'`indep'
esttab one`dep'`indep' two`dep'`indep' three`dep'`indep' four`dep'`indep' using "$rtables/Table4_`indep'_`dep'_CensusC.rtf",  ///
	cells(b(star fmt(%9.2f)) se(par fmt(%9.2f))) ///
	 noomitted nobaselevels stats(N, fmt(%9.0g) labels(Observations)) legend label ///
	style(tex) starlevels(+ 0.10 * 0.05 ** 0.01) mlabels(, depvars) collabels(none) ///
	note("Standard errors are clustered at the industry level")  ///
	keep(indep aa1_cr20_impadj) replace
}
}
	

*Regressions of profitability on imputed labor rent share and concentration
*...with Compustat Concentration
capture drop conc
gen conc = a1_cr20_impadj
local indep implabrentshare conc
local depvars grossprofitrate a1_q a1m_q a1med_q
foreach dep of local depvars{
local cond if strpos(indcode,"Finance")==0
reg `dep' `indep' `cond', vce(cluster indcode_num)
	est sto one`dep'
reg `dep' `indep' i.year `cond', vce(cluster indcode_num)
	est sto two`dep'	
areg `dep' `indep' `cond', ab(indcode_num) vce(cluster indcode_num) 
	est sto three`dep'
areg `dep' `indep' i.year `cond', ab(indcode_num) vce(cluster indcode_num)
	est sto four`dep'
esttab one`dep' two`dep' three`dep' four`dep' using "$rtables/Table4_`indep'_`dep'_CompC.rtf",  ///
	cells(b(star fmt(%9.2f)) se(par fmt(%9.2f))) ///
	 noomitted nobaselevels stats(N, fmt(%9.0g) labels(Observations)) legend label ///
	style(tex) starlevels(+ 0.10 * 0.05 ** 0.01) mlabels(, depvars) collabels(none) ///
	note("Standard errors are clustered at the industry level")  ///
	keep(`indep') replace
	}

*...with Census Concentration
replace conc = aa1_cr20_impadj
local indep implabrentshare conc
local depvars grossprofitrate a1_q a1m_q a1med_q
foreach dep of local depvars{
local cond if strpos(indcode,"Finance")==0
reg `dep' `indep' `cond', vce(cluster indcode_num)
	est sto one`dep'
reg `dep' `indep' i.year `cond', vce(cluster indcode_num)
	est sto two`dep'	
areg `dep' `indep' `cond', ab(indcode_num) vce(cluster indcode_num) 
	est sto three`dep'
areg `dep' `indep' i.year `cond', ab(indcode_num) vce(cluster indcode_num)
	est sto four`dep'
esttab one`dep' two`dep' three`dep' four`dep' using "$rtables/Table4_`indep'_`dep'_CensusC.rtf",  ///
	cells(b(star fmt(%9.2f)) se(par fmt(%9.2f))) ///
	 noomitted nobaselevels stats(N, fmt(%9.0g) labels(Observations)) legend label ///
	style(tex) starlevels(+ 0.10 * 0.05 ** 0.01) mlabels(, depvars) collabels(none) ///
	note("Standard errors are clustered at the industry level")  ///
	keep(`indep') replace
	}
	
	
  
*Regressions of investment-to-profits on imputed labor rent share and concentration
*...with Compustat Concentration
local indep implabrentshare a1_cr20_impadj
local depvars grossI_grossOS_w 
foreach dep of local depvars{
local cond 
reg `dep' `indep' `cond', vce(cluster indcode_num)
	est sto one`dep'
reg `dep' `indep' i.year `cond', vce(cluster indcode_num)
	est sto two`dep'	
areg `dep' `indep' `cond', ab(indcode_num) vce(cluster indcode_num) 
	est sto three`dep'
areg `dep' `indep' i.year `cond', ab(indcode_num) vce(cluster indcode_num)
	est sto four`dep'
esttab one`dep' two`dep' three`dep' four`dep' using "$rtables/Table4_`indep'_`dep'_CompC.rtf",  ///
	cells(b(star fmt(%9.2f)) se(par fmt(%9.2f))) ///
	 noomitted nobaselevels stats(N, fmt(%9.0g) labels(Observations)) legend label ///
	style(tex) starlevels(+ 0.10 * 0.05 ** 0.01) mlabels(, depvars) collabels(none) ///
	note("Standard errors are clustered at the industry level")  ///
	keep(`indep') replace
	}
	
*...with Census Concentration	
local indep implabrentshare aa1_cr20_impadj
local depvars grossI_grossOS_w 
foreach dep of local depvars{
local cond 
reg `dep' `indep' `cond', vce(cluster indcode_num)
	est sto one`dep'
reg `dep' `indep' i.year `cond', vce(cluster indcode_num)
	est sto two`dep'	
areg `dep' `indep' `cond', ab(indcode_num) vce(cluster indcode_num) 
	est sto three`dep'
areg `dep' `indep' i.year `cond', ab(indcode_num) vce(cluster indcode_num)
	est sto four`dep'
esttab one`dep' two`dep' three`dep' four`dep' using "$rtables/Table4_`indep'_`dep'_CensusC.rtf",  ///
	cells(b(star fmt(%9.2f)) se(par fmt(%9.2f))) ///
	 noomitted nobaselevels stats(N, fmt(%9.0g) labels(Observations)) legend label ///
	style(tex) starlevels(+ 0.10 * 0.05 ** 0.01) mlabels(, depvars) collabels(none) ///
	note("Standard errors are clustered at the industry level")  ///
	keep(`indep') replace
	}
	



********************************************************************************
*Regressions for Table 6		
********************************************************************************
use "$rdata/data_industry_figs_tables", clear
*Regression of unemployment rate on imputed labor rent share and imputed union rent share
preserve
keep if year>=1987

local indepvars implabrentshare implabrentshare_uwp
local dep unemploymentrate
foreach d of local indepvars{
capture drop temp
gen temp = `d'
local indep temp
local cond
reg `dep' `indep' `cond', vce(cluster indcode_num)
	est sto one`d'
reg `dep' `indep' i.year `cond', vce(cluster indcode_num)
	est sto two`d'	
areg `dep' `indep' `cond', ab(indcode_num) vce(cluster indcode_num) 
	est sto three`d'
areg `dep' `indep' i.year `cond', ab(indcode_num) vce(cluster indcode_num)
	est sto four`d'
esttab one`d' two`d' three`d' four`d' using "$rtables/Table6_`d'_`dep'.rtf",  ///
	cells(b(star fmt(%9.2f)) se(par fmt(%9.2f))) ///
	 noomitted nobaselevels stats(N, fmt(%9.0g) labels(Observations)) legend label ///
	style(tex) starlevels(+ 0.10 * 0.05 ** 0.01) mlabels(, depvars) collabels(none) ///
	note("Standard errors are clustered at the industry level")  ///
	keep(`indep') replace
	}
restore



********************************************************************************
*Regressions for Appendix Table C1		
********************************************************************************

*Regressions of labor share on unionization rate and concentration
*...with Compustat Concentration
local indep unionrate a1_cr20_impadj
local depvars laborshare netlaborshare
foreach dep of local depvars{
local cond
reg `dep' `indep' `cond', vce(cluster indcode_num)
	est sto one`dep'
reg `dep' `indep' i.year `cond', vce(cluster indcode_num)
	est sto two`dep'	
areg `dep' `indep' `cond', ab(indcode_num) vce(cluster indcode_num) 
	est sto three`dep'
areg `dep' `indep' i.year `cond', ab(indcode_num) vce(cluster indcode_num)
	est sto four`dep'
esttab one`dep' two`dep' three`dep' four`dep' using "$rtables/TableC1_`indep'_`dep'_CompC.rtf",  ///
	cells(b(star fmt(%9.2f)) se(par fmt(%9.2f))) ///
	 noomitted nobaselevels stats(N, fmt(%9.0g) labels(Observations)) legend label ///
	style(tex) starlevels(+ 0.10 * 0.05 ** 0.01) mlabels(, depvars) collabels(none) ///
	note("Standard errors are clustered at the industry level")  ///
	keep(`indep') replace
	}
	
*...with Census Concentration
local indep unionrate aa1_cr20_impadj
local depvars laborshare netlaborshare
foreach dep of local depvars{
local cond
reg `dep' `indep' `cond', vce(cluster indcode_num)
	est sto one`dep'
reg `dep' `indep' i.year `cond', vce(cluster indcode_num)
	est sto two`dep'	
areg `dep' `indep' `cond', ab(indcode_num) vce(cluster indcode_num) 
	est sto three`dep'
areg `dep' `indep' i.year `cond', ab(indcode_num) vce(cluster indcode_num)
	est sto four`dep'
esttab one`dep' two`dep' three`dep' four`dep' using "$rtables/TableC1_`indep'_`dep'_CensusC.rtf",  ///
	cells(b(star fmt(%9.2f)) se(par fmt(%9.2f))) ///
	 noomitted nobaselevels stats(N, fmt(%9.0g) labels(Observations)) legend label ///
	style(tex) starlevels(+ 0.10 * 0.05 ** 0.01) mlabels(, depvars) collabels(none) ///
	note("Standard errors are clustered at the industry level")  ///
	keep(`indep') replace
	}
	

		
*Regressions of profitability on unionization and concentration
*...with Compustat Concentration
capture drop conc
gen conc = a1_cr20_impadj
local indep unionrate conc
local depvars grossprofitrate a1_q a1m_q a1med_q
foreach dep of local depvars{
local cond if strpos(indcode,"Finance")==0
reg `dep' `indep' `cond', vce(cluster indcode_num)
	est sto one`dep'
reg `dep' `indep' i.year `cond', vce(cluster indcode_num)
	est sto two`dep'	
areg `dep' `indep' `cond', ab(indcode_num) vce(cluster indcode_num) 
	est sto three`dep'
areg `dep' `indep' i.year `cond', ab(indcode_num) vce(cluster indcode_num)
	est sto four`dep'
esttab one`dep' two`dep' three`dep' four`dep' using "$rtables/TableC1_`indep'_`dep'_CompC.rtf",  ///
	cells(b(star fmt(%9.2f)) se(par fmt(%9.2f))) ///
	 noomitted nobaselevels stats(N, fmt(%9.0g) labels(Observations)) legend label ///
	style(tex) starlevels(+ 0.10 * 0.05 ** 0.01) mlabels(, depvars) collabels(none) ///
	note("Standard errors are clustered at the industry level")  ///
	keep(`indep') replace
	}

*...with Census Concentration
capture drop conc
gen conc = aa1_cr20_impadj
local indep unionrate conc
local depvars grossprofitrate a1_q a1m_q a1med_q
foreach dep of local depvars{
local cond if strpos(indcode,"Finance")==0
reg `dep' `indep' `cond', vce(cluster indcode_num)
	est sto one`dep'
reg `dep' `indep' i.year `cond', vce(cluster indcode_num)
	est sto two`dep'	
areg `dep' `indep' `cond', ab(indcode_num) vce(cluster indcode_num) 
	est sto three`dep'
areg `dep' `indep' i.year `cond', ab(indcode_num) vce(cluster indcode_num)
	est sto four`dep'
esttab one`dep' two`dep' three`dep' four`dep' using "$rtables/TableC1_`indep'_`dep'_CensusC.rtf",  ///
	cells(b(star fmt(%9.2f)) se(par fmt(%9.2f))) ///
	 noomitted nobaselevels stats(N, fmt(%9.0g) labels(Observations)) legend label ///
	style(tex) starlevels(+ 0.10 * 0.05 ** 0.01) mlabels(, depvars) collabels(none) ///
	note("Standard errors are clustered at the industry level")  ///
	keep(`indep') replace
	}
	
		
*Regressions of investment-to-profits on unionization and concentration
*...with Compustat Concentration
local indep unionrate a1_cr20_impadj
local depvars grossI_grossOS_w 
foreach dep of local depvars{
local cond 
reg `dep' `indep' `cond', vce(cluster indcode_num)
	est sto one`dep'
reg `dep' `indep' i.year `cond', vce(cluster indcode_num)
	est sto two`dep'	
areg `dep' `indep' `cond', ab(indcode_num) vce(cluster indcode_num) 
	est sto three`dep'
areg `dep' `indep' i.year `cond', ab(indcode_num) vce(cluster indcode_num)
	est sto four`dep'
esttab one`dep' two`dep' three`dep' four`dep' using "$rtables/TableC1_`indep'_`dep'_CompC.rtf",  ///
	cells(b(star fmt(%9.2f)) se(par fmt(%9.2f))) ///
	 noomitted nobaselevels stats(N, fmt(%9.0g) labels(Observations)) legend label ///
	style(tex) starlevels(+ 0.10 * 0.05 ** 0.01) mlabels(, depvars) collabels(none) ///
	note("Standard errors are clustered at the industry level")  ///
	keep(`indep') replace
	}
	
*...with Census Concentration
local indep unionrate aa1_cr20_impadj
local depvars grossI_grossOS_w 
foreach dep of local depvars{
local cond 
reg `dep' `indep' `cond', vce(cluster indcode_num)
	est sto one`dep'
reg `dep' `indep' i.year `cond', vce(cluster indcode_num)
	est sto two`dep'	
areg `dep' `indep' `cond', ab(indcode_num) vce(cluster indcode_num) 
	est sto three`dep'
areg `dep' `indep' i.year `cond', ab(indcode_num) vce(cluster indcode_num)
	est sto four`dep'
esttab one`dep' two`dep' three`dep' four`dep' using "$rtables/TableC1_`indep'_`dep'_CensusC.rtf",  ///
	cells(b(star fmt(%9.2f)) se(par fmt(%9.2f))) ///
	 noomitted nobaselevels stats(N, fmt(%9.0g) labels(Observations)) legend label ///
	style(tex) starlevels(+ 0.10 * 0.05 ** 0.01) mlabels(, depvars) collabels(none) ///
	note("Standard errors are clustered at the industry level")  ///
	keep(`indep') replace
	}
	