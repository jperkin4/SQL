--delete from PSITOJXP.CPKS_BEFORE;
INSERT INTO PSITOJXP.CPKS_BEFORE
select pcr.policy_number,pcr.orig_policy_number,pcr.coverage_plan_code,pcr.ISSUE_STATE, hst.file_code
      ,hst.trx_code, hst.effective_DAte, PCR.POLICY_EFFECT_DTE, PCR.COMM_OPTION_CODE,trx_amount
      ,pcr.policy_status, pcr.orig_admin_sys
      ,hstcpk.ADJ_DESCRIPTION
  from psitoz01.pcr pcr, psitoz01.polhist hst, PSITOJXP.CPKS_init cpks
      ,psitoz01.polhist_comm_adj hstcpk
    where cpks.policy_number = pcr.policy_number
     and pcr.company_code = 'JPF'
     and pcr.company_code = hst.company_code
     and pcr.policy_number = hst.policy_number
     and hst.trx_code = 'CPK'
     AND hst.REVERSAL_CODE NOT IN ('R','S')
     and hst.company_code = hstcpk.company_code
     and hst.policy_number = hstcpk.policy_number
     and hst.file_code = hstcpk.file_code
     AND ((pcr.orig_admin_sys ='D'
             and hst.effective_date >='12/10/2010')
          or 
           pcr.orig_admin_sys !='D')
    and pcr.policy_number not in
     (select policy_num from psitoq0d.rtrx)