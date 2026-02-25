/* Start a cas session and assign all libraries*/
cas mysess;
caslib _all_ assign;

/* Sort the PUBLIC.HMEQ data by the variable DEBTINC in descending order and print the new sorted data set*/


/* Drop the variable CLNO from the public.hmeq dataset and then save it as a new dataset into the work library*/



/* Create a logistic regression model that uses BAD as a target variable and all the other variables as input variables. Use the work.hmeq_clno_removed dataset. */


/* Create a gradient boosting model that uses BAD as the target from work.hmeq_clno_removed.
   Add the following feautures:
   1. Partitioning with a 70/30 Train/Validation fit 
   2. Autotuning 
*/