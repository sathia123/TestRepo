package com.api.automation;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

public class ParallelBuilderWithCucumberReport {
	
	@Test
	public void executeKarateTest() {
		Builder aRunner = new Builder();
		//aRunner.path("classpath:com/api/automation/getrequest");
		aRunner.path("classpath:com/api/automation/deleterequest").outputCucumberJson(true);
		// aRunner.parallel(5);
		Results result = aRunner.parallel(5);
		System.out.println("Total Feature => " + result.getFeaturesTotal());
		System.out.println("Total feature failed => " + result.getFeaturesFailed());
		System.out.println("Total feature passed => " + result.getFeaturesPassed());
		System.out.println("Total Scenarios => " + result.getScenariosTotal());
		System.out.println("Total Scenarios passed => " + result.getScenariosPassed());
		System.out.println("Total Scenarios failed => " + result.getScenariosFailed());
		generateReport(result.getReportDir());
		Assertions.assertEquals(0, result.getFailCount(), "There are Some Failed Scenarios ");
		
	}
	
	public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "deleterequest");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
    
}