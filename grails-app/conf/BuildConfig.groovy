import org.apache.ivy.plugins.resolver.FileSystemResolver
import org.apache.ivy.core.settings.IvySettings

grails.server.host="127.0.0.1"

grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir	= "target/test-reports"
grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits( "global" ) {
        // uncomment to disable ehcache
        // excludes 'ehcache'
    }
    log "warn" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    repositories {
		grailsRepo("http://83.169.2.186/grails-svn/plugins/", "myRepository")
        grailsCentral()
        grailsPlugins()
        grailsHome()

        // uncomment the below to enable remote dependency resolution
        // from public Maven repositories
        //mavenLocal()
        //mavenCentral()
        //mavenRepo "http://snapshots.repository.codehaus.org"
        //mavenRepo "http://repository.codehaus.org"
        //mavenRepo "http://download.java.net/maven/2/"
        //mavenRepo "http://repository.jboss.com/maven2/"

//		resolver(localResolver(basedir, getIvySettings()))
    }

	/*plugins {
		runtime "de.webmpuls:photo-album:0.2"
		runtime "de.webmpuls:pdf:0.4.8"
		runtime ":pdf:0.4.8"
	}*/

    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes eg.

        // runtime 'mysql:mysql-connector-java:5.1.5'

//		runtime 'oracle.jdbc:ojdbc14:10.1.0.5.0'
    }

	credentials {
		realm = "myRepository"
		host = "83.169.2.186"
		username = "markus"
		password = "kermit"
	}

	
}

// So heisst das WAR-File nachher
grails.project.war.file = "sv-leingarten.war"

// Plugin repository
grails.plugin.repos.discovery.myRepository="http://markus:kermit@83.169.2.186/grails-svn/plugins/"
grails.plugin.repos.distribution.myRepository="http://markus:kermit@83.169.2.186/grails-svn/plugins/"

grails.plugin.repos.resolveOrder=['myRepository', 'default', 'core'/*, 'myRepository'*/]


private FileSystemResolver localResolver(String folder, IvySettings ivySettings)
{
	FileSystemResolver fileSystemResolver = new FileSystemResolver()
	fileSystemResolver.setLocal(true)
	fileSystemResolver.setName('fileSystemResolver')
	fileSystemResolver.addArtifactPattern("D:/dropbox/My Dropbox/projekte/firmen/webmpuls/grails/lib/[artifact].[ext]")
	fileSystemResolver.setSettings(ivySettings)
	return fileSystemResolver
}