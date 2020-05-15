--delete from  psitojxp.all_before_current_channel;

 insert into psitojxp.all_before_current_channel
 select  bef.*, acr.channel  
 from psitoz01.acr acr,psitojxp.all_before_Tin bef
where bef.agent_id = acr.agent_id
  and acr.company_code = 'JPF'
  and (char(acr.termination_dte)||char(acr.effective_dte)||acr.agent_profile) = 
  (select max(char(acr2.termination_dte)||char(acr2.effective_dte)||acr2.agent_profile) from psitoz01.acr acr2
    where bef.agent_id = acr2.agent_id
     and  acr2.company_code = 'JPF')