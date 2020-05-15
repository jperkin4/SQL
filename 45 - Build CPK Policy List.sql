--delete from PSITOJXP.cpks_init
insert into psitojxp.cpks_init
select  policy_number from psitojxp.sv_before
union
select  policy_number from psitojxp.sv_after
union 
select  policy_number from psitojxp.ae_before
union
select  policy_number from psitojxp.ae_after
     
  
