use "$rdata/data_table_b1", clear

*Appendix Table B1
eststo clear
by group: eststo: quietly estpost summarize ///
   empshare_group
esttab using "$rtables/TableB1.rtf", cells("mean(fmt(%9.2fc))") label nodepvar  replace
