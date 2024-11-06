*********************************************************************
*	"PRODUCTIVITY AND PAY: IS THE LINK BROKEN?"
*	ANNA STANSBURY AND LAWRENCE SUMMERS
*	REPLICATION DO FILES
*	12.18.2017	
*********************************************************************
*	
*						MAIN PAPER REGRESSIONS 
*	 										    
*********************************************************************

clear
set more off
   
cd "C:\Users\Anna\Dropbox\0. Summers\Wages and Productivity\Final Dec 2017\Stata"
use final, clear
	*Final dataset is created from raw.dta using replication_datasetup.do


*****************************************************************
*Table 1: Baseline compensation/productivity regressions
******************************************************************	

newey dlogcomptecpi_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 if year>1950, lag(6)
		outreg2 using Table1.doc, word replace /*
		*/  dec(2) ctitle("Average comp 1950-2015")/*
		*/ addnote("Newey-West standard errors (HAC)")
	test dlogprodtenet_ma2=1
	
	newey dlogcomptecpi_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 if year<1975 & year>1950, lag(6)
		outreg2 using Table1.doc, word append /*
		*/  dec(2) ctitle("Average comp 1950-1973")
	test dlogprodtenet_ma2=1
		
	newey dlogcomptecpi_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 if year>1975, lag(6)
		outreg2 using Table1.doc, word append /*
		*/  dec(2) ctitle("Average comp 1975-2015")
	test dlogprodtenet_ma2=1
	
	newey dlogcomptecpi_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 if year>2000, lag(6)
		outreg2 using Table1.doc, word append /*
		*/  dec(2) ctitle("Average comp 2000-2015")
	test dlogprodtenet_ma2=1
		
	newey dlogmedcompepi73_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 if year>1975, lag(6)
		outreg2 using Table1.doc, word append /*
		*/  dec(2) ctitle("Median comp 1975-2015")
	test dlogprodtenet_ma2=1
		
	newey dlogcomppnsepi_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 if year>1950, lag(6)
		outreg2 using Table1.doc, word append /*
		*/  dec(2) ctitle("PNSC 1950-2015")
	test dlogprodtenet_ma2=1
		
	newey dlogcomppnsepi_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 if year<1975 & year>1950, lag(6)
		outreg2 using Table1.doc, word append /*
		*/  dec(2) ctitle("PNSC 1950-1973")
	test dlogprodtenet_ma2=1
		
	newey dlogcomppnsepi_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 if year>1975, lag(6)
		outreg2 using Table1.doc, word append /*
		*/  dec(2) ctitle("PNSC 1975-2015")
	test dlogprodtenet_ma2=1
	


**************************************************************
*Tables 3 and 4: Other points in the wage distribution
**************************************************************
newey dlogp10_ma2 dlogprodtenet73_ma2 unemp_ma2 l1.unemp_ma2 if year>1975, lag(6)
		outreg2 using Table3.doc, word replace /*
		*/  dec(2) title("10th to 50th percentile real wages, and productivity, 1975-2015") ctitle("10th p.")/*
		*/ addnote("Newey-West standard errors (HAC)")	
	test dlogprodtenet73_ma2=1

newey dlogp20_ma2 dlogprodtenet73_ma2 unemp_ma2 l1.unemp_ma2 if year>1975, lag(6)
		outreg2 using Table3.doc, word append /*
		*/  dec(2) ctitle("20th p.")
	test dlogprodtenet73_ma2=1
		
newey dlogp30_ma2 dlogprodtenet73_ma2 unemp_ma2 l1.unemp_ma2 if year>1975, lag(6)
		outreg2 using Table3.doc, word append /*
		*/  dec(2) ctitle("30th p.")
	test dlogprodtenet73_ma2=1
		
newey dlogp40_ma2 dlogprodtenet73_ma2 unemp_ma2 l1.unemp_ma2 if year>1975, lag(6)
		outreg2 using Table3.doc, word append /*
		*/  dec(2) ctitle("40th p.")
	test dlogprodtenet73_ma2=1
		
newey dlogp50_ma2 dlogprodtenet73_ma2 unemp_ma2 l1.unemp_ma2 if year>1975, lag(6)
		outreg2 using Table3.doc, word append /*
		*/  dec(2) ctitle("50th p.")
	test dlogprodtenet73_ma2=1

		
newey dlogp60_ma2 dlogprodtenet73_ma2 unemp_ma2 l1.unemp_ma2 if year>1975, lag(6)
		outreg2 using Table4.doc, word replace /*
		*/  dec(2) title("60th to 95th percentile real wages, and productivity, 1973-2015") ctitle("60th p.")/*
		*/ addnote("Newey-West standard errors (HAC)")	
	test dlogprodtenet73_ma2=1

newey dlogp70_ma2 dlogprodtenet73_ma2 unemp_ma2 l1.unemp_ma2 if year>1975, lag(6)
		outreg2 using Table4.doc, word append /*
		*/  dec(2) ctitle("70th p.")
	test dlogprodtenet73_ma2=1
		
newey dlogp80_ma2 dlogprodtenet73_ma2 unemp_ma2 l1.unemp_ma2 if year>1975, lag(6)
		outreg2 using Table4.doc, word append /*
		*/  dec(2) ctitle("80th p.")
	test dlogprodtenet73_ma2=1
		
