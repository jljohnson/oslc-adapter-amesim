#OSLC AMESim Adapter



## Overview of RESTful web services 

| AMESim Concept  	| GET	| POST	| PUT	| 	DELETE	|
| ------------- 	| ------|-------|----	|------		|
| Component  		| X  	| X 	|  	| 		|
| Circuit  		| X 	| X	| 	| 		|
| Line  		| X 	| X	| X	| 		|
| Port  		| X 	| X	| 	| 		|
| Parameter  		| X 	| X	| X	| 		|
| Global Parameter  	| X 	| X	| X	| 		|






##Instructions to install and run OSLC AMESim Adapter (for AMESim v13, and v14)

Last updated by Axel Reichwein (axel.reichwein@koneksys.com) 				February 26, 2016
### 1.	Installing OSLC4J
Follow the [Instructions to install Eclipse Lyo](https://github.com/ld4mbse/oslc4j/edit/master/README.md). The document also contains instructions on how to use a proxy server with Maven and Eclipse. 


### 2.	Installing edu.gatech.mbsec.subversion.client 
Follow the [Instructions to install edu.gatech.mbsec.subversion.client](https://github.com/ld4mbse/subversion-client/blob/master/README.md). 


### 3.	Installing edu.gatech.mbsec.adapter.subversion 
Follow the [Instructions to install edu.gatech.mbsec.adapter.subversion](https://github.com/ld4mbse/oslc-adapter-subversion/blob/master/README.md). 


### 4.	Downloading edu.gatech.mbsec.adapter.amesim repository 

1.	Open the Git Repositories View (Window -> Show View -> type “Git Repositories” in the search field)
2.	Click on the Clone Repository icon  
3.	In the URI field, paste the following URL: https://github.com/ld4mbse/oslc-adapter-amesim.git 
4.	The Host and Repository fields will autofill. 
5.	Click Next, only select the master branch
6.	Click Next until Finish.


### 5.	Importing projects into the Eclipse workspace

1.	In the Git repositories view, right-click edu.gatech.mbsec.adapter.amesim and select “Import Projects”. Click Next until Finish
2.	The 3 projects are in the Eclipse workspace


### 6. Building the edu.gatech.mbsec.adapter.amesim projects

1.	In Eclipse, open the Project Explorer view. (Window → Show View → Project Explorer)
2.	Expand the edu.gatech.mbsec.adapter.amesim.ecore project
3.	Right click pom.xml -> Run As -> Maven clean
4.	Right click pom.xml -> Run As -> Maven install 
5.	Expand the edu.gatech.mbsec.adapter.amesim.resources project
6.	Right click pom.xml -> Run As -> Maven clean
7.	Right click pom.xml -> Run As -> Maven install 
8.	Expand the edu.gatech.mbsec.adapter.amesim  project
9.	Right click pom.xml -> Run As -> Maven clean
10.	Right click pom.xml -> Run As -> Maven install 

#####Troubleshooting

######Red error mark next to a project

1.	If there is a red error mark next to any project, select the project. Right-click->Maven->Update Project… and click OK 
2.	Make sure that the Eclipse projects displayed in the project explorer view do not contain any error icons displayed next to the project names as for example displayed below. 
3. Select the project and open its properties view (Project->right click->Properties). Under the Projects Facet tab, make sure that 1.8 is selected.
4. Select the project, right-click -> Properties. Select Java Compiler and select 1.8 in the drop down menu next to the JDK compliance setting as highlighted below.


### 7.	Manual configuration 

Specify the port number of the OSLC AMESim adapter service of in the config.properties file under edu.gatech.mbsec.adapter.amesim/configuration. By default, port 8282 will be used. As an example displayed below, the port number is set to 8282.

*Optional - only useful if you want to re-generate the OSLC4J-annotated Java classes*
*Specify the location of AMESim Ecore file in the config.properties file under edu.gatech.mbsec.adapter.amesim/configuration. The location of the AMESim ecore file named amesim.ecore is in the edu.gatech.mbsec.adapter.amesim.ecore project under /model/amesim.ecore. As an example displayed below, the location of the amesim.ecore file is specified to
 ```text
 C:/Users/…/git/oslc4jamesim/edu.gatech.mbsec.adapter.amesim.ecore /model/amesim.ecore
 ```
*Note: The file path can contain backslashes*
*Warning: Do not put quotes around the file path and add nothing at the end!*

**The OSLC AMESim adapter currently supports the retrieval of AMESim models** 
+ **within a specific local directory on the server**
+ **within a subversion  repository**
+ **from individuals files hosted on the same or on different subversion  repositories**

#### a. Retrieval of AMESim models from a local directory - "local mode"

Specify the location of the folder containing AMESim models which will be considered by the OSLC AMESim adapter in the config.properties file under edu.gatech.mbsec.adapter.amesim/configuration. As an example displayed below, the location of the folder containing AMESim models for the OSLC adapter is specified to
 ```text
C:/Users/…/git/oslc-adapter-amesim/edu.gatech.mbsec.adapter.amesim/amesimmodels/
```

**Warning**: the location of the folder containing AMESim models needs to refer to the **amesimmodels** folder contained in the edu.gatech.mbsec.adapter.amesim project as in the example above. This lack of flexibility is temporary. It is important that the folder be named **amesimmodels** and be located directly under the project. 


Several example AMESim models are located in the amesimmodels folder in the edu.gatech.mbsec.adapter.amesim project. 

Note: The file path can contain backslashes. 

Warning: Do not put quotes around the file path!

#### b. Retrieval of AMESim models from a subversion repository - "SVN Repository mode"

 1. Set the value of syncWithSvnRepo to true n the config.properties file under edu.gatech.mbsec.adapter.amesim/configuration
 2. Specify the Subversion repository URL containing AMESim models which will be considered by the OSLC AMESim adapter in the config.properties file under edu.gatech.mbsec.adapter.amesim/configuration. As an example displayed below, the Subversion repository URL  is specified to be 
 ```text
https://mysvnrepos.com/svn/amesimrepository
```
Warning: Do not put quotes around the file path!
 3. Set the time period in seconds at which the adapter will poll the Subversion repository for updates. Example:  
 ```text
delayInSecondsBetweenDataRefresh = none
``` 
or
 ```text
delayInSecondsBetweenDataRefresh = 90
```
 4. Specify your Subversion credentials through the svnUserName and svnPassword fields
 5. Specify the location of the folder containing AMESim models where the Subversion files will be saved locally in config.properties file under edu.gatech.mbsec.adapter.amesim/configuration. As an example displayed below, the location of the folder containing AMESim models for the OSLC adapter is specified to 
 ```text
C:/Users/…/git/oslc-adapter-amesim/edu.gatech.mbsec.adapter.amesim/amesimmodels/
```

**Warning**: the location of the folder containing AMESim models needs to refer to the **amesimmodels** folder contained in the edu.gatech.mbsec.adapter.amesim project as in the example above. This lack of flexibility is temporary. It is important that the folder be named **amesimmodels** and be located directly under the project.

#### c.	Retrieval of AMESim models from individual Subversion-hosted files - “Individual SVN files mode”

1. Set the value of useIndividualSubversionFiles to true
2.	Specify the Subversion file URLs representing AMESim models which will be published by the adapter at startup in the subversionfiles.csv file under edu.gatech.mbsec.adapter.amesim/configuration. As an example displayed below, the Subversion file URLs  are specified to be
 ```text
https://koneksys1:18080/svn/repository1/FlatTwin.ame
https://koneksys1:18080/svn/repository1/FlatTwin3.ame
``` 
3.	During adapter runtime, you can change the Subversion files to be published through the web app at [http://localhost:8080/oslc4jamesim/services/svnfilepublisher](http://localhost:8080/oslc4jamesim/services/svnfilepublisher)
Note: the port number may differ from 8080 if specified differently in thr config.properties file
By clicking on Publish, the adapter will retrieve the latest version of the Subversion files and publish them 
4.	Specify your Subversion credentials through the svnUserName and svnPassword fields
5.	Specify the location of the folder containing AMESim models where the Subversion files will be saved locally in config.properties file under edu.gatech.mbsec.adapter.amesim/configuration. As an example displayed below, the location of the folder containing AMESim models for the OSLC adapter is specified to 
 ```text
C:/Users/…/git/oslc4jamesim/edu.gatech.mbsec.adapter.amesim/localworkingdirs
``` 
Note: The contents of this folder will be deleted when the adapter starts in individualSubversionFile mode.  
Warning: Do not choose as local Subversion file storage the same folder as the one containing all sample AMESim models, nor the one containing the local AMESim models models without Subversion info.  
 

### 8. Checking active Python interpreter
Make sure that you have already installed AMESim. A Python interpreter is typically installed together with AMESim. You can check if you have already installed Python on your Windows machine by typing ”python -V” in the command prompt window. Launch the command prompt by clicking on Start->All Programs-> Accessories-> Command Prompt. You may have multiple Python interpreters installed on your computer. You can check your active Python interpreter on your Windows machine by typing ”which python” in the command prompt window. It should refer to the Python interpreter provided by AMESim. 
 
Note: if your active Python interpreter is different than the one provided by AMEsim:

- run the python.bat file located in your AMESim installation folder
- set the PATH environment variable such that it first refers to the python distribution of AMESim before any other Pyhton distribution
- set the PYTHONHOME environment variable to point to the python distribution of AMESim
 

### 9. Installing Apache Tomcat

*Optional: This step is only necessary if you want to use a specific Tomcat instance instead of the Tomcat instance embedded in Eclipse and downloaded by the Maven Tomcat plugin. This step is only necessary if you want:*
- *to deploy the AMESim adapter on a specific Tomcat instance (possibly with specific configurations)*
- *to deploy the AMESim adapter such that it accepts HTTP PUT requests, necessary for updating AMESim parameters*

#### Configuring Apache Tomcat

1.	Download Tomcat 8 by going to this page:
https://tomcat.apache.org/download-80.cgi 
2.	Download the zip distribution for your operating system. Note: do not use the windows installer as it doesn’t install all Tomcat scripts. 
3.	Unzip the Tomcat 8 distribution in a folder where your user account has read/write permission. Note: Windows disables direct file access to programs folder for normal users per default. 
4.	Make sure that the /bin folder in your Tomcat installation directory contains the catalina.bat batch file 
5.	Make sure that you have JDK 8 installed on your machine. OSLC Adapters are now currently being build with Java 8 compilers. So Tomcat should also run with Java 8. 
6.	On Windows, verify your installed Java version by typing in the command prompt java –version
7.	Test that environment variables **JAVA_HOME** and **PATH** respectively point to JDK and JDK/bin. Verify this on Windows by typing in the command prompt echo %JAVA_HOME% and echo %PATH%. If necessary set the envornoment variable in the command prompt using the set command (Example: set variable=string). After having set the environment variables, open a  new ommand prompt to verify the values of the environment variables.
8.	Make sure that JAVA_HOME and JRE_HOME both point to the same Java version, for example Java 8. 
9.	Make sure that CATALINA_HOME points to the correct installation directory of your Tomcat distribution. 
10.	Adding Server Runtime Environment in Eclipse
11.	In Eclipse. Open Window -> Preferences -> Server -> Runtime Environments to create a Tomcat installed runtime.
12.	Click on Add... to open the New Server Runtime dialog, 
13.	From the drop down menu, select Tomcat 8.0 as shown below. Click Next.
14.	Enter the Tomcat 8.0 installation directory (not the Apache installation directory!) as highlighted below.
15.	Click on Finish.

#### Enabling PUT on Apache Tomcat

Tomcat by default is not enabled for HTTP PUT command. But, it can easily be configured to support it.
1.	In your Apache Tomcat 8 installation directory, open /conf/web.xml
2.	Add the readonly init param to the web.xml file as shown below and save the file
 ```text
        <init-param>
            		<param-name>readonly</param-name>
            		<param-value>false</param-value>
        </init-param>
```
Note: If you get the warning shown below while trying to save the file, then copy the web.xml file into another location, modify it, and then replace the original web.xml file by the modified web.xml file.
 

#### Setting the Apache Tomcat server port 

1.	By default, the OSLC AMESim adapter service will run on port 8282. Change the port of the oslc4jamesim service only if you need to avoid a conflict with another service already running on port 8282. Skip the next steps if you do not need to change the port. 
2.	In Eclipse, open the Project Explorer view. (Window → Show View → Project Explorer)
3.	Expand the edu.gatech.mbsec.adapter.amesim project
4.	Select and open the maven pom.xml file through double-click
5.	The pom.xml file contains several tabs. By default, the overview tab will be displayed. The various available tabs are displayed at the bottom of the editor window. Click on the pom.xml tab of the pom.xml.
6.	In the pom.xml tab of the pom.xml file, specify the port of the OSLC AMESim adapter service in the Maven tomcat plugin configuration found at the bottom of the pom.xml tab of the pom.xml file. Enter the port number in the configuration section.

####	Configuring Tomcat user roles and passwords (only useful for deploying adapter as war on standalone Tomcat)

In the /conf folder of the Tomcat installation directory, add in tomcat-users.xml inside the <tomcat-users> tag the following user tag
```xml
 <user username="admin" password="admin" roles="admin-gui,manager-gui,manager-script" />
```
Note: Manager-script role is necessary to enable Maven deploy 
  
####	Copying adapter configuration properties (only useful for deploying adapter as war on standalone Tomcat)
1.	In Eclipse, open the Project Explorer view. (Window → Show View → Project Explorer)
2.	Expand the edu.gatech.mbsec.adapter.amesim project
3.	Copy the folder named oslc4jamesim configuration
4.	Paste the folder in the Tomcat installation directory (Example: C:\Program Files\apache-tomcat-8.0.24-windows-x64\apache-tomcat-8.0.24/oslc4jamesim  configuration)

####	Maven configuration properties (only useful for deploying adapter as war on standalone Tomcat) 

In the maven user/.m2/ (Example: C:\Users\Axel\.m2) folder, add in settings.xml the following
```xml
<?xml version="1.0" encoding="UTF-8"?>
<settings>
	<servers>
		<server>
		<id>tomcat7</id>
		<username>admin</username>
		<password>admin</password>
		</server>
	</servers>
</settings>
```
Note: you can still use Tomcat 8 with the Tomcat 7 Maven plugin even though it only officially supports Tomcat 7. There is no Tomcat Maven plugin for Tomcat 8 at this point. 


### 10.	Installing the Chrome/Firefox Postman plugin (or any REST client)

*Optional - only useful if you want to use this REST client*

1.	*For Google Chrome, add the [Postman REST client](https://chrome.google.com/webstore/detail/postman-rest-client/fdmmgilgnpjigdojojpjoooidkmcomcm?hl=en) to your browser* 
2.	*And the [Postman launcher](https://chrome.google.com/webstore/detail/postman-launcher/igofndmniooofoabmmpfonmdnhgchoka?hl=en)*


### 11.	Launching the OSLC AMESim Adapter

There are several options

1. Deploying OSLC AMESim adapter on Tomcat server embedded in Eclipse launched through Maven
2. Deploying OSLC AMESim adapter on standalone Tomcat server manually
3. Deploying OSLC AMESim adapter on standalone Tomcat server automatically from Eclipse
4. Deploying OSLC AMESim adapter on standalone Tomcat server automatically from Eclipse in debug mode

##### *Optional: Launching Tomcat server manually*
*For options except 2) and 3), you need to launch the Tomcat server manually*

1. *Open a command prompt*
2. *Change the directory of the command prompt to the/bin folder of the Tomcat installation directory using the cd command (Example:  cd C:\Program Files\apache-tomcat-8.0.24-windows-x64\apache-tomcat-8.0.24\bin)*
3. Launch Tomcat by running the following command: **catalina start** 

*For all options except 1), if you wish to stop the Tomcat server*

1. *Open a command prompt*
2. *Change the directory of the command prompt to the/bin folder of the Tomcat installation directory using the cd command* 
3. *Stop Tomcat by running the following command: shutdown –force. Note: It is important to avoid a memory problem by using shutdown –force, else the OSLC AMESim adapter can cause a memory leak*


#### Option #1: Deploying OSLC AMESim adapter on Tomcat server embedded in Eclipse launched through Maven
Select the oslc4jamesim launch configuration (Run -> Run Configurations… and select in the Maven build category the launch configuration named **oslc4jamesim-wink tomcat run** and click Run. In the console window, several logging related exceptions will appear (SLF4J and log4j). This is not critical.

Warning: If the OSLC AMESim adapter service fails to launch due to a java.net.BindException, a different port for the OSLC AMESim adapter needs to be used since there is a conflict with another service using the same port. By default, the OSLC AMESim adapter uses port 8282. A java.net.BindException means that a different service is already using this port. Go back to Steps #5 and #10 to change the port number.

Note: In order to stop a running oslc4jamesim web application, click Terminate in the Console window, or in the toolbar of the debug perspective.

Note: If you launch the Maven launch configuration (OSLC AMESim adapter) in debug mode, and do not see the Java code when the application hits a breakpoint, then you need to add the Eclipse workspace to the source lookup path. In the Debug view, right click on the running thread (in threads tab), or on the application as shown below and select Edit Source Lookup, and add the workspace. Re-launch the Maven launch configuration and the code should be visible in the editor when the application hits a breakpoint. 



#### Option #2: Deploying OSLC AMESim adapter on standalone Tomcat server manually
1. Option 1)
	1. In Eclipse, open the Project Explorer view. (Window → Show View → Project Explorer)
	2. Expand the edu.gatech.mbsec.adapter.amesim project
	3. Open the /target folder 
	4. rename the oslc4jamesim-1.1.0.war file into oslc4jamesim.war 
	5. copy oslc4jamesim.war into the /webapps folder of the of the Tomcat installation directory
2. Option 2)
	1. In your browser go to localhost:8080
	2. Click on Manager App
	3. If asked for your credentials, type in admin as user name and password
	4. In the Deploy section, select the WAR file to upload using the dialog shown below.

#### Option #3: Deploying OSLC AMESim adapter on standalone Tomcat server automatically from Eclipse
Run the Maven launch configuration named **oslc4jamesim wink - tomcat deploy**

#### Option #4: Deploying OSLC AMESim adapter on standalone Tomcat server automatically from Eclipse in debug mode

1. In the startup.bat script under {TOMCAT_INSTALL_DIR}/bin, add following lines to the beginning as shown below 
```text
set JPDA_ADDRESS=8000
set JPDA_TRANSPORT=dt_socket
setlocal
```
2. Open a command prompt to launch the Tomcat server 
3. Change the directory of the command prompt to the/bin folder of the Tomcat installation directory using the cd command (Example:  cd C:\Program Files\apache-tomcat-8.0.24-windows-x64\apache-tomcat-8.0.24\bin)
4. Launch Tomcat by running the following command: **catalina jpda start**
5. Set breakpoints in your code if necessary
6. First launch the remote java application named **remote debugger oslc4jamesim on tomcat** by choosing in Eclipse Debug-> Debug Configurations… , and then run the remote java application
7. And then run the Maven launch configuration named **oslc4jamesim wink - tomcat deploy**


### 12.	Testing the OSLC AMESim Adapter

#### Testing the retrieval of OSLC resources in HTML

1. Launch your web browser Google Chrome
2. In the URL field, type for test purposes: [http://localhost:8282/oslc4jamesim/services/catalog/singleton](http://localhost:8282/oslc4jamesim/services/catalog/singleton). This will send a HTTP GET request to retrieve the HTML representation of the AMESim Service Provider Catalog. This will launch a Python script.
3. You will then see an HTML page showing you the list of Service Providers. You can browse from the Service Providers (e.g. for FlatTwin) to the Services and ultimately to the OSLC AMESim resources.


#### Testing the retrieval of OSLC resources in RDF

1. Click on the Postman icon at the top right of the Chrome browser . A new tab will open. 
2. In the URL field, type for test purposes the URI of a resource published by the AMESim adapter (Example: http://localhost:8282/oslc4jamesim/services/FlatTwin/components/Constant). 
3. Click on the Headers field to the right of the URL field
4. Enter Accept in the Header field and application/rdf+xml in the value field as shown below
5. Click Send
6. This will send a HTTP GET request to retrieve the RDF/XML representation of the AMESim block.

The edu.gatech.mbsec.adapter.amesim project contains example AMESim models containing different types of AMESim elements. The example models are located in the folder [amesimmodels](/org.eclipse.lyo.adapter.amesim/amesimmodels) such as  [FlatTwin](org.eclipse.lyo.adapter.amesim/amesimmodels/FlatTwin.ame) 
 
#### Testing the retrieval of Subversion File Metadata resources in HTML and RDF (only available in "SVN Repository mode" and "Individual SVN files mode")
URL: http://localhost:8282/oslc4jamesim/services/subversionfiles/
 
#### Testing the selection of Subversion Files hosted by AMESim adapter in HTML and RDF (only available in "Individual SVN files mode")
URL: http://localhost:8282/oslc4jamesim/services/svnfilepublisher

#### Testing the retrieval of AMESim Resource Shapes hosted by the AMESim adapter in HTML and RDF
URL: http://localhost:8282/oslc4jamesim/services/resourceShapes

#### Testing the retrieval of AMESim RDF vocabulary hosted by the AMESim adapter in HTML and RDF
URL: http://localhost:8282/oslc4jamesim/services/rdfvocabulary

