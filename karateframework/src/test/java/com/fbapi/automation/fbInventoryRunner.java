package com.fbapi.automation;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class fbInventoryRunner {

	@Test
	public Karate runTest()
	{
		return Karate.run("finventory").relativeTo(getClass());
	}
	
	
}
