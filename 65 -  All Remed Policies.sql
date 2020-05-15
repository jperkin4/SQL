--delete from PSITOJXP.all_remed_pols_agt;
insert into PSITOJXP.all_remed_pols_agt
  (select policy_number,agent_id from psitojxp.sv_before
    union
    select policy_number,agent_id from psitojxp.sv_after
    union
    select policy_number,agent_id from psitojxp.ae_before
    union
    select policy_number,agent_id from psitojxp.ae_after
  )