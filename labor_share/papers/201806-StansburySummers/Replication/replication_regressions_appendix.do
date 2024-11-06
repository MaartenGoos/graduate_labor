*********************************************************************
*	"PRODUCTIVITY AND PAY: IS THE LINK BROKEN?"
*	ANNA STANSBURY AND LAWRENCE SUMMERS
*	REPLICATION DO FILES
*	12.18.2017	
*********************************************************************
*	
*						APPENDIX REGRESSIONS 
*	 										    
*********************************************************************

clear
set more off
   
cd "C:\Users\Anna\Dropbox\0. Summers\Wages and Productivity\Final Dec 2017\Stata"
use final, clear
	*Final dataset is created from raw.dta using replication_datasetup.do
	

************************************************************************				
*Table A1: Baseline regressions - contemporaneous
************************************************************************
*Contemporaneous*
newey dlogcomptecpi dlogprodtenet unemp l1.unemp if year>1949, lag(6)
		outreg2 using TableA1.doc, word replace /*
		*/ label dec(2)/*
		*/ addnote("Newey-West standard errors (HAC)")
		test dlogprodtenet=1
		
	newey dlogcomptecpi dlogprodtenet unemp l1.unemp if year>1949 & year<1974, lag(6)
		outreg2 using TableA1.doc, word append /*
		*/ label dec(2) 
		test dlogprodtenet=1
		
	newey dlogcomptecpi dlogprodtenet unemp l1.unemp if year>1974, lag(6)
		outreg2 using TableA1.doc, word append /*
		*/ label dec(2) 
		test dlogprodtenet=1
		
	newey dlogcomptecpi dlogprodtenet unemp l1.unemp if year>1999, lag(6)
		outreg2 using TableA1.doc, word append /*
		*/ label dec(2) 
		test dlogprodtenet=1
		
	newey dlogmedcompepi73 dlogprodtenet unemp l1.unemp if year>1974, lag(6)
		outreg2 using TableA1.doc, word append /*
		*/ label dec(2)
		test dlogprodtenet=1
		
	newey dlogcomppnsepi dlogprodtenet unemp l1.unemp if year>1949, lag(6)
		outreg2 using TableA1.doc, word append /*
		*/ label dec(2)
		test dlogprodtenet=1
		
	newey dlogcomppnsepi dlogprodtenet unemp l1.unemp if year>1949 & year<1974, lag(6)
		outreg2 using TableA1.doc, word append /*
		*/ label dec(2)
		test dlogprodtenet=1
		
	newey dlogcomppnsepi dlogprodtenet unemp l1.unemp if year>1974, lag(6)
		outreg2 using TableA1.doc, word append /*
		*/ label dec(2)
		test dlogprodtenet=1
		

************************************************************************				
*Table A2: Baseline regressions - two-year moving average
************************************************************************
newey dlogcomptecpi_ma1 dlogprodtenet_ma1 unemp_ma1 l1.unemp_ma1 if year>1949, lag(6)
		outreg2 using TableA2.doc, word replace /*
		*/ label dec(2)/*
		*/ addnote("Newey-West standard errors (HAC)")
		test dlogprodtenet_ma1=1
		
	newey dlogcomptecpi_ma1 dlogprodtenet_ma1 unemp_ma1 l1.unemp_ma1 if year>1949 & year<1974, lag(6)
		outreg2 using TableA2.doc, word append /*
		*/ label dec(2)
		test dlogprodtenet_ma1=1
		
	newey dlogcomptecpi_ma1 dlogprodtenet_ma1 unemp_ma1 l1.unemp_ma1 if year>1974, lag(6)
		outreg2 using TableA2.doc, word append /*
		*/ label dec(2)
		test dlogprodtenet_ma1=1
		
	newey dlogcomptecpi_ma1 dlogprodtenet_ma1 unemp_ma1 l1.unemp_ma1 if year>1999, lag(6)
		outreg2 using TableA2.doc, word append /*
		*/ label dec(2)
		test dlogprodtenet_ma1=1
		
	newey dlogmedcompepi73_ma1 dlogprodtenet_ma1 unemp_ma1 l1.unemp_ma1 if year>1974, lag(6)
		outreg2 using TableA2.doc, word append /*
		*/ label dec(2)
		test dlogprodtenet_ma1=1
		
	newey dlogcomppnsepi_ma1 dlogprodtenet_ma1 unemp_ma1 l1.unemp_ma1 if year>1949, lag(6)
		outreg2 using TableA2.doc, word append /*
		*/ label dec(2)
		test dlogprodtenet_ma1=1
		
	newey dlogcomppnsepi_ma1 dlogprodtenet_ma1 unemp_ma1 l1.unemp_ma1 if year>1949 & year<1974, lag(6)
		outreg2 using TableA2.doc, word append /*
		*/ label dec(2)
		test dlogprodtenet_ma1=1
		
	newey dlogcomppnsepi_ma1 dlogprodtenet_ma1 unemp_ma1 l1.unemp_ma1 if year>1974, lag(6)
		outreg2 using TableA2.doc, word append /*
		*/ label dec(2)
		test dlogprodtenet_ma1=1
		
		

