package com.api.automation.deleterequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestPatchRunner {
	
	@Test
	public Karate runTest() {
		return Karate.run("deleteJobEntry").relativeTo(getClass());
	}
	
	
}