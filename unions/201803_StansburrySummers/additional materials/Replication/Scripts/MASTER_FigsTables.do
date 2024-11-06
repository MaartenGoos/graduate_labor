*Anna Stansbury and Lawrence Summers (2020)
*Declining Worker Power and American Economic Performance
*Replication Files - Figures and Tables

*MASTER: Run this file to create all Figures in the Document, and output data for all Tables

********************************************************************************
*Set directories

*Insert your directory where Replication folder is saved:
	global		rmain		"C:/Users/annas/Dropbox/CorporateWorkerPower/Replication - Figs and Tables"
	
	*Directories within Replication folder
	global		rdata			"$rmain/Data"
	global		rscripts		"$rmain/Scripts"
	global		rfigures		"$rmain/Figures"
	global		rtables			"$rmain/Tables"

********************************************************************************
*Produce all figures by running this script
cd "$rscripts"

*Aggregate-level figures (main paper and appendix)
	* Figures 5, 7, 8, 17, 18
	* Appendix Figures B1, B2, C13, C14, C15)
run FiguresAggregate

*Industry-level figures (main paper and appendix)
	*Figures 6, 10, 11, 12, 13, 15
	*Appendix Figures B5, B6, B7, B8, B9, B10, B11, B12, B13, C5, C6, C7, C8, C16, C17, C22
run FiguresIndustry

*Industry-level tables (main paper and appendix)
	*Regression results in Table 4, Table 6, Appendix Table C1
	*Note that these analyses produce the results in separate word documents or in-line in the Stata window, and they need to be manually transferred into the Tables in the paper
run TablesIndustry

*State-level figures (main paper and appendix)
	*Figures 9, 14
	*Appendix Figures C18, C19
run FiguresState

*State-level tables
	*Table 3 and Table 5
run TablesState

*Main Paper: Other Figures
run Figure1
run Figure2
run Figure3
run Figure4
run Figure16
run Figure17

*Main Paper: Other Tables
run Table1 /*(This does not automatically output Table 1 - need to copy summary stats from Stata window)*/

*Appendix: Other Tables
run AppendixTableB1

*Appendix Section A
run AppendixFigureA1
run AppendixFigureA2
run AppendixFigureA3
run AppendixFigureA4
run AppendixFigureA5
run AppendixFigureA6
run AppendixFigureA7
run AppendixFigureA8
run AppendixFiguresA9A10

*Appendix Section B
run AppendixFiguresB3B4B5
run AppendixFigureB9

*Appendix Section C
run AppendixFiguresC1C2
run AppendixFigureC3
run AppendixFigureC4
run AppendixFigureC9
run AppendixFigureC10
run AppendixFigureC11
run AppendixFigureC12
run AppendixFiguresC20C21