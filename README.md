# sf-logger
Salesforce logger
Apex Wrapper Salesforce Metadata API
====================================
 
<a href="https://githubsfdeploy.herokuapp.com?owner=financialforcedev&repo=apex-mdapi">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/src/main/webapp/resources/img/deploy.png">
</a>

1. Use case

2. Installation

3. Project structure
	3.1. Structure
	3.2 Content
		3.2.1. Classes
		3.2.2. Objects	



1. Use case

	sf-logger is a tool for logging and debugging Apex classes. 
	Easy to use, sf-logger is avaible in two different instances: DebugLogger (writes logs to Debug Logs of your salesforce org) and ApexObjectLogger (writes logs into fields of custom SObject). 

	Swap logger instances and log levels at any time without need to change your code. Options are based on metadata configuration.
	Receive notifications by email.



2. Installation
--


3. Project structure

3.1 Structure
--



3.2 Content

	3.2.1 Classes

	ApexObjectLogger.cls

		Logger that writes logs into Error_Logs__c custom SObject. Before inserting newly created Error_Logs__c, checks whether the current user has permissions to write to fields of Error_Logs__c.


	DebugLogger.cls

		Logger that writes logs into Debug Logs in the org. 


	ILogger.cls

		Interface on which all logger instances are based.

		Methods 
			Each logger contains 4 types of methods based on log type (debug, info, warning and error) and each method reloaded 8 times, based on number of parameters. 

			For example:

			    void debug(Exception ex, String source, Id referenceId, String referenceInfo, String msg);
			    void debug(Exception ex, String source, String msg);
			    void debug(Exception ex, Id ReferenceId, String ReferenceInfo, String msg);
			    void debug(Exception ex, String msg);
			    
			    void debug(String source, Id referenceId, String referenceInfo, String msg);
			    void debug(String source, String msg);
			    void debug(Id ReferenceId, String ReferenceInfo, String msg);
			    void debug(String msg);

	Logger.cls

		Abstract class with generic constructor and sendMail() method.

		Methods

			public void sendEmail()

			Sends email notifications to addresses selected in metadata configuration.

	
	LoggerFactory.cls

		Class for creation instances of loggers.

		Methods

			public static ILogger getInstance()

			Returns new instance of logger based on metadata configuration. 


	NoLogLogger.cls

		Logger that makes no logs. Used to disable logging.



	3.2.2 Objects

		Error_Handling_Configuration__mdt

			Custom metadata that contains logger configuration. 

			
			Fields

				Email_Address__c

					Type: email

					Contains email address where to send notifications.


				Email_on_Error__c

					Type: checkbox

					Defines whether to send notification by email.


				Log_Level__c

					Type: picklist

					Defines which log levels will be used: Info, Fine or Finest

						Log levels

							Info - only Info and Error log-types will be used.
							Fine - Info, Warning and Error log-types will be used.
							Finest - all log-types: Debug, Info, Warning, Error will be used.

						Log types

							Debug - information that can be helpful while debugging (which method is running, variables values, etc).
							Info - Generally useful information to log (service run/stop, configuration supposals, etc).
							Warning - Any places in code that can potentially cause application malfunction.
							Error - Critical events that requires developers attention.

				Logger__c

					Type: picklist

					Defines which logger to use.


		Error_Logs__c

			Object that contains log information.

				Fields:
					Exception_Stack_Trace__c,
					Exception_Type__c,
					Log_Type__c,
					Message__c,
					ProfileId__c,
				 	Reference_Id__c,
			 	 	Reference_Info__c,
			 	 	RoleId__c,
			 	 	Source__c,
			 	 	Username__c











