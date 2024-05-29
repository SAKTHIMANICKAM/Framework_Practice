package com.api.automation.getrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestGetRunner {

	@Test
	public Karate runTest()
	{
		return Karate.run("getrequest").relativeTo(getClass());
	}
	
	/*
	 * @Test public Karate runTestUsingClassPath() { return
	 * Karate.run("classpath:com/api/automation/getrequest/getrequest.feature"); }
	 */
}

// - we have two ways to invoke our test method below is the 1st method.
//- Get class - Define in the object class.
//- Also use to identify where the feature file is located and it will invoke it.