************************************************************************				
*Table A3: Baseline regressions - four-year moving average
************************************************************************
newey dlogcomptecpi_ma3 dlogprodtenet_ma3 unemp_ma3 l1.unemp_ma3 if year>1951, lag(8)
		outreg2 using TableA3.doc, word replace /*
		*/ label dec(2)/*
		*/ addnote("Newey-West standard errors (HAC)")
		test dlogprodtenet_ma3=1
		
	newey dlogcomptecpi_ma3 dlogprodtenet_ma3 unemp_ma3 l1.unemp_ma3 if year>1951 & year<1975, lag(8)
		outreg2 using TableA3.doc, word append /*
		*/ label dec(2)
		test dlogprodtenet_ma3=1
		
	newey dlogcomptecpi_ma3 dlogprodtenet_ma3 unemp_ma3 l1.unemp_ma3 if year>1976, lag(8)
		outreg2 using TableA3.doc, word append /*
		*/ label dec(2)
		test dlogprodtenet_ma3=1
		
	newey dlogcomptecpi_ma3 dlogprodtenet_ma3 unemp_ma3 l1.unemp_ma3 if year>2001, lag(8)
		outreg2 using TableA3.doc, word append /*
		*/ label dec(2)
		test dlogprodtenet_ma3=1
		
	newey dlogmedcompepi73_ma3 dlogprodtenet_ma3 unemp_ma3 l1.unemp_ma3 if year>1976, lag(8)
		outreg2 using TableA3.doc, word append /*
		*/ label dec(2)
		test dlogprodtenet_ma3=1
		
	newey dlogcomppnsepi_ma3 dlogprodtenet_ma3 unemp_ma3 l1.unemp_ma3 if year>1951, lag(8)
		outreg2 using TableA3.doc, word append /*
		*/ label dec(2)
		test dlogprodtenet_ma3=1
		
	newey dlogcomppnsepi_ma3 dlogprodtenet_ma3 unemp_ma3 l1.unemp_ma3 if year>1951 & year<1975, lag(8)
		outreg2 using TableA3.doc, word append /*
		*/ label dec(2)
		test dlogprodtenet_ma3=1
		
	newey dlogcomppnsepi_ma3 dlogprodtenet_ma3 unemp_ma3 l1.unemp_ma3 if year>1976, lag(8)
		outreg2 using TableA3.doc, word append /*
		*/ label dec(2)
		test dlogprodtenet_ma3=1

