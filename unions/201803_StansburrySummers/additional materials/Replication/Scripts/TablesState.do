use "$rdata/data_state_figs_tables", clear


*Table 3: Regressions of labor share on labor rent share and union rent share, annual
preserve
keep if year>=1984 & year<=2016
	local deps laborshare
	local indeps  imprentshare imprentshare_uwp
foreach indep of local indeps{
foreach dep of local deps{
 eststo clear
	reg `dep' `indep', robust cluster(statefip)
		est sto one
	reg `dep' `indep' i.year , robust cluster(statefip)
		est sto two
	areg `dep' `indep', absorb(statefip) vce(cluster statefip)
		est sto three
	areg `dep' `indep' i.year , absorb(statefip)  vce(cluster statefip)
		est sto four
	esttab one two three four using "$rtables/Table3_`indep'_`dep'.rtf",  ///
	cells(b(star fmt(%9.2f)) se(par fmt(%9.2f))) ///
	 noomitted nobaselevels stats(N, fmt(%9.0g) labels(Observations)) legend label ///
	style(tex) starlevels(+ 0.10 * 0.05 ** 0.01) mlabels(, depvars) collabels(none) ///
	note("Standard errors are clustered at the industry level")  ///
	keep(`indep') replace
}
}
restore



*Table 5: Regressions of unemployment rate on labor rent share and union rent share, annual
preserve
keep if year>=1984 & year<=2016
	local deps unemploymentrate
	local indeps  imprentshare imprentshare_uwp
foreach indep of local indeps{
foreach dep of local deps{
 eststo clear
	reg `dep' `indep', robust cluster(statefip)
		est sto one
	reg `dep' `indep' i.year , robust cluster(statefip)
		est sto two
	areg `dep' `indep', absorb(statefip) vce(cluster statefip)
		est sto three
	areg `dep' `indep' i.year , absorb(statefip)  vce(cluster statefip)
		est sto four
	esttab one two three four using "$rtables/Table5_`indep'_`dep'.rtf",  ///
	cells(b(star fmt(%9.2f)) se(par fmt(%9.2f))) ///
	 noomitted nobaselevels stats(N, fmt(%9.0g) labels(Observations)) legend label ///
	style(tex) starlevels(+ 0.10 * 0.05 ** 0.01) mlabels(, depvars) collabels(none) ///
	note("Standard errors are clustered at the industry level")  ///
	keep(`indep') replace
}
}
restore
