package com.api.automation.getrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestGetRunner {
	
	//@Test
	public Karate runTest() {
		return Karate.run("getRequest").relativeTo(getClass());
		
	}
	
	//@Test
	public Karate runTestUsingClassPath() {
		return Karate.run("classpath:com/api/automation/getrequest/getRequest.feature");
		
	}
	

	// @Test
	public Karate runTestTag() {
		return Karate.run("classpath:com/api/automation/getrequest/getRequest.feature").tags("@debug").relativeTo(getClass());
		
	}
	// @Test
		public Karate runTestArray() {
			return Karate.run("validateJsonArray","validateXML").relativeTo(getClass());
	 }
		
	//@Test
				public Karate runFileValidation() {
					return Karate.run("ValidationUsingFile").relativeTo(getClass());
			 }
 //	@Test
	public Karate runJsonPath() {
		return Karate.run("jsonPathExpression").relativeTo(getClass());
 }
	
 	@Test
	public Karate runResponseMatcher() {
		return Karate.run("responseMatcher").relativeTo(getClass());
 }

}
