--delete from PSITOJXP.PREMS_BEFORE;
INSERT INTO PSITOJXP.PREMS_BEFORE
select pcr.policy_number,pcr.orig_policy_number,pcr.coverage_plan_code,pcr.ISSUE_STATE, PRM.file_code, PRM.trx_code
, PRM.effective_DAte, PCR.POLICY_EFFECT_DTE, PCR.COMM_OPTION_CODE,trx_amount, pcr.policy_status,pcr.orig_admin_sys
  from psitoz01.pcr pcr, psitoz01.polhist PRM, PSITOJXP.PREMs_init init
    where init.policy_number = pcr.policy_number
     and pcr.company_code = 'JPF'
     and pcr.company_code = PRM.company_code
     and pcr.policy_number = PRM.policy_number
     and PRM.trx_code in ( 'NA', 'ND', 'NF', 'RA' ,'NP', 'NAI', 'NV', 'ME', 'MA', 'OE', 'IRT')
     AND PRM.REVERSAL_CODE NOT IN ('R','S')     
     AND ((pcr.orig_admin_sys ='D'
             and prm.effective_date >='12/10/2010')
          or 
           pcr.orig_admin_sys !='D')
    and pcr.policy_number not in
     (select policy_num from psitoQ0D.rtrx)