package com.api.automation.putrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestPut {

		
	@Test
				public Karate runFileValidation() {
				 	return Karate.run("updateJobEntry").relativeTo(getClass());
				 
			 }

}