************************************************************************				
*Table A4: Baseline regressions - five-year moving average
************************************************************************
newey dlogcomptecpi_ma4 dlogprodtenet_ma4 unemp_ma4 l1.unemp_ma4 if year>1952, lag(10)
		outreg2 using TableA4.doc, word replace /*
		*/ label dec(2)/*
		*/ addnote("Newey-West standard errors (HAC)")
		test dlogprodtenet_ma4=1
		
	newey dlogcomptecpi_ma4 dlogprodtenet_ma4 unemp_ma4 l1.unemp_ma4 if year>1952 & year<1976, lag(10)
		outreg2 using TableA4.doc, word append /*
		*/ label dec(2)
		test dlogprodtenet_ma4=1
		
	newey dlogcomptecpi_ma4 dlogprodtenet_ma4 unemp_ma4 l1.unemp_ma4 if year>1977, lag(10)
		outreg2 using TableA4.doc, word append /*
		*/ label dec(2)
		test dlogprodtenet_ma4=1
		
	newey dlogcomptecpi_ma4 dlogprodtenet_ma4 unemp_ma4 l1.unemp_ma4 if year>2002, lag(10)
		outreg2 using TableA4.doc, word append /*
		*/ label dec(2)
		test dlogprodtenet_ma4=1
		
	newey dlogmedcompepi73_ma4 dlogprodtenet_ma4 unemp_ma4 l1.unemp_ma4 if year>1977, lag(10)
		outreg2 using TableA4.doc, word append /*
		*/ label dec(2)
		test dlogprodtenet_ma4=1
		
	newey dlogcomppnsepi_ma4 dlogprodtenet_ma4 unemp_ma4 l1.unemp_ma4 if year>1952, lag(10)
		outreg2 using TableA4.doc, word append /*
		*/ label dec(2)
		test dlogprodtenet_ma4=1
		
	newey dlogcomppnsepi_ma4 dlogprodtenet_ma4 unemp_ma4 l1.unemp_ma4 if year>1952 & year<1976, lag(10)
		outreg2 using TableA4.doc, word append /*
		*/ label dec(2)
		test dlogprodtenet_ma4=1
		
	newey dlogcomppnsepi_ma4 dlogprodtenet_ma4 unemp_ma4 l1.unemp_ma4 if year>1977, lag(10)
		outreg2 using TableA4.doc, word append /*
		*/ label dec(2)
		test dlogprodtenet_ma4=1
		

************************************************************************				
*Table A5: Baseline regressions - no unemployment control
************************************************************************
newey dlogcomptecpi_ma2 dlogprodtenet_ma2 if year>1950, lag(6)
		outreg2 using TableA5.doc, word replace /*
		*/ label dec(2) /*
		*/ addnote("Newey-West standard errors (HAC)")
		
	test dlogprodtenet_ma2=1
	
	newey dlogcomptecpi_ma2 dlogprodtenet_ma2 if year<1975 & year>1950, lag(6)
		outreg2 using TableA5.doc, word append /*
		*/ label dec(2)
	test dlogprodtenet_ma2=1
		
	newey dlogcomptecpi_ma2 dlogprodtenet_ma2 if year>1975, lag(6)
		outreg2 using TableA5.doc, word append /*
		*/ label dec(2)
	test dlogprodtenet_ma2=1
		
	newey dlogcomptecpi_ma2 dlogprodtenet_ma2 if year>2000, lag(6)
		outreg2 using TableA5.doc, word append /*
		*/ label dec(2)
	test dlogprodtenet_ma2=1
	
	newey dlogmedcompepi73_ma2 dlogprodtenet_ma2 if year>1975, lag(6)
		outreg2 using TableA5.doc, word append /*
		*/ label dec(2)
	test dlogprodtenet_ma2=1
		
	newey dlogcomppnsepi_ma2 dlogprodtenet_ma2 if year>1950, lag(6)
		outreg2 using TableA5.doc, word append /*
		*/ label dec(2)
	test dlogprodtenet_ma2=1
		
	newey dlogcomppnsepi_ma2 dlogprodtenet_ma2 if year<1975 & year>1950, lag(6)
		outreg2 using TableA5.doc, word append /*
		*/ label dec(2)
	test dlogprodtenet_ma2=1
		
	newey dlogcomppnsepi_ma2 dlogprodtenet_ma2 if year>1975, lag(6)
		outreg2 using TableA5.doc, word append /*
		*/ label dec(2)
	test dlogprodtenet_ma2=1
	
	
