--delete from psitojxp.ALL_Reportable_ADJ_BEFORE

insert into psitojxp.ALL_Reportable_ADJ_BEFORE
select dst.include_adj_ind,all.* 
	from  PSITOJXP.all_adj_before all, PSITOJXP.ALL_ADJUSTMENTS_BUSINESS_INPUT dst
   	where all.POLICY_NUMBER = dst.policy_number
     and all.TRX_CODE = dst.trx_Code
     and all.eFFECTIVE_DTE = dst.effective_date
     and all.trans_id = dst.traNS_ID
     and all.real_AMOUNT_PAID = dst.amount_paid
     and all.AGENT_ID = dst.agent_id
     and all.EARNED_AGENT_ID = dst.earned_agent_id
     and all.file_code = dst.file_code 
     and all.PAID_AGENT_PROFILE = dst.paid_agent_profile
	 and all.WRITING_AGENT_ID = dst.writing_agent_id  
	 and all.WRITING_AGENT_PRO = dst.writing_agent_pro 
 	 and all.EARNED_AGENT_PRO = dst.earned_agent_pro  
 	 and dst.INCLUDE_ADJ_IND  ='Y'   
 	 and dst.trx_code !='CPK'
 	 union 
select dst.include_adj_ind,all.* 
	from  PSITOJXP.all_adj_before all, PSITOJXP.ALL_ADJUSTMENTS_BUSINESS_INPUT dst
   	where all.POLICY_NUMBER = dst.policy_number
     and all.TRX_CODE = dst.trx_Code
     and all.file_code = dst.file_code 
 	 and dst.INCLUDE_ADJ_IND  ='Y'   
 	 and dst.trx_code ='CPK'
 	 
          

