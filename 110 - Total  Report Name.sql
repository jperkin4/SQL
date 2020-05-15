--delete from PSITOJXP.Remediation_Net_Financial_Report_NAME
insert into  PSITOJXP.Remediation_Net_Financial_Report_NAME
select PRM.agent_id,paid_agent_tin, paid_Agent_employee_ind, PAID_AGENT_CURRENT_CHANNEL
,aprpf.payment_method,paid_agent_apr_Status , paid_APR_term_reason
,PRM.earned_agent_id, earned_agent_tin,earned_agent_employee_ind
,earned_agent_apr_Status , earned_APR_term_reason
,calyear
,mpr.corporate_name, mpr.last_name, mpr.first_name
,earmpr.corporate_name,earmpr.last_name, earmpr.first_name
,PRM.before_Total, PRM.after_total, PRM.NET_FINANCIAL_TOTAL
   from PSITOJXP.Remediation_Net_Financial_Report PRM, psitoq0D.mpr mpr
       , psitoq0D.mpr earmpr, psitoq0D.aprpf aprpf
     where PRM.agent_id = aprpf.agent_id
       and prm.paid_agent_tin = mpr.mstr_agent_id
       and prm.earned_agent_tin = earmpr.mstr_agent_id
       and prm.earned_agent_id != '          ';
       
insert into  PSITOJXP.Remediation_Net_Financial_Report_NAME
select PRM.agent_id,paid_agent_tin, paid_Agent_employee_ind, PAID_AGENT_CURRENT_CHANNEL
,aprpf.payment_method,paid_agent_apr_Status , paid_APR_term_reason
,PRM.earned_agent_id, earned_agent_tin,earned_agent_employee_ind
,earned_agent_apr_Status , earned_APR_term_reason
,calyear
,mpr.corporate_name, mpr.last_name, mpr.first_name
,'','',''
,PRM.before_Total, PRM.after_total, PRM.NET_FINANCIAL_TOTAL
   from PSITOJXP.Remediation_Net_Financial_Report PRM, psitoq0D.mpr mpr
       , psitoq0D.aprpf aprpf
     where PRM.agent_id = aprpf.agent_id
       and prm.paid_agent_tin = mpr.mstr_agent_id
       and prm.earned_agent_id = '          ';