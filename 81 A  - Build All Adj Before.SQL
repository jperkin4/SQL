--delete from  PSITOJXP.all_adj_before
insert into PSITOJXP.all_adj_before
( select * from PSITOJXP.cpksae_before cpk
union all
select * from PSITOJXP.ax_before cpk
union all
select * from PSITOJXP.aj_before aj)