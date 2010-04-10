package de.webmpuls.cms.people

import grails.test.*

class PersonTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testCreate() {

		mockDomain(Person)

		Person testPerson = new Person()

		testPerson.email = "testATtest.de"
//		testPerson.vorname = "testvorname"
//		testPerson.nachname = "testnachname"
//		testPerson.strasse = "teststrasse"
//		testPerson.ort = "testort"
		testPerson.plz = "123456"

		// validate should fail
		assertFalse('validation should fail', testPerson.validate())

		// because email ist not a valid email
		assertEquals("email", testPerson.errors.email)

		// because plz size is greater than 5 
		assertEquals("maxSize", testPerson.errors.plz)

		// because properties must not be null
		assertEquals("nullable", testPerson.errors.vorname)
		assertEquals("nullable", testPerson.errors.nachname)
		assertEquals("nullable", testPerson.errors.strasse)
		assertEquals("nullable", testPerson.errors.ort)

		// save should fail
		assertFalse('save should fail', testPerson.save() != null)

		// because save should fail, id has to be null
		assertEquals(null, testPerson.id)
    }
}
