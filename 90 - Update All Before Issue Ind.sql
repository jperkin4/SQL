update PSITOJXP.all_before_current_channel
set issue1_1b_4_ind = 'Y'
  where policy_number in 
  (select policy_number from PSITOJXP.prems_init_iss11b4);
   
update PSITOJXP.all_before_current_channel
set issue2_ind = 'Y'
  where policy_number in 
  (select policy_number from PSITOJXP.prems_init_iss2);
   
update PSITOJXP.all_before_current_channel
set issue3_ind = 'Y'
  where policy_number in 
  (select pcr.policy_number 
     from psitoQ0D.pcr pcr, psitoQ0D.polhist trm
    where pcr.company_code = trm.company_code
     and pcr.policy_number = trm.policy_number
     and trm.trx_code in ('TA','TB','TL')
     AND TRM.REVERSAL_CODE NOT IN ('R','S')
     and
    ((coverage_plan_code in ('VULON7E1','SVLON7E1','ENEAE8E2','ENEAE8E1','VULAE8E1','ENEAE9','VULAE9'
                                         ,'IR','IRGI','IRPA','IRPAGI','IRPASI','IRSI','LRF','LRG','LRS'
     									,'VLON10','VLON12','VLON14','VLAE15','VLON19','IR011','IR014'
     									,'SVUL16', 'SVUL19')
     AND COMM_OPTION_CODE IN ('4','5','6','7','8','9','LEVL','SEMI')  
     )
     OR
     (coveragE_plan_code in 
     	 			('LEX3GNY','LEXC','LEXC2','LEXC2GI','LEXC4GNY','LEXC4NY','LEXCNY'
     				,'LEXCSI','LEXG','LEXG2','LEXG2GI','LEXG2SI','LEXG2SMT','LEXG4NY'
				,'LEXGGI','LEXGNY','LEXGSI',
				'E6HH','E6HHG','E6HHS','E6HV','E6HVG')
     )  ));
     
 update PSITOJXP.all_before_current_channel
set issue3b_ind = 'Y'
 where policy_number in (
select  pcr.policy_number from psitoz01.pcr pcr, psitoz01.polhist trm, psitoz01.agthist ah
    where pcr.coverage_plan_code ='IR011'
     AND PCR.COMM_OPTION_CODE not IN ('4','5','6','7','8','9')    
     and pcr.company_code = trm.company_code
     and pcr.policy_number = trm.policy_number
     and trm.trx_code in ('TA','TL')
     AND TRM.REVERSAL_CODE NOT IN ('R','S')
     and ah.company_code = 'JPF'
     and ah.policy_number = trm.policy_number
     and ah.policy_file_code = trm.file_code
	 and ah.amount_paid !=0 );