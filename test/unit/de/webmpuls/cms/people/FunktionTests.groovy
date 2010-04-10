package de.webmpuls.cms.people

import grails.test.*

class FunktionTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testCreate() {

		mockDomain(Funktion)

		Funktion testFunktion = new Funktion()

		testFunktion.code = "§%&@"

		// validate should fail
		assertFalse('validation should fail', testFunktion.validate())

		// because name must not be nullable
		assertEquals("nullable", testFunktion.errors.name)

		// because characters of code are not valid
		assertEquals("validator", testFunktion.errors.code)


		// save should fail
		assertFalse('save should fail', testFunktion.save() != null)

		// because save should fail, id has to be null
		assertEquals(null, testFunktion.id)
    }
}
