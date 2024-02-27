package com.api.automation;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

public class ParallelBuilder {

	@Test
	public void executeKarateTest() {
		Builder aRunner = new Builder();
		//aRunner.path("classpath:com/api/he automation");
		aRunner.path("classpath:com/api/automation/getrequest");
		 aRunner.parallel(5);
		 
		Results result = aRunner.parallel(5);
		System.out.println("Total Feature => " + result.getFeaturesTotal());
		System.out.println("Total feature failed => " + result.getFeaturesFailed());
		System.out.println("Total feature passed => " + result.getFeaturesPassed());
		System.out.println("Total Scenarios => " + result.getScenariosTotal());
		System.out.println("Total Scenarios passed => " + result.getScenariosPassed());
		System.out.println("Total Scenarios failed => " + result.getScenariosFailed());
		
										
		
		
		Assertions.assertEquals(0, result.getFailCount(), "There are Some Failed Scenarios ");
		
	}

}