newey dlogp90_ma2 dlogprodtenet73_ma2 unemp_ma2 l1.unemp_ma2 if year>1975, lag(6)
		outreg2 using Table4.doc, word append /*
		*/  dec(2) ctitle("90th p.")
	test dlogprodtenet73_ma2=1
		
newey dlogp95_ma2 dlogprodtenet73_ma2 unemp_ma2 l1.unemp_ma2 if year>1975, lag(6)
		outreg2 using Table4.doc, word append /*
		*/  dec(2) ctitle("95th p.")
	test dlogprodtenet73_ma2=1
	

		
**************************************************************
*Table 5: G7 countries
**************************************************************
newey dlogcompcpi_ca_ma2 dlogprod_ca_ma2 unemp_ca_ma2 l1.unemp_ca_ma2 if year>1972, lag(6)
			outreg2 using Table5.doc, word replace /*
			*/  dec(2) ctitle("Canada 1972 - 2015")/*
			*/ addnote("Newey-West standard errors (HAC)")
		test dlogprod_ca_ma2=1

newey dlogcompcpi_fr_ma2 dlogprod_fr_ma2 unemp_fr_ma2 l1.unemp_fr_ma2 if year>1972, lag(6)
			outreg2 using Table5.doc, word append /*
			*/  dec(2) ctitle("France 1972 - 2015")
		test dlogprod_fr_ma2=1

newey dlogcompcpi_wg_ma2 dlogprod_wg_ma2 unemp_wg_ma2 l1.unemp_wg_ma2 if year>1972 & year<1992, lag(6)
			outreg2 using Table5.doc, word append /*
			*/  dec(2) ctitle("West Germany 1972 - 1990")
		test dlogprod_wg_ma2=1

newey dlogcompcpi_ger_ma2 dlogprod_ger_ma2 unemp_ger_ma2 l1.unemp_ger_ma2 if year>1993, lag(6)
			outreg2 using Table5.doc, word append /*
			*/  dec(2) ctitle("Germany 1993 - 2015")
		test dlogprod_ger_ma2=1

newey dlogcompcpi_ita_ma2 dlogprod_ita_ma2 unemp_ita_ma2 l1.unemp_ita_ma2 if year>1985, lag(6)
			outreg2 using Table5.doc, word append /*
			*/  dec(2) ctitle("Italy 1985 - 2015")
		test dlogprod_ita_ma2=1			

newey dlogcompcpi_jp_ma2 dlogprod_jp_ma2 unemp_jp_ma2 l1.unemp_jp_ma2 if year>1997 & year<2016, lag(6)
			outreg2 using Table5.doc, word append /*
			*/  dec(2) ctitle("Japan 1997 - 2014")
		test dlogprod_jp_ma2=1

newey dlogcompcpi_uk_ma2 dlogprod_uk_ma2 unemp_uk_ma2 l1.unemp_uk_ma2 if year>1996, lag(6)
			outreg2 using Table5.doc, word append /*
			*/  dec(2) ctitle("UK 1996 - 2015")
		test dlogprod_uk_ma2=1
	

	
********************************************************************************
*Table 7: Productivity and the labor share
********************************************************************************	
newey dloglaborshare_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 if year>1950 & year<2015, lag(6)
	outreg2 using Table7.doc, word replace /*
		*/  dec(2)/*
		*/ addnote("Newey-West standard errors (HAC)")
	
newey dloglaborshare_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 if year>1950 & year<1975, lag(6)
	outreg2 using Table7.doc, word append dec(2)
	
newey dloglaborshare_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 if year>1975 & year<2015, lag(6)
	outreg2 using Table7.doc, word append dec(2)
	
newey dloglaborshare_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 if year>2000 & year<2015, lag(6)
	outreg2 using Table7.doc, word append dec(2)
	

********************************************************************************
*Table 9: Relative price of investment goods and the labor share
********************************************************************************	
newey dloglaborshare_ma2 dlogpinv_ma2 unemp_ma2 l1.unemp_ma2 if year>1950 & year<2015, lag(6)
outreg2 using Table9.doc, word replace /*
		*/  dec(2)/*
		*/ addnote("Newey-West standard errors (HAC)")
	
newey dloglaborshare_ma2 dlogpinv_ma2 unemp_ma2 l1.unemp_ma2 if year>1950 & year<1975, lag(6)
	outreg2 using Table9.doc, word append dec(2)
	
newey dloglaborshare_ma2 dlogpinv_ma2 unemp_ma2 l1.unemp_ma2 if year>1975 & year<2015, lag(6)
	outreg2 using Table9.doc, word append dec(2)
	
newey dloglaborshare_ma2 dlogpinv_ma2 unemp_ma2 l1.unemp_ma2 if year>2000 & year<2015, lag(6)
	outreg2 using Table9.doc, word append dec(2)
	

********************************************************************************
*Table 10: Productivity and the mean/median compensation ratio
********************************************************************************	
newey dlogmmratiote_ma2 dlogprodtenet_ma2 if year>1975, lag(6)
	outreg2 using Table10.doc, word replace dec(2)
	
newey dlogmmratiote_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 if year>1975, lag(6)
	outreg2 using Table10.doc, word append dec(2)

