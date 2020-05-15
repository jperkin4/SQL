--delete from PSITOJXP.Ax_BEFORE;
insert into PSITOJXP.Ax_BEFORE
select before.policy_number,pcr.orig_policy_number
 ,year(before.effective_dte),
 pcr.coverage_plan_code, pcr.ISSUE_STATE,0, 'CAJX',
  before.effective_Dte as PREM_eff_date, pcr.POLICY_EFFECT_DTE, pcr.COMM_OPTION_CODE
  ,before.real_amount_paid, pcr.policy_status
  ,pcr.orig_admin_sys,before.misc_description
  ,year(before.effective_dte - policy_effect_dte) + 1,0
  ,' ', '01/01/0001'
  , 0, before.trans_id, before.real_amount_paid, before.amount_paid
  , value(fo.agent_id,before.agent_id) as agent_id, before.paid_agent_profile
  ,before.earned_agent_id
  ,before.earned_agent_profile
  ,int(earacr.HIERARCHY_LEVEL) 
  ,before.writing_agent_id
  ,before.writing_agent_pro
  ,earacr.sa_code
  ,earacr.pc_code
  ,earacr.channel
  ,earapr.agent_status
  ,earapr.term_REASON_CODE
  ,case earacr.termination_dte when '12/31/9999' then 'A' else 'T' end
  ,earacr.termINATION_REASON
  ,paidacr.channel
  ,paidapr.agent_status
  ,paidapr.term_REASON_CODE
  ,case paidacr.termination_dte when '12/31/9999' then 'A' else 'T' end
  ,paidacr.termINATION_REASON
  from psitoz01.pcr pcr
  ,psitoz01.acr earacr
  ,psitoz01.acr paidacr
  ,psitoz01.apr earapr
  ,psitoz01.apr paidapr
  ,PSITOJXP.all_remed_adjustments_final before
       left outer join psitoQ0D.finown fo on
       (before.agent_id = fo.agent_id
        and fo.company_code = 'JPF'
        and before.paid_agent_profile = fo.agent_profile
        and fo.level_in_chain = 1
        and fo_type ='1'
        )         
    where before.trans_id = 'AX' 
     and before.amount_paid!=0
     and pcr.company_code = 'JPF'
     and pcr.policy_number = before.policy_number
     and before.earned_agent_id = earacr.agent_id
     and before.earned_agent_profile = earacr.agent_profile
     and earacr.termination_dte = (
     select max(termination_dte) from psitoz01.acr earacrm
         where before.earned_agent_id = earacrm.agent_id
     and before.earned_agent_profile = earacrm.agent_profile
     )
     and earacr.company_code = 'JPF'
	 and earapr.company_code = 'JPF'
	 and before.earned_agent_id = earapr.agent_id
     and before.agent_id = paidapr.agent_id
	 and paidapr.company_code = 'JPF'
	 and paidapr.agent_id = paidacr.agent_id
     and before.paid_agent_profile = paidacr.agent_profile
     and paidacr.company_code = 'JPF'
     and paidacr.termination_dte = (
     select max(termination_dte) from psitoz01.acr paidacrm
         where paidapr.agent_id = paidacrm.agent_id
     and before.paid_agent_profile = paidacrm.agent_profile
     )