************************************************************************				
*Table A6: Baseline regressions - time trend
************************************************************************	
newey dlogcomptecpi_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 t if year>1950, lag(6)
		outreg2 using TableA6.doc, word replace /*
		*/ label dec(2)/*
		*/ addnote("Newey-West standard errors (HAC)")
	test dlogprodtenet_ma2=1
	
	newey dlogcomptecpi_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 t if year<1975 & year>1950, lag(6)
		outreg2 using TableA6.doc, word append /*
		*/ label dec(2)	
	test dlogprodtenet_ma2=1
		
	newey dlogcomptecpi_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 t if year>1975, lag(6)
		outreg2 using TableA6.doc, word append /*
		*/ label dec(2)
	test dlogprodtenet_ma2=1
			
	newey dlogcomptecpi_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 t if year>2000, lag(6)
		outreg2 using TableA6.doc, word append /*
		*/ label dec(2)
	test dlogprodtenet_ma2=1
		
	newey dlogmedcompepi73_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 t if year>1975, lag(6)
		outreg2 using TableA6.doc, word append /*
		*/ label dec(2)
	test dlogprodtenet_ma2=1
		
	newey dlogcomppnsepi_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 t if year>1950, lag(6)
		outreg2 using TableA6.doc, word append /*
		*/ label dec(2)
	test dlogprodtenet_ma2=1
		
	newey dlogcomppnsepi_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 t if year<1975 & year>1950, lag(6)
		outreg2 using TableA6.doc, word append /*
		*/ label dec(2)
	test dlogprodtenet_ma2=1
		
	newey dlogcomppnsepi_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 t if year>1975, lag(6)
		outreg2 using TableA6.doc, word append /*
		*/ label dec(2)
	test dlogprodtenet_ma2=1
	

	
************************************************************************				
*Table A7 Baseline regressions - decade dummies
************************************************************************	
newey dlogcomptecpi_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 fifties sixties seventies eighties nineties noughties if year>1950, lag(6)
		outreg2 using TableA7.doc, word replace /*
		*/ label dec(2)/*
		*/ addnote("Newey-West standard errors (HAC)")
	test dlogprodtenet_ma2=1
	
	newey dlogcomptecpi_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 fifties sixties seventies if year<1975 & year>1950, lag(6)
		outreg2 using TableA7.doc, word append /*
		*/ label dec(2)
	test dlogprodtenet_ma2=1
		
	newey dlogcomptecpi_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 seventies eighties nineties noughties if year>1975, lag(6)
		outreg2 using TableA7.doc, word append /*
		*/ label dec(2)
	test dlogprodtenet_ma2=1
	
	newey dlogcomptecpi_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 noughties if year>2000, lag(6)
		outreg2 using TableA7.doc, word append /*
		*/ label dec(2)
	test dlogprodtenet_ma2=1
		
	newey dlogmedcompepi73_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 seventies eighties nineties noughties if year>1975, lag(6)
		outreg2 using TableA7.doc, word append /*
		*/ label dec(2)
	test dlogprodtenet_ma2=1
		
	newey dlogcomppnsepi_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2  fifties sixties seventies eighties nineties noughties if year>1950, lag(6)
		outreg2 using TableA7.doc, word append /*
		*/ label dec(2)
	test dlogprodtenet_ma2=1
		
	newey dlogcomppnsepi_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 fifties sixties seventies if year<1975 & year>1950, lag(6)
		outreg2 using TableA7.doc, word append /*
		*/ label dec(2)
	test dlogprodtenet_ma2=1
		
	newey dlogcomppnsepi_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 seventies eighties nineties noughties if year>1975, lag(6)
		outreg2 using TableA7.doc, word append /*
		*/ label dec(2)
	test dlogprodtenet_ma2=1
	
	
************************************************************************				
*Table A8 Productivity and labor share - 2-year moving average
************************************************************************		
newey dloglaborshare_ma1 dlogprodtenet_ma1 unemp_ma1 l1.unemp_ma1 if year>1949 & year<2015, lag(6)
		outreg2 using TableA8.doc, word replace /*
		*/ label dec(2)/*
		*/ addnote("Newey-West standard errors (HAC)")
		
newey dloglaborshare_ma1 dlogprodtenet_ma1 unemp_ma1 l1.unemp_ma1 if year>1949 & year<1974, lag(6)
		outreg2 using TableA8.doc, word append /*
		*/ label dec(2)
		
newey dloglaborshare_ma1 dlogprodtenet_ma1 unemp_ma1 l1.unemp_ma1 if year>1974 & year<2015, lag(6)
		outreg2 using TableA8.doc, word append /*
		*/ label dec(2)
		
