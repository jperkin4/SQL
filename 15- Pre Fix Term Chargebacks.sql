--delete from PSITOJXP.SV_BEFORE;

insert into PSITOJXP.SV_BEFORE
select before.policy_number,before.orig_policy_number
 ,year(before.effective_dte),
 before.coverage_plan_code, before.ISSUE_STATE,before.file_code, before.trx_code,
  before.effective_Dte as term_eff_date, before.POLICY_EFFECT_DaTE, before.COMM_OPTION
  ,before.trx_amount, before.policy_status
  ,before.orig_admin_sys,' ',int(ahf.policy_duration),ahf.premium_category
  ,ahf.user_adj_ind
  , ahf.PAYMENT_EFFEC_DATE as payment_eff_date
  , ahf.PAYMENT_file_code, ahf.trans_id, ahf.real_amount_paid, ahf.amount_paid
  , value(fo.fo_agent_id,ahf.agent_id) as agent_id, ahf.paid_agent_profile
  ,substr(ahf.AGENT_NUM_EARNED,1,10) as earned_agent_id
  ,substr(ahf.AGENT_NUM_EARNED,11,3) as earned_agent_pro
  ,ahf.earned_agent_level
  ,ahf.writing_agent_id
  ,ahf.writing_agent_pro
  ,earacr.sa_code
  ,earacr.pc_code
  ,earacr.channel
  ,earapr.agent_status
  ,earapr.TERM_REASON_CODE
  ,case earacr.termination_dte when '12/31/9999' then 'A' else 'T' end
  ,earacr.TERMINATION_REASON
  ,paidacr.channel
  ,paidapr.agent_status
  ,paidapr.TERM_REASON_CODE
  ,case paidacr.termination_dte when '12/31/9999' then 'A' else 'T' end
  ,paidacr.TERMINATION_REASON
  from PSITOJXP.terms_before before
  ,psitoz01.acr earacr
  ,psitoz01.acr paidacr
  ,psitoz01.apr earapr
  ,psitoz01.apr paidapr
  ,psitoz01.agthist ahf
       left outer join psitoQ0D.finown fo on
       (ahf.agent_id = fo.agent_id
        and ahf.company_Code = fo.company_code
        and ahf.paid_agent_profile = fo.agent_profile
        and fo.level_in_chain = 1
        and fo_type ='1'
        )         
    where ahf.company_Code = 'JPF'
     and before.policy_number = ahf.policy_number
     and before.file_Code = ahf.policy_file_Code
     and ahf.amount_paid > 0
     and ahf.reversal_code = ' '
     and substr(AGENT_NUM_EARNED,1,10) = earacr.agent_id
     and substr(AGENT_NUM_EARNED,11,3) = earacr.agent_profile
     and earacr.company_code = 'JPF'
     and earacr.termination_dte = (
     select max(termination_dte) from psitoQ0D.acr earacrm
         where substr(ahf.AGENT_NUM_EARNED,1,10) = earacrm.agent_id
     and substr(ahf.AGENT_NUM_EARNED,11,3) = earacrm.agent_profile
     )
	 and earapr.company_code = 'JPF'
	 and substr(AGENT_NUM_EARNED,1,10) = earapr.agent_id
     and ahf.agent_id = paidapr.agent_id
	 and paidapr.company_code = 'JPF'
	 and paidapr.agent_id = paidacr.agent_id
     and ahf.paid_agent_profile = paidacr.agent_profile
     and paidacr.company_code = 'JPF'
     and paidacr.termination_dte = (
     select max(termination_dte) from psitoQ0D.acr paidacrm
         where paidapr.agent_id = paidacrm.agent_id
     and ahf.paid_agent_profile = paidacrm.agent_profile
     )