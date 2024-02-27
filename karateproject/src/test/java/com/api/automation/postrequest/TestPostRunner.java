package com.api.automation.postrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestPostRunner {

		
	@Test
				public Karate runFileValidation() {
				 	return Karate.run("CreateJobEntry").relativeTo(getClass());
				//	return Karate.run("schemaValidation").relativeTo(getClass());
			 }

}
