--delete from PSITOJXP.all_remed_adjustments;
insert into PSITOJXP.all_remed_adjustments
select AGENT_ID 
, substr(earned_agent_number,1,10), substr(earned_agent_number,11,3)
,paid_agent_profile, writing_agent_id
,writing_agent_pro ,REVERSAL_CODE  
,DEBIT_CREDIT_CODE ,POLICY_NUMBER 
,MISC_DESCRIPTION ,REAL_AMOUNT_PAID,amount_paid
,TRANS_ID ,EFFECTIVE_DTE 
 from psitojxp.all_adjustments
  where agent_id in
  (select agent_id from psitojxp.sv_before
    union
    select agent_id from psitojxp.sv_after
    union
    select agent_id from psitojxp.ae_before
    union
    select agent_id from psitojxp.ae_after
  )
    and amount_paid !=0