newey dloglaborshare_ma1 dlogprodtenet_ma1 unemp_ma1 l1.unemp_ma1 if year>1999 & year<2015, lag(6)
		outreg2 using TableA8.doc, word append /*
		*/ label dec(2)

		
************************************************************************				
*Table A9 Productivity and labor share - 4-year moving average
************************************************************************			
newey dloglaborshare_ma3 dlogprodtenet_ma3 unemp_ma3 l1.unemp_ma3 if year>1951 & year<2015, lag(8)
		outreg2 using TableA9.doc, word replace /*
		*/ label dec(2)/*
		*/ addnote("Newey-West standard errors (HAC)")
		
	newey dloglaborshare_ma3 dlogprodtenet_ma3 unemp_ma3 l1.unemp_ma3 if year>1951 & year<1975, lag(8)
		outreg2 using TableA9.doc, word append /*
		*/ label dec(2)
		
	newey dloglaborshare_ma3 dlogprodtenet_ma3 unemp_ma3 l1.unemp_ma3 if year>1976 & year<2015, lag(8)
		outreg2 using TableA9.doc, word append /*
		*/ label dec(2)
		
	newey dloglaborshare_ma3 dlogprodtenet_ma3 unemp_ma3 l1.unemp_ma3 if year>2001 & year<2015, lag(8)
		outreg2 using TableA9.doc, word append /*
		*/ label dec(2)

		
************************************************************************				
*Table A10 Productivity and labor share - 5-year moving average
************************************************************************	
newey dloglaborshare_ma4 dlogprodtenet_ma4 unemp_ma4 l1.unemp_ma4 if year>1952 & year<2015, lag(10)
		outreg2 using TableA10.doc, word replace /*
		*/ label dec(2)/*
		*/ addnote("Newey-West standard errors (HAC)")
		
	newey dloglaborshare_ma4 dlogprodtenet_ma4 unemp_ma4 l1.unemp_ma4 if year>1952 & year<1976, lag(10)
		outreg2 using TableA10.doc, word append /*
		*/ label dec(2)
		
	newey dloglaborshare_ma4 dlogprodtenet_ma4 unemp_ma4 l1.unemp_ma4 if year>1977 & year<2015, lag(10)
		outreg2 using TableA10.doc, word append /*
		*/ label dec(2)
		
	newey dloglaborshare_ma4 dlogprodtenet_ma4 unemp_ma4 l1.unemp_ma4 if year>2002 & year<2015, lag(10)
		outreg2 using TableA10.doc, word append /*
		*/ label dec(2)
		
		
************************************************************************				
*Table A11 Average compensation and productivity - pre and post 2000
************************************************************************	
gen dlogprodtenet_post2000 = 0
replace dlogprodtenet_post2000 = dlogprodtenet if year>1999
gen dlogprodtenet_pre2000 = 0
replace dlogprodtenet_pre2000 = dlogprodtenet if dlogprodtenet_post2000 == 0

gen dlogprodtenet_ma1_post2000 = 0
replace dlogprodtenet_ma1_post2000 = dlogprodtenet_ma1 if year>1999
gen dlogprodtenet_ma1_pre2000 = 0
replace dlogprodtenet_ma1_pre2000 = dlogprodtenet_ma1 if dlogprodtenet_ma1_post2000 == 0

gen dlogprodtenet_ma2_post2000 = 0
replace dlogprodtenet_ma2_post2000 = dlogprodtenet_ma2 if year>2000
gen dlogprodtenet_ma2_pre2000 = 0
replace dlogprodtenet_ma2_pre2000 = dlogprodtenet_ma2 if dlogprodtenet_ma2_post2000 == 0

gen dlogprodtenet_ma3_post2000 = 0
replace dlogprodtenet_ma3_post2000 = dlogprodtenet_ma3 if year>2001
gen dlogprodtenet_ma3_pre2000 = 0
replace dlogprodtenet_ma3_pre2000 = dlogprodtenet_ma3 if dlogprodtenet_ma3_post2000 == 0

