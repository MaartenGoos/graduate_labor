use "$rdata/data_aggregate_figs_table1", clear

*Table 1
*Summary table: NET
summ netimplabrentshare netimplabrentshare_uwp netimplabrentshare_fs netimplabrentshare_iiwd if year==1982 & industry=="Nonfinancial Corporate Business"
summ netimplabrentshare netimplabrentshare_uwp netimplabrentshare_fs netimplabrentshare_iiwd if year==1986 & industry=="Nonfinancial Corporate Business"
summ netimplabrentshare netimplabrentshare_uwp netimplabrentshare_fs netimplabrentshare_iiwd  if year==1996 & industry=="Nonfinancial Corporate Business"
summ netimplabrentshare netimplabrentshare_uwp netimplabrentshare_fs netimplabrentshare_iiwd if year==2006 & industry=="Nonfinancial Corporate Business"
summ netimplabrentshare netimplabrentshare_uwp netimplabrentshare_fs netimplabrentshare_iiwd  if year==2016 & industry=="Nonfinancial Corporate Business"

*Summary table: GROSS
summ implabrentshare implabrentshare_uwp implabrentshare_fs implabrentshare_iiwd if year==1982 & industry=="Nonfinancial Corporate Business"
summ implabrentshare implabrentshare_uwp implabrentshare_fs implabrentshare_iiwd if year==1986 & industry=="Nonfinancial Corporate Business"
summ implabrentshare implabrentshare_uwp implabrentshare_fs implabrentshare_iiwd  if year==1996 & industry=="Nonfinancial Corporate Business"
summ implabrentshare implabrentshare_uwp implabrentshare_fs implabrentshare_iiwd if year==2006 & industry=="Nonfinancial Corporate Business"
summ implabrentshare implabrentshare_uwp implabrentshare_fs implabrentshare_iiwd  if year==2016 & industry=="Nonfinancial Corporate Business"

