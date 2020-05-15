insert into psitojxp.all_before_tin
		select all.*,paidapr.mstr_agent_id, earnedapr.mstr_agent_id,paidapr.employee_ind, earnedapr.employee_ind
		 from psitojxp.all_before all
		     ,psitoz01.apr paidapr
		     ,psitoz01.apr earnedapr
		 where all.agent_id = paidapr.agent_id
		   and all.earned_agent_id =earnedapr.agent_id