@isTest
public class ApexObjectLoggerTest {

    public class LoggerTestException extends Exception {}

    static Error_Handling_Configuration__mdt metadata = new Error_Handling_Configuration__mdt(Logger__c='Object Logger', 
                                                                                              Email_Address__c='arseniys@nubessom.com', 
                                                                                              Email_on_Error__c=true,
                                                                                              MasterLabel='Sandbox');
    static ApexObjectLogger log;
    static Exception ex = new LoggerTestException();
        
    @isTest static void debugShouldWorkOnFinestLogLevel() {       
        metadata.Log_Level__c = 'Finest';
        log = new ApexObjectLogger(metadata);
        
        Test.startTest();
        log.debug(ex, 'source', '0013F00000IRc4kQAD', 'referenceInfo');
        log.debug(ex);
        
        log.debug('customMessage', 'source', '0013F00000IRc4kQAD', 'referenceInfo');
        log.debug('customMessage');

        List<Error_Logs__c> errorLogs = [SELECT Log_Type__c, 
                                                Source__c
                                         FROM Error_Logs__c 
                                         WHERE Log_Type__c = 'debug'];
                                          
        System.assertEquals(4, errorLogs.size());
        delete errorLogs;
        Test.stopTest();		        
    }

    @isTest static void debugShouldNotWorkOnFineLogLevel() {
        metadata.Log_Level__c = 'Fine';
        log = new ApexObjectLogger(metadata);
        
        Test.startTest();
        log.debug(ex, 'source', '0013F00000IRc4kQAD', 'referenceInfo');

        List<Error_Logs__c> errorLogs = [SELECT Log_Type__c, 
                                                Source__c
                                         FROM Error_Logs__c 
                                         WHERE Log_Type__c = 'debug'];

        System.assertEquals(0, errorLogs.size());
        delete errorLogs;
        Test.stopTest();		        
    }

    @isTest static void debugShouldNotWorkOnInfoLogLevel() {
        metadata.Log_Level__c = 'Info';
        log = new ApexObjectLogger(metadata);
        
        Test.startTest();
        log.debug(ex, 'source', '0013F00000IRc4kQAD', 'referenceInfo');

        List<Error_Logs__c> errorLogs = [SELECT Log_Type__c,
                                                Source__c 
                                         FROM Error_Logs__c 
                                         WHERE Log_Type__c = 'debug'];

        System.assertEquals(0, errorLogs.size());
        delete errorLogs;
        Test.stopTest();		        
    }
    
    @isTest static void infoShouldWork() {
        log = new ApexObjectLogger(metadata);
        
        Test.startTest();
        log.info(ex, 'source', '0013F00000IRc4kQAD', 'referenceInfo');
        log.info(ex);

        log.info('customMessage', 'source', '0013F00000IRc4kQAD', 'referenceInfo');
        log.info('customMessage');

        List<Error_Logs__c> errorLogs = [SELECT Log_Type__c, 
                                                Source__c 
                                         FROM Error_Logs__c 
                                         WHERE Log_Type__c = 'info'];
        
        System.assertEquals(4, errorLogs.size());
        delete errorLogs;
        Test.stopTest();		        
    }
    
    @isTest static void warningShouldWorkOnFinestLogLevel() {
        metadata.Log_Level__c = 'Finest';
        log = new ApexObjectLogger(metadata);

        Test.startTest();
        log.warning(ex, 'source', '0013F00000IRc4kQAD', 'referenceInfo');
        log.warning(ex);

        List<Error_Logs__c> errorLogs = [SELECT Log_Type__c, 
                                                Source__c 
                                         FROM Error_Logs__c 
                                         WHERE Log_Type__c = 'warning'];

        System.assertEquals(2, errorLogs.size());
        delete errorLogs;
        Test.stopTest();		        
    }
    
    @isTest static void warningShouldNotWorkOnInfoLogLevel() {
        metadata.Log_Level__c = 'Info';
        log = new ApexObjectLogger(metadata);

        Test.startTest();
        log.warning(ex, 'source', '0013F00000IRc4kQAD', 'referenceInfo');

        List<Error_Logs__c> errorLogs = [SELECT Log_Type__c, 
                                                Source__c 
                                         FROM Error_Logs__c 
                                         WHERE Log_Type__c = 'warning'];

        System.assertEquals(0, errorLogs.size());
        delete errorLogs;
        Test.stopTest();		        
    }
    
    @isTest static void errorShouldWork() {
        log = new ApexObjectLogger(metadata);

        Test.startTest();
        log.error(ex, 'source', '0013F00000IRc4kQAD', 'referenceInfo');
        log.error(ex);

        List<Error_Logs__c> errorLogs = [SELECT Log_Type__c, 
                                                Source__c 
                                         FROM Error_Logs__c 
                                         WHERE Log_Type__c = 'error'];
      
        System.assertEquals(2, errorLogs.size());
        delete errorLogs;        
        Test.stopTest();		        
    }
}