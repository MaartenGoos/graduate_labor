use "$rdata/data_fig_c4", clear

*Appendix Figure C4: Replicating Dorn, Schmieder, and Spletzer: Share of workers cleaning, security, and logistics working for business services firms over time
twoway ///
(connected share_in_o_busserv_1950 year if occ_group=="Cleaning", mcolor(navy) lcolor(navy)) ///
(connected share_in_o_busserv_1950 year if occ_group=="Security", mcolor(forest_green) lcolor(forest_green)) ///
(connected share_in_o_logistics_1950 year if occ_group=="Logistics", mcolor(dkorange) lcolor(dkorange)) ///
(connected share_in_o_cleaning_1990 year if occ_group=="Cleaning", mcolor(navy) lcolor(navy) lpattern(dash)) ///
(connected share_in_o_security_1990 year if occ_group=="Security", mcolor(forest_green) lcolor(forest_green) lpattern(dash)) ///
(connected share_in_o_logistics_1990 year if occ_group=="Logistics", mcolor(dkorange) lcolor(dkorange) lpattern(dash)) ///
, legend(order(1 "Cleaning" 2 "Security" 3 "Logistics") rows(1)) ///
note("Solid lines use 1950 occ and ind codes; dashed lines use 1990 occ and ind codes." "CSL occupations and business services industries are defined following Dorn, Schmieder, and Spletzer.") ///
ytitle("Share working for business services firms") xtitle("") xsc(r(1970 2020)) graphregion(color(white))
graph export "$rfigures/AppendixFigureC4.png", replace

