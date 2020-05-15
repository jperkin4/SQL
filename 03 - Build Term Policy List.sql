--delete from PSITOJXP.terms_init
--grant all on psitojxp.terms_init to ncdpkbf
insert into psitojxp.terms_init
select distinct pcr.policy_number from psitoQ0D.pcr pcr, psitoQ0D.polhist trm
      where coverage_plan_code in ('VULON7E1','SVLON7E1','ENEAE8E2','ENEAE8E1','VULAE8E1','ENEAE9','VULAE9'
                                    ,'IR','IRGI','IRPA','IRPAGI','IRPASI','IRSI','LRF','LRG','LRS'
									,'VLON10','VLON12','VLON14','VLAE15','VLON19','IR011','IR014'
									,'SVUL16', 'SVUL19')
     AND PCR.COMM_OPTION_CODE IN ('4','5','6','7','8','9','LEVL','SEMI')  
     and pcr.company_code = trm.company_code
     and pcr.policy_number = trm.policy_number
     and trm.trx_code in ('TA','TB','TL')
     AND TRM.REVERSAL_CODE NOT IN ('R','S');

insert into psitojxp.terms_init
select distinct pcr.policy_number from psitoQ0D.pcr pcr, psitoQ0D.polhist trm
      where 
     pcr.coverage_plan_code ='IR011'
     AND PCR.COMM_OPTION_CODE not IN ('4','5','6','7','8','9')    
     and pcr.company_code = trm.company_code
     and pcr.policy_number = trm.policy_number
     and trm.trx_code in ('TA','TB','TL')
     AND TRM.REVERSAL_CODE NOT IN ('R','S');
     
insert into psitojxp.terms_init
select distinct pcr.policy_number from psitoQ0D.pcr pcr, psitoQ0D.polhist trm
      where coveragE_plan_code in 
	 			('LEX3GNY','LEXC','LEXC2','LEXC2GI','LEXC4GNY','LEXC4NY','LEXCNY'
				,'LEXCSI','LEXG','LEXG2','LEXG2GI','LEXG2SI','LEXG2SMT','LEXG4NY'
				,'LEXGGI','LEXGNY','LEXGSI')
     and pcr.company_code = trm.company_code
     and pcr.policy_number = trm.policy_number
     and trm.trx_code in ('TA','TB','TL')
     AND TRM.REVERSAL_CODE NOT IN ('R','S');
insert into psitojxp.terms_init
select distinct pcr.policy_number from psitoQ0D.pcr pcr, psitoQ0D.polhist trm
      where coveragE_plan_code in 
	 			('E6HH','E6HHG','E6HHS','E6HV','E6HVG') 
	 and pcr.company_code = trm.company_code
     and pcr.policy_number = trm.policy_number
     and trm.trx_code in ('TA','TB','TL')
     AND TRM.REVERSAL_CODE NOT IN ('R','S');


