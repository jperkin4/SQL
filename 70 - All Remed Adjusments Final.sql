--delete from PSITOJXP.all_remed_adjustments_final
insert into PSITOJXP.all_remed_adjustments_final
  SELECT all.ageNT_ID          
,all.EARNED_AGENT_ID   
,all.EARNED_AGENT_PROFIle
,all.PAID_AGENT_PROFILE
,all.WRITING_AGENT_ID  
,all.WRITING_AGENT_PRO 
,all.REVERSAL_CODE     
,all.DEBIT_CREDIT_CODE 
,pol.POLICY_NUMBER     
,all.MISC_DESCRIPTION  
,all.REAL_AMOUNT_PAID  
,all.AMOUNT_PAID  
,all.tRANS_ID          
,all.EFFECTIVE_DTE         
   FROM  PSITOJXP.ALL_REMED_ADJUSTMENTS ALL                              
        , PSITOJXP.ALL_REMED_POLS_AGT POL                                
      WHERE POL.AGENT_ID = ALL.AGENT_ID                                 
 AND (                                                                  
LOCATE(TRIM(SUBSTR(POL.POLICY_NUMBER,1,12)),ALL.MISC_DESCRIPTION) !=0   
        OR                                                              
LOCATE(TRIM(SUBSTR(POL.POLICY_NUMBER,1,12)),ALL.POLICY_NUMBER) !=0      
          )                              
          and      all.AMOUNT_PAID != 0                          
  ;                                                                     

