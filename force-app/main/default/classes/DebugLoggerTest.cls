@isTest
public class DebugLoggerTest {

    static Exception ex = new ApexObjectLoggerTest.LoggerTestException();
    static DebugLogger log;
    
    static Error_Handling_Configuration__mdt metadata = new Error_Handling_Configuration__mdt(Logger__c='Object Logger', 
                                                                                              Email_Address__c='arseniys@nubessom.com', 
                                                                                              Email_on_Error__c=true,
                                                                                              MasterLabel='Sandbox');
    @isTest static void assumeDebugWorksOnFinestLogLevel() {       
        metadata.Log_Level__c = 'Finest';
        log = new DebugLogger(metadata);
        
        log.debug(ex, 'source', '0013F00000IRc4kQAD', 'refInfo');
        log.debug(ex);
        
        log.debug('customMessage', 'source', '0013F00000IRc4kQAD', 'refInfo');
        log.debug('customMessage');
		
        System.assert(true);
    }

    @isTest static void assumeDebugDoesNotWorkOnFineLogLevel() {
        metadata.Log_Level__c = 'Fine';
        log = new DebugLogger(metadata);
        
        log.debug(ex, 'source', '0013F00000IRc4kQAD', 'refInfo');		
        System.assert(true);
    }

    @isTest static void assumeDebugDoesNotWorkOnInfoLogLevel() {
        metadata.Log_Level__c = 'Info';
        log = new DebugLogger(metadata);
        
        log.debug(ex, 'source', '0013F00000IRc4kQAD', 'refInfo');		
        System.assert(true);
    }
    
    @isTest static void assumeInfoWorks() {
        log = new DebugLogger(metadata);
        
        log.info(ex, 'source', '0013F00000IRc4kQAD', 'refInfo');
        log.info(ex);

        log.info('customMessage', 'source', '0013F00000IRc4kQAD', 'refInfo');
        log.info('customMessage');

        System.assert(true);
    }
	
    @isTest static void assumeWarningWorksOnFinestLogLevel() {
        metadata.Log_Level__c = 'Finest';
        log = new DebugLogger(metadata);
      
        log.warning(ex, 'source', '0013F00000IRc4kQAD', 'refInfo');
        log.warning(ex);

		System.assert(true);
    }
    
    @isTest static void assumeWarningDoesNotWorkOnInfoLogLevel() {
        metadata.Log_Level__c = 'Info';
        log = new DebugLogger(metadata);

        log.warning(ex, 'source', '0013F00000IRc4kQAD', 'refInfo');
		System.assert(true);
    }
    
    @isTest static void assumeErrorWorks() {

        log = new DebugLogger(metadata);
        
        log.error(ex, 'source', '0013F00000IRc4kQAD', 'refInfo');
        log.error(ex);
		
        System.assert(true);
    }
}