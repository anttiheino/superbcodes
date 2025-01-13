/* Create a session to establish a connection to the server */
cas;
caslib _all_ assign;

/*Score input data using a model published in the CAS publishing destination */
proc cas; 
   loadactionset "modelPublishing";
   runModelLocal  /                                    
      inTable={name="INPUTTABLENAME",caslib="CASLIBNAME"},/*Table containing the input data that should be scored */
	  modelName="NAMEOFPUBLISHEDMODEL", /*Name of the model in the publishing destination table*/
      modelTable={name="PUBLISHINGDESTINATIONTABLENAME",caslib="CASLIBNAME"}, /*Publishing destination table that contains the published model name*/
	  outTable={name="OUTPUTTABLENAME", caslib="OUTPUTCASLIB", lifetime=2000} /*Output data*/
;
run;
quit;
