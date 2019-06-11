# sf-logger #

sf-logger is a tool for logging and debugging Apex classes. 
Easy to use, sf-logger is avaible in two different instances: DebugLogger (writes logs to Debug Logs of your salesforce org) and ApexObjectLogger (writes logs into fields of custom SObject). 

Swap logger instances and log levels at any time without need to change your code. Options are based on metadata configuration.
Receive notifications by email.



# Installation

<a href="https://githubsfdeploy.herokuapp.com">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/src/main/webapp/resources/img/deploy.png">
</a>

# How to use

Get logger instance in the beginning of your class using LoggerFactory.cls, like that

```java
   private ILogger log = LoggerFactory.getInstance(); 
```

Add logger's method calls where you need it in code using corresponding log type and use parameters based on what info you need to log. See ILogger.cls for parameters reference.

Example:

```java
    
...
} catch (Exception e) {
    log.error(e, "Finding students by group id has failed");
    throw new CustomException(e, "Finding students by group id has failed");
}
...

```

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
Each method reloaded eight times, based on parameters that need to be logged.

For example:

```java
void debug(Exception ex, String source, Id referenceId, String referenceInfo, String msg);
void debug(Exception ex, String source, String msg);
void debug(Exception ex, Id ReferenceId, String ReferenceInfo, String msg);
void debug(Exception ex, String msg);

void debug(String source, Id referenceId, String referenceInfo, String msg);
void debug(String source, String msg);
void debug(Id ReferenceId, String ReferenceInfo, String msg);
void debug(String msg);
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

### Methods ###

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
    

__Reference_Info__c__

    Type: Text(255)

__RoleId__c__

    Type: Text(255)

    Id of the current user's role.

__Source__c__

    Type: Text(255)
    
    Source

__Username__c__
    
    Type: Text(255)
    
    Current user's name











