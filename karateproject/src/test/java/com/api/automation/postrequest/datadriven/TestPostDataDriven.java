package com.api.automation.postrequest.datadriven;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestPostDataDriven {

		
	@Test
				public Karate runFileValidation() {
				 	return Karate.run("postDataDriven").relativeTo(getClass());
				 
			 }

}
