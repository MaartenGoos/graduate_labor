
use "$rdata/data_fig4", clear


*Generate variables
	*Average pay per worker
	gen avgpay = pay/emp
	*Average hourly pay for production workers
	gen hourlyprodpay = prodw/prodh
	*Labor productivity
	gen lprod = vadd/emp
	*Value added per production hour
	gen hourlyprodva = vadd/prodh
	
	

*Generate moving averages of key variables
xtset naics year
local vars  avgpay hourlyprodpay lprod hourlyprodva
foreach var of local vars{
gen log`var'=log(`var')
tssmooth ma log`var'_ma3 = log`var', window(1 1 1)
	}
	

*To create Figure 4: Regressions of average pay on revenue productivity 
local dep logavgpay_ma3
local indep loglprod_ma3
estimates clear
qui eststo: areg `dep' `indep' i.year , absorb(naics) vce(cluster naics)
	est sto oneavg
qui eststo: areg `dep' `indep' i.year if year<1980, absorb(naics) vce(cluster naics)
	est sto twoavg
qui eststo: areg `dep' `indep' i.year if year>=1980 & year<2000, absorb(naics) vce(cluster naics)
	est sto threeavg
qui eststo: areg `dep' `indep' i.year if year>=2000, absorb(naics) vce(cluster naics)
	est sto fouravg
	
local dep loghourlyprodpay_ma3
local indep loghourlyprodva_ma3
qui eststo: areg `dep' `indep' i.year , absorb(naics) vce(cluster naics)
	est sto oneprod
qui eststo: areg `dep' `indep' i.year if year<1980, absorb(naics) vce(cluster naics)
	est sto twoprod
qui eststo: areg `dep' `indep' i.year if year>=1980 & year<2000, absorb(naics) vce(cluster naics)
	est sto threeprod
qui eststo: areg `dep' `indep' i.year if year>=2000, absorb(naics) vce(cluster naics)
	est sto fourprod

	coefplot (oneavg oneprod, mcolor(black) ciopts(lcolor(black) lpattern(dash))) (twoavg twoprod, mcolor(navy) ciopts(lcolor(navy))) (threeavg threeprod, mcolor(cranberry) ciopts(lcolor(cranberry))) (fouravg fourprod, mcolor(dkorange) ciopts(lcolor(dkorange))), ///
		keep(loglprod_ma3 loghourlyprodva_ma3) ylabel(1 "All workers" 2 "Production workers") ///
		graphregion(color(white)) xtitle("Coefficient in regression of avg compensation per worker(/hour)" "on avg value added per worker(/hour)") bcolor(white) ///
		legend(order (2 "Whole period" 4 "1958-1979" 6 "1980-1999" 8 "2000-2011") rows(1))
		graph export "$rfigures/Figure4.png", replace

	
	