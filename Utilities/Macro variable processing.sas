/*orginal value*/
%let caslib=CASUSER;
/*orginal value with quotes and checks*/
%let want="%sysfunc(tranwrd(%cmpres(&caslib),%str( ),%str(" ")))";

/*show orginal value and processed value*/
%put &caslib;
%put &want;