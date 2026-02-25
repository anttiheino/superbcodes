/* Start a cas session */
cas mysess;
caslib _all_ assign;

/* Sort the PUBLIC.HMEQ by the variable DEBTINC in descending order and print the new sorted data set*/
proc sort data=public.hmeq out=sorted_debtinc;
  by descending debtinc;
run;
proc print data=sorted_debtinc;
  title "Sorted HMEQ by DebtInc in Descending Order";
run;

/* Drop the variable CLNO from the public.hmeq dataset, save the new dataset into the work library*/
data work.hmeq_clean;
  set public.hmeq;
  drop clno;
run;

/* Create a logistic regression model that uses BAD as a target variable and all the other variables as input variables. Use the WORK.HMEQ_CLEAN dataset. */
proc logselect data=work.hmeq_clean;
   model BAD = LOAN MORTDUE VALUE YOJ DEROG DELINQ CLAGE NINQ;
run;

/* Create a gradient boosting model that uses BAD as the target from public.hmeq.
   Add the following feautures:
   1. Partitioning with a 70/30 Train/Validation fit 
   2. Autotuning 
*/
proc gradboost data=public.hmeq;
    target BAD / level=nominal;
    input LOAN MORTDUE VALUE YOJ DEROG DELINQ CLAGE NINQ / level=interval;
    input REASON JOB / level=nominal;
    partition fraction(validate=0.3 seed=4321);
    autotune tuningparameters=(ntrees maxdepth vars_to_try numbin minleafsize);
run;