# sf-logger #

sf-logger is a tool for logging and debugging Apex classes. 
Easy to use, sf-logger is avaible in two different instances: *DebugLogger* (writes logs to Debug Logs of your salesforce org) and *ApexObjectLogger* (writes logs into fields of custom SObject). 

Swap logger instances and log levels at any time without need to change your code. Options are based on metadata configuration.
Receive notifications by email.



# Installation

<a href="https://githubsfdeploy.herokuapp.com">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>

# How to use

Get logger instance in the beginning of your class using LoggerFactory.cls, like that

```java
   private ILogger log = LoggerFactory.getInstance(); 
```

Add logger's method calls where you need them in code using corresponding log type and use parameters, based on what info you need to log. See ILogger.cls for parameters reference.

Example:

```java
    
...
} catch (Exception e) {
    log.error(e, "Finding students by group id has failed");
    throw new CustomException(e, "Finding students by group id has failed");
}
...

```
## Warning!
- ![#ff0000](https://placehold.it/12/ff0000?text=+) Do not use ApexObjectLogger calls in constructor. Salesforce doesn't allow DML inserts in constructor.


# Error Handling Configurations
You can setup Error Handling Configurations in your org in Custom Metadata Types section.

Examples: 

### Production
	Label: Production
	Error Handling Configuration Name: Production
	Log Level: Info - Info, Error
	Logger: Object Logger
	Email on Error: checked
	Email Address: user@example.com
	
Corresponded file - Error_Handling_Configuration.Production.md-meta.xml

### Sandbox
	Label: Sandbox
	Error Handling Configuration Name: Sandbox
	Log Level: Finest - Debug, Info, Warning, Error
	Logger: No Logs
	Email on Error: unchecked
	Email Address: user@example.com
	
Corresponded file - Error_Handling_Configuration.Sandbox.md-meta.xml

### Test
	Label: Test
	Error Handling Configuration Name: Test
	Log Level: Fine - Info, Warning, Error
	Logger: No Logs
	Email on Error: checked
	Email Address: user@example.com
	
Corresponded file - Error_Handling_Configuration.Test.md-meta.xml

# Classes

### ApexObjectLogger.cls ###

Logger that writes logs into Error_Logs__c custom SObject. Before inserting newly created Error_Logs__c, checks whether the current user has permissions to write to fields of Error_Logs__c.
***

### DebugLogger.cls ###

Logger that writes logs into Debug Logs in the org. 
***

### ILogger.cls ###

Interface on which all logger instances are based.

___Methods___

Each logger contains four types of methods, based on log type: debug, info, warning and error. 
Each method reloaded four times, based on parameters that need to be logged.

For example:

```java
void debug(Exception ex, String source, String referenceId, String referenceInfo);
void debug(Exception ex);

void debug(String customMessage, String source, String referenceId, String referenceInfo);
void debug(String customMessage);
```
***
### Logger.cls ###

Abstract class which all logger instances extend.

___Methods___

```java
public void sendEmail()
```
Sends email notifications to addresses selected in metadata configuration.

	
### LoggerFactory.cls ###

Class for creation instances of loggers.

___Methods___

```java
public static ILogger getInstance()
```
Returns new instance of logger based on metadata configuration. 
***

### NoLogLogger.cls ###

Logger that makes no logs. Used to disable logging.
***

# Objects ##

### Error_Handling_Configuration__mdt ###

Custom metadata that contains logger configuration. 


### Fields: 

__Email_Address__c__

    Type: email

    Contains email address where to send notifications.


__Email_on_Error__c__

    Type: checkbox

    Defines whether to send notification by email.


__Log_Level__c__

    Type: picklist

    Defines which log levels will be used: Info, Fine or Finest

Log Levels

    Info - only Info and Error log-types will be used.
    Fine - Info, Warning and Error log-types will be used.
    Finest - all log-types: Debug, Info, Warning, Error will be used.


Log Types

    Debug - information that can be helpful while debugging (which method is running, variables values, etc).
    Info - Generally useful information to log (service run/stop, configuration supposals, etc).
    Warning - Any places in code that can potentially cause application malfunction.
    Error - Critical events that requires developers attention.
    
__Logger__c__

    Type: picklist

    Defines which logger to use.
***

### Error_Logs__c

Object that contains log information.

 ### Fields:

__Exception_Stack_Trace__c__
    
    Type: Long Text Area(32768)
    
    Stack trace of the exception

__Exception_Type__c__
    
    Type: Text(255)
    
    Type of the exception

__Log_Type__c__
    
    Type: Picklist
    Debug, Info, Warning or Error

__Message__c__

    Type: Long Text Area(32768)
    
    Custom message

__ProfileId__c__

    Type: Text(255)
    
    Id of profile of the current user

__Reference_Id__c__

    Type: Text(18)
    
    The related record id

__Reference_Info__c__

    Type: Text(255)
    
    The related record info (e.g. Apex Batch Job Id, Contact etc)

__RoleId__c__

    Type: Text(255)

    Id of the current user's role.

__Source__c__

    Type: Text(255)
    
    Source related to the log, i.e. Class Name

__Username__c__
    
    Type: Text(255)
    
    Current user's name
