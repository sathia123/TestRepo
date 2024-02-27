package com.api.automation.getrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestVariableRunner {
	
 
	 @Test
		public Karate runTestArray() {
			return Karate.run("Variables").relativeTo(getClass());
	 }

}
