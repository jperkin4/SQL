--delete from PSITOJXP.Remediation_Net_Financial_Report

insert into PSITOJXP.Remediation_Net_Financial_Report
with before (agent_id,earned_agent_id, calyear,paid_agent_tin,paid_Agent_employee_ind
, earned_agent_tin,earned_agent_employee_ind, PAID_AGENT_CURRENT_CHANNEL
,earned_agent_apr_Status , earned_APR_term_reason ,paid_agent_apr_Status , paid_APR_term_reason
,total_amount_paid) as
(
select before.agent_id, before.earned_agent_id,calyear,paid_agent_tin,paid_Agent_employee_ind
, earned_agent_tin,earned_agent_employee_ind, PAID_AGENT_CURRENT_CHANNEL
,earned_agent_apr_Status , earned_APR_term_reason ,paid_agent_apr_Status 
, paid_APR_term_reason,sum (before.REAL_amount_paid)
from PSITOJXP.all_before_fix_status before 
group by before.agent_id,before.earned_agent_id,calyear,paid_agent_tin,paid_Agent_employee_ind
, earned_agent_tin,earned_agent_employee_ind, PAID_AGENT_CURRENT_CHANNEL
,earned_agent_apr_Status , earned_APR_term_reason ,paid_agent_apr_Status , paid_APR_term_reason
)
,after (agent_id,earned_agent_id, calyear,paid_agent_tin,paid_Agent_employee_ind
, earned_agent_tin,earned_agent_employee_ind, PAID_AGENT_CURRENT_CHANNEL
,earned_agent_apr_Status , earned_APR_term_reason ,paid_agent_apr_Status , paid_APR_term_reason
,total_amount_paid) as
(
select after.agent_id,after.earned_agent_id, calyear,paid_agent_tin,paid_Agent_employee_ind
, earned_agent_tin,earned_agent_employee_ind, PAID_AGENT_CURRENT_CHANNEL
,earned_agent_apr_Status , earned_APR_term_reason ,paid_agent_apr_Status , paid_APR_term_reason
,sum (after.REAL_amount_paid)
from PSITOJXP.all_after_fix_status after
group by after.agent_id,after.earned_agent_id, calyear,paid_agent_tin,paid_Agent_employee_ind
, earned_agent_tin,earned_agent_employee_ind, PAID_AGENT_CURRENT_CHANNEL
,earned_agent_apr_Status , earned_APR_term_reason ,paid_agent_apr_Status , paid_APR_term_reason
)
select value(after.agent_id ,before.agent_id) as agent_id
,value(after.earned_agent_id ,before.earned_agent_id) as earned_agent_id
,value(after.calyear,before.calyear) as year
,value(after.paid_agent_tin,before.paid_agent_tin)
,value(after.paid_Agent_employee_ind,after.paid_Agent_employee_ind)
,value(after.earned_agent_tin,before.earned_agent_tin)
,value(after.earned_agent_employee_ind,before.earned_agent_employee_ind)
,value(after.PAID_AGENT_CURRENT_CHANNEL,before.PAID_AGENT_CURRENT_CHANNEL)
,value(after.earned_agent_apr_Status ,before.earned_agent_apr_Status)
,value(after.earned_APR_term_reason,before.earned_APR_term_reason)
,value(after.paid_agent_apr_Status,before.paid_agent_apr_Status)
,value(after.paid_APR_term_reason,before.paid_APR_term_reason)
,before.total_amount_paid as BEFORE_TOTAL
,after.total_amount_paid as AFTER_TOTAL
,value(after.total_amount_paid,0) - value(before.total_amount_paid,0) as NET_TOTAL
    from after full outer join before
    on (after.agent_id 					= before.agent_id
    and after.earned_agent_id 			= before.earned_agent_id
    and after.calyear  					= before.calyear
    and after.earned_agent_apr_Status 	= before.earned_agent_apr_Status
    and after.earned_APR_term_reason 	= before.earned_APR_term_reason
    and after.paid_agent_apr_Status 	= before.paid_agent_apr_Status
    and after.paid_agent_tin 			= before.paid_agent_tin
    and after.paid_Agent_employee_ind 	= before.paid_Agent_employee_ind
    and after.PAID_AGENT_CURRENT_CHANNEL= before.PAID_AGENT_CURRENT_CHANNEL
    and after.earned_agent_employee_ind = before.earned_agent_employee_ind
    and after.paid_agent_employee_ind 	= before.paid_agent_employee_ind
    )
    