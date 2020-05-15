--delete from PSITOJXP.AJ_BEFORE;
insert into PSITOJXP.Aj_BEFORE
select before.policy_number,pcr.orig_policy_number
 ,year(before.effective_dte),
 pcr.coverage_plan_code, pcr.ISSUE_STATE,0, 'CAJ',
  before.effective_Dte as PREM_eff_date, pcr.POLICY_EFFECT_DTE, pcr.COMM_OPTION_CODE
  ,before.real_amount_paid, pcr.policy_status
  ,pcr.orig_admin_sys,before.misc_description
  ,year(before.effective_dte - policy_effect_dte) + 1,0
  ,' ', '01/01/0001'
  , 0, before.trans_id, before.real_amount_paid, before.amount_paid
  , before.agent_id, before.paid_agent_profile
  ,' ' as earned_agent_id
  ,' ' as earned_agent_profile
  , 0  
  ,' '
  ,' '
  ,' '
  ,' '
  ,' '
  ,' '
  ,' '
  ,' '
  ,' '
  ,' '
  ,paidapr.agent_status
  ,paidapr.term_REASON_CODE
  ,' '
  ,' '
  from psitoz01.pcr pcr
  ,psitoz01.apr paidapr
  ,PSITOJXP.all_remed_adjustments_final before
    where before.trans_id = 'AJ' 
     and pcr.company_code = 'JPF'
     and pcr.policy_number = before.policy_number
     and before.agent_id = paidapr.agent_id
     and before.amount_paid !=0
	 and paidapr.company_code = 'JPF'