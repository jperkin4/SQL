--delete from PSITOJXP.all_before;
insert into PSITOJXP.all_before
select 'PRM',ae.*,' ',' ',' ',' ', aprpf.payment_method, PCR.REPLACEMENT_TYPE, PCR.STAT_COMP_CODE,PCR.ACCNTING_CODE
 from PSITOJXP.ae_before ae,psitoz01.aprpf aprpf, PSITOZ01.PCR PCR
   where aprpf.company_code = 'JPF'
      and aprpf.agent_id = ae.agent_id
      AND PCR.COMPANY_CODE = 'JPF'
      AND PCR.POLICY_NUMBER = AE.POLICY_NUMBER
union all
select 'CHG',sv.*,' ',' ',' ',' ', aprpf.payment_method, PCR.REPLACEMENT_TYPE, PCR.STAT_COMP_CODE,PCR.ACCNTING_CODE
  from PSITOJXP.sv_before sv,psitoz01.aprpf aprpf, PSITOZ01.PCR PCR
   where aprpf.company_code = 'JPF'
      and aprpf.agent_id = sv.agent_id
      AND PCR.COMPANY_CODE = 'JPF'
      AND PCR.POLICY_NUMBER = SV.POLICY_NUMBER
union all
select adj.trx_code,adj.POLICY_NUMBER     
,adj.ORIG_POLICY_NUMBER
,adj.CALYEAR           
,adj.COVERAGE_PLAN_CODE
,adj.ISSUE_STATE       
,adj.FILE_CODE         
,adj.TRX_CODE          
,adj.EFFECTIVE_DTE     
,adj.POLICY_EFFECT_DATE
,adj.COMM_OPTION       
,adj.TRX_AMOUNT        
,adj.POLICY_STATUS     
,adj.ORIG_ADMIN_SYS    
,adj.ADJ_DESCRIPTION   
,adj.DURATION          
,adj.PREMIUM_CATEGORY  
,adj.USER_ADJ_IND      
,adj.PAYMENT_EFFEC_DATE
,adj.PAYMENT_FILE_CODE 
,adj.TRANS_ID          
,adj.REAL_AMOUNT_PAID  
,adj.AMOUNT_PAID       
,adj.AGENT_ID          
,adj.PAID_AGENT_PROFILE
,adj.EARNED_AGENT_ID   
,adj.EARNED_AGENT_PRO  
,adj.EARNED_AGENT_LEVEL
,adj.WRITING_AGENT_ID  
,adj.WRITING_AGENT_PRO 
,adj.SA_CODE           
,adj.PC_CODE           
,adj.EARNED_AGENT_CHANNel
,adj.EARNED_AGENT_APR_STATUS
,adj.EARNED_APR_TERM_REASON
,adj.EARNED_AGENT_ACR_STATUS
,adj.EARNED_ACR_TERM_REASON
,adj.PAID_AGENT_CHANNEL
,adj.PAID_AGENT_APR_STATUS
,adj.PAID_APR_TERM_REASON
,adj.PAID_AGENT_ACR_STATUS
,adj.PAID_AGENT_TERM_REASON
,' ',' ',' ',' ', aprpf.payment_method, PCR.REPLACEMENT_TYPE , PCR.STAT_COMP_CODE,PCR.ACCNTING_CODE
 from PSITOJXP.ALL_Reportable_ADJ_BEFORE adj,psitoz01.aprpf aprpf, PSITOZ01.PCR PCR
   where aprpf.company_code = 'JPF'
      and aprpf.agent_id = adj.agent_id
      AND PCR.COMPANY_CODE = 'JPF'
      AND PCR.POLICY_NUMBER = adj.POLICY_NUMBER