gen dlogprodtenet_ma4_post2000 = 0
replace dlogprodtenet_ma4_post2000 = dlogprodtenet_ma4 if year>2002
gen dlogprodtenet_ma4_pre2000 = 0
replace dlogprodtenet_ma4_pre2000 = dlogprodtenet_ma4 if dlogprodtenet_ma4_post2000==0

	
*Contemporaneous*
*Restricted*
	newey dlogcomptecpi dlogprodtenet_pre2000 dlogprodtenet_post2000 unemp l1.unemp, lag(6)
		outreg2 using TableA11.doc, word replace /*
		*/ label dec(2) 
		
*Unrestricted*
	newey dlogcomptecpi dlogprodtenet unemp l1.unemp if year<2000, lag(6)
		outreg2 using TableA11.doc, word append /*
		*/ label dec(2) 
		

	newey dlogcomptecpi dlogprodtenet unemp l1.unemp if year>1999, lag(6)
		outreg2 using TableA11.doc, word append /*
		*/ label dec(2)
		
*Two-year moving average*
*Restricted*
	newey dlogcomptecpi_ma1 dlogprodtenet_ma1_pre2000 dlogprodtenet_ma1_post2000 unemp_ma1 l1.unemp_ma1 if year>1949, lag(6)
		outreg2 using TableA11.doc, word replace /*
		*/ label dec(2)
		
*Unrestricted*	
	newey dlogcomptecpi_ma1 dlogprodtenet_ma1 unemp_ma1 l1.unemp_ma1 if year<2000 & year>1949, lag(6)
		outreg2 using TableA11.doc, word append /*
		*/ label dec(2)
		

	newey dlogcomptecpi_ma1 dlogprodtenet_ma1 unemp_ma1 l1.unemp_ma1 if year>1999, lag(6)
		outreg2 using TableA11.doc, word append /*
		*/ label dec(2)
		

*Three-year moving average*
*Restricted*	
	newey dlogcomptecpi_ma2 dlogprodtenet_ma2_pre2000 dlogprodtenet_ma2_post2000 unemp_ma2 l1.unemp_ma2 if year>1950, lag(6)
		outreg2 using TableA11.doc, word replace /*
		*/ label dec(2)
		
*Unrestricted*		
	newey dlogcomptecpi_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 if year<2001 & year>1950, lag(6)
		outreg2 using TableA11.doc, word append /*
		*/ label dec(2)
		

	newey dlogcomptecpi_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 if year>2000, lag(6)
		outreg2 using TableA11.doc, word append /*
		*/ label dec(2)
		

*Four-year moving average*
*Restricted*
	newey dlogcomptecpi_ma3 dlogprodtenet_ma3_pre2000 dlogprodtenet_ma3_post2000 unemp_ma3 l1.unemp_ma3 if year>1951, lag(6)
		outreg2 using TableA11.doc, word replace /*
		*/ label dec(2)
		
*Unrestricted*		
	newey dlogcomptecpi_ma3 dlogprodtenet_ma3 unemp_ma3 l1.unemp_ma3 if year<2002 & year>1951, lag(6)
		outreg2 using TableA11.doc, word append /*
		*/ label dec(2)
		

	newey dlogcomptecpi_ma3 dlogprodtenet_ma3 unemp_ma3 l1.unemp_ma3 if year>2001, lag(6)
		outreg2 using TableA11.doc, word append /*
		*/ label dec(2)
		
		
*Five-year moving average*
*Restricted*
		newey dlogcomptecpi_ma4 dlogprodtenet_ma4_pre2000 dlogprodtenet_ma4_post2000 unemp_ma4 l1.unemp_ma4 if year>1952, lag(6)
		outreg2 using TableA11.doc, word replace /*
		*/ label dec(2)
		
*Unrestricted*		
	newey dlogcomptecpi_ma4 dlogprodtenet_ma4 unemp_ma4 l1.unemp_ma4 if year<2003 & year>1952, lag(6)
		outreg2 using TableA11.doc, word append /*
		*/ label dec(2)
		

	newey dlogcomptecpi_ma4 dlogprodtenet_ma4 unemp_ma4 l1.unemp_ma4 if year>2002, lag(6)
		outreg2 using TableA11.doc, word append /*
		*/ label dec(2)

