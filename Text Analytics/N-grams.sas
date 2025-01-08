/*****************************************************************************/
/*  Create N-Grams from text data in SAS Viya */
/*****************************************************************************/

/* Documentation link: https://go.documentation.sas.com/doc/en/pgmsascdc/v_058/casactml/cas-langmodel-texttongram.htm */

/*****************************************************************************/
/*  Create a default CAS session and create SAS librefs for existing caslibs */
/*  so that they are visible in the SAS Studio Libraries tree.               */
/*****************************************************************************/
cas;
caslib _all_ assign;

/* Converts raw text data into n-gram data */
proc cas;
	action langModel.textToNGram /
	casInVarList={"COMPLAINT"}, /*variable containing analyzed text*/
	casOut={caslib='CASUSER', name='NHTSA_ngram'}, /*output table*/
	nGrams=3, /*length of produced ngram*/
	table={caslib='CASUSER',name='NHTSA_2023'}; /*input table*/
run;	

/* Removes redundant n-grams and merges their counts */
proc cas;
	action langModel.nGramCount /
	casOut={caslib='CASUSER', name='NHTSA_ngram_count'}, /*output table*/
	table={caslib='CASUSER',name='NHTSA_NGRAM'}; /*input table*/
run;
