--delete from PSITOJXP.TERMS_BEFORE;
INSERT INTO PSITOJXP.TERMS_BEFORE
select pcr.policy_number,pcr.orig_policy_number,pcr.coverage_plan_code,pcr.ISSUE_STATE, trm.file_code
      ,trm.trx_code, trm.effective_Date, PCR.POLICY_EFFECT_DTE, PCR.COMM_OPTION_CODE,trx_amount
      ,pcr.policy_status, pcr.orig_admin_sys
  from psitoz01.pcr pcr, psitoz01.polhist trm, PSITOJXP.terms_init ult
    where ult.policy_number = pcr.policy_number
     and pcr.company_code = 'JPF'
     and pcr.company_code = trm.company_code
     and pcr.policy_number = trm.policy_number
     and trm.trx_code in ('TA','TB','TL')
     AND TRM.REVERSAL_CODE NOT IN ('R','S') 
     AND ((pcr.orig_admin_sys ='D'
             and trm.effective_date >='12/10/2010')
          or 
           pcr.orig_admin_sys !='D')
    and pcr.policy_number not in
     (select policy_num from psitoQ0D.rtrx)