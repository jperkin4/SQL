--delete from PSITOJXP.all_after;
insert into PSITOJXP.all_after
select 'PRM',ae.*,' ',' ',' ',' ' , aprpf.payment_method , PCR.REPLACEMENT_TYPE, PCR.STAT_COMP_CODE,PCR.ACCNTING_CODE
 from PSITOJXP.ae_AFTER ae,psitoz01.aprpf aprpf, PSITOQ0D.PCR PCR
   where aprpf.company_code = 'JPF'
      and aprpf.agent_id = ae.agent_id
      AND PCR.COMPANY_CODE = 'JPF'
      AND PCR.POLICY_NUMBER = AE.POLICY_NUMBER
union all
select 'CHG',sv.*,' ',' ',' ',' ', aprpf.payment_method , PCR.REPLACEMENT_TYPE, PCR.STAT_COMP_CODE,PCR.ACCNTING_CODE
 from PSITOJXP.SV_AFTER SV,psitoz01.aprpf aprpf, PSITOQ0D.PCR PCR
   where aprpf.company_code = 'JPF'
      and aprpf.agent_id = SV.agent_id
      AND PCR.COMPANY_CODE = 'JPF'
      AND PCR.POLICY_NUMBER = SV.POLICY_NUMBER