************************************************************************				
*Table A12 Labor share and productivity - pre and post 2000
************************************************************************	
*Contemporaneous*
*Restricted*
	newey dloglaborshare dlogprodtenet_pre2000 dlogprodtenet_post2000 unemp l1.unemp, lag(6)
		outreg2 using TableA12.doc, word replace /*
		*/ label dec(2) 
		
*Unrestricted*
	newey dloglaborshare dlogprodtenet unemp l1.unemp if year<2000, lag(6)
		outreg2 using TableA12.doc, word append /*
		*/ label dec(2) 
		

	newey dloglaborshare dlogprodtenet unemp l1.unemp if year>1999, lag(6)
		outreg2 using TableA12.doc, word append /*
		*/ label dec(2)
		
*Two-year moving average*
*Restricted*
	newey dloglaborshare_ma1 dlogprodtenet_ma1_pre2000 dlogprodtenet_ma1_post2000 unemp_ma1 l1.unemp_ma1 if year>1949 & year<2015, lag(6)
		outreg2 using TableA12.doc, word replace /*
		*/ label dec(2)
		
*Unrestricted*	
	newey dloglaborshare_ma1 dlogprodtenet_ma1 unemp_ma1 l1.unemp_ma1 if year<2000 & year>1949, lag(6)
		outreg2 using TableA12.doc, word append /*
		*/ label dec(2)
		

	newey dloglaborshare_ma1 dlogprodtenet_ma1 unemp_ma1 l1.unemp_ma1 if year>1999 & year<2015, lag(6)
		outreg2 using TableA12.doc, word append /*
		*/ label dec(2)
		

*Three-year moving average*
*Restricted*	
	newey dloglaborshare_ma2 dlogprodtenet_ma2_pre2000 dlogprodtenet_ma2_post2000 unemp_ma2 l1.unemp_ma2 if year>1950 & year<2015, lag(6)
		outreg2 using TableA12.doc, word replace /*
		*/ label dec(2)
		
*Unrestricted*		
	newey dloglaborshare_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 if year<2001 & year>1950, lag(6)
		outreg2 using TableA12.doc, word append /*
		*/ label dec(2)
		

	newey dloglaborshare_ma2 dlogprodtenet_ma2 unemp_ma2 l1.unemp_ma2 if year>2000 & year<2015, lag(6)
		outreg2 using TableA12.doc, word append /*
		*/ label dec(2)
		

*Four-year moving average*
*Restricted*
	newey dloglaborshare_ma3 dlogprodtenet_ma3_pre2000 dlogprodtenet_ma3_post2000 unemp_ma3 l1.unemp_ma3 if year>1951 & year<2015, lag(6)
		outreg2 using TableA12.doc, word replace /*
		*/ label dec(2)
		
*Unrestricted*		
	newey dloglaborshare_ma3 dlogprodtenet_ma3 unemp_ma3 l1.unemp_ma3 if year<2002 & year>1951, lag(6)
		outreg2 using TableA12.doc, word append /*
		*/ label dec(2)
		

	newey dloglaborshare_ma3 dlogprodtenet_ma3 unemp_ma3 l1.unemp_ma3 if year>2001 & year<2015, lag(6)
		outreg2 using TableA12.doc, word append /*
		*/ label dec(2)
		
		
*Five-year moving average*
*Restricted*
		newey dloglaborshare_ma4 dlogprodtenet_ma4_pre2000 dlogprodtenet_ma4_post2000 unemp_ma4 l1.unemp_ma4 if year>1952 & year<2015, lag(6)
		outreg2 using TableA12.doc, word replace /*
		*/ label dec(2)
		
*Unrestricted*		
	newey dloglaborshare_ma4 dlogprodtenet_ma4 unemp_ma4 l1.unemp_ma4 if year<2003 & year>1952, lag(6)
		outreg2 using TableA12.doc, word append /*
		*/ label dec(2)
		

	newey dloglaborshare_ma4 dlogprodtenet_ma4 unemp_ma4 l1.unemp_ma4 if year>2002 & year<2015, lag(6)
		outreg2 using TableA12.doc, word append /*
		*/ label dec(2)




	

		
		
	
