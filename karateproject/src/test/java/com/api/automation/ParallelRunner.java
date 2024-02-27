package com.api.automation;
import org.junit.jupiter.api.Test;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
 
public class ParallelRunner {	
	
    @Test	
    public void executeKarateTests() {	
//	Results results = Runner.path("classpath:com/api/automation").parallel(5);     
	 Results results = Runner.path("classpath:com/api/automation").tags("@smoke, @regression").parallel(5);     
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}