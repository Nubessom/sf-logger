public class LoggerFactory {

    public static ILogger getInstance() {
        String configType;
        
        if ([SELECT Id, isSandbox FROM Organization LIMIT 1].isSandbox) {
            configType = 'Sandbox';
        } else {
            configType = 'Production';
        }
        
        if (Test.isRunningTest()) {
            configType = 'Test';
        }
        
        Error_Handling_Configuration__mdt metadata = [SELECT Logger__c, 
                                                             Email_Address__c, 
                                                             Email_on_Error__c, 
                                                             Log_Level__c, 
                                                             MasterLabel 
                                                      FROM Error_Handling_Configuration__mdt WHERE MasterLabel =: configType];
        
        if (metadata.Logger__c == 'Object Logger') {
            return new ApexObjectLogger(metadata);
        } else if (metadata.Logger__c == 'Debug Logger') {
            return new DebugLogger(metadata);
        }

        return new NoLogLogger(metadata);
    }
}