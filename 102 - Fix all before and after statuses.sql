--delete from psitojxp.all_before_fix_status; delete from psitojxp.all_after_fix_status;

insert into psitojxp.all_before_fix_status
select issue_ind ,POLICY_NUMBER,orig_policy_number ,CALYEAR ,COVERAGE_PLAN_CODE,
ISSUE_STATE ,FILE_CODE ,TRX_CODE, bef.EFFECTIVE_DTE , POLICY_EFFECT_DATE , COMM_OPTION
  ,TRX_AMOUNT ,policy_status ,orig_admin_sys,ADJ_DESCRIPTION ,duration ,premium_category ,user_adj_ind 
  ,PAYMENT_EFFEC_DATE , PAYMENT_FILE_CODE ,TRANS_ID ,real_amount_paid ,AMOUNT_PAID 
  , bef.AGENT_ID  ,PAID_AGENT_PROFILE  , earned_agent_id  ,
  earned_agent_pro  , earned_agent_level int, writing_agent_id  
  , writing_agent_pro  ,sa_code  ,pc_code  
  ,earned_agent_channel  
  ,earapr.AGENT_STATUS  ,earapr.TERM_REASON_CODE
  , earned_agent_acr_status  
  , earned_ACR_term_reason  ,paid_agent_channel  
  ,paidapr.AGENT_STATUS  ,paidapr.TERM_REASON_CODE
  , paid_agent_acr_status  , paid_agent_term_reason  
  ,ISSUE1_1B_4_IND  ,issue2_ind  , issue3_ind  ,
   issue3B_ind  , payment_method  ,REPLACEMENT_TYPE  
   , STAT_COMP_code, ACCOUNTING_CODE,paid_agent_tin  
   , earned_agent_tin  ,paid_agent_employee_ind  
   ,earned_agent_employee_ind  ,paid_agent_current_channel  
   from psitojxp.all_before_current_channel bef, psitoq0d.apr earapr,psitoq0d.apr paidapr
     where bef.agent_id = paidapr.agent_id
     and paidapr.company_code = 'JPF'
     and bef.earned_agent_id = earapr.agent_id
     and earapr.company_code = 'JPF';
     
     
insert into psitojxp.all_after_fix_status
select issue_ind ,POLICY_NUMBER,orig_policy_number ,CALYEAR ,COVERAGE_PLAN_CODE,
ISSUE_STATE ,FILE_CODE ,TRX_CODE, aft.EFFECTIVE_DTE , POLICY_EFFECT_DATE , COMM_OPTION
  ,TRX_AMOUNT ,policy_status ,orig_admin_sys,duration ,premium_category ,user_adj_ind 
  ,PAYMENT_EFFEC_DATE , PAYMENT_FILE_CODE ,TRANS_ID ,real_amount_paid ,AMOUNT_PAID 
  , aft.AGENT_ID  ,PAID_AGENT_PROFILE  , earned_agent_id  ,
  earned_agent_pro  , earned_agent_level int, writing_agent_id  
  , writing_agent_pro  ,sa_code  ,pc_code  
  ,earned_agent_channel  
  ,earapr.AGENT_STATUS  ,earapr.TERM_REASON_CODE
  , earned_agent_acr_status  
  , earned_ACR_term_reason  ,paid_agent_channel  
  ,paidapr.AGENT_STATUS  ,paidapr.TERM_REASON_CODE
  , paid_agent_acr_status  , paid_agent_term_reason  
  ,ISSUE1_1B_4_IND  ,issue2_ind  , issue3_ind  ,
   issue3B_ind  , payment_method  ,REPLACEMENT_TYPE  
   , STAT_COMP_code, ACCOUNTING_CODE,paid_agent_tin  
   , earned_agent_tin  ,paid_agent_employee_ind  
   ,earned_agent_employee_ind  ,paid_agent_current_channel  
   from psitojxp.all_after_current_channel aft, psitoq0d.apr earapr,psitoq0d.apr paidapr
     where aft.agent_id = paidapr.agent_id
     and paidapr.company_code = 'JPF'
     and aft.earned_agent_id = earapr.agent_id
     and earapr.company_code = 'JPF';
     