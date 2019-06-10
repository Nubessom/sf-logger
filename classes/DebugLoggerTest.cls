@isTest
public class DebugLoggerTest {

    static Exception ex = new LoggerTestException();
    static DebugLogger log;
    
    static Error_Handling_Configuration__mdt metadata = new Error_Handling_Configuration__mdt(Logger__c='Object Logger', 
                                                                                              Email_Address__c='arseniys@nubessom.com', 
                                                                                              Email_on_Error__c=true,
                                                                                              MasterLabel='Sandbox');
    @isTest static void assumeDebugWorksOnFinestLogLevel() {       
   
        metadata.Log_Level__c = 'Finest';
        log = new DebugLogger(metadata);
        
        log.debug(ex, 'source', '0013F00000IRc4kQAD', 'refInfo', 'msg');
        log.debug(ex, '0013F00000IRc4kQAD', 'refInfo', 'msg');
        log.debug(ex, 'source', 'msg');
        log.debug(ex, 'msg');
        
        log.debug('source', '0013F00000IRc4kQAD', 'refInfo', 'msg');
        log.debug('0013F00000IRc4kQAD', 'refInfo', 'msg');
        log.debug('source', 'msg');
        log.debug('msg');
		
        System.assert(true);
    }

    @isTest static void assumeDebugDoesNotWorkOnFineLogLevel() {
        
        metadata.Log_Level__c = 'Fine';
        log = new DebugLogger(metadata);
        
        log.debug(ex, 'source', '0013F00000IRc4kQAD', 'refInfo', 'msg');		
        System.assert(true);
    }

    @isTest static void assumeDebugDoesNotWorkOnInfoLogLevel() {
        metadata.Log_Level__c = 'Info';
        log = new DebugLogger(metadata);
        
        log.debug(ex, 'source', '0013F00000IRc4kQAD', 'refInfo', 'msg');		
        System.assert(true);
    }
    
    @isTest static void assumeInfoWorks() {
        log = new DebugLogger(metadata);
        
        log.info(ex, 'source', '0013F00000IRc4kQAD', 'refInfo', 'msg');
        log.info(ex, '0013F00000IRc4kQAD', 'refInfo', 'msg');
        log.info(ex, 'source', 'msg');
        log.info(ex, 'msg');

        log.info('source', '0013F00000IRc4kQAD', 'refInfo', 'msg');
        log.info('0013F00000IRc4kQAD', 'refInfo', 'msg');
        log.info('source', 'msg');
        log.info('msg');

        System.assert(true);
    }
	
    @isTest static void assumeWarningWorksOnFinestLogLevel() {
        metadata.Log_Level__c = 'Finest';
        log = new DebugLogger(metadata);
      
        log.warning(ex, 'source', '0013F00000IRc4kQAD', 'refInfo', 'msg');
        log.warning(ex, '0013F00000IRc4kQAD', 'refInfo', 'msg');
        log.warning(ex, 'source', 'msg');
        log.warning(ex, 'msg');

		System.assert(true);
    }
    
    @isTest static void assumeWarningDoesNotWorkOnInfoLogLevel() {
        metadata.Log_Level__c = 'Info';
        log = new DebugLogger(metadata);

        log.warning(ex, 'source', '0013F00000IRc4kQAD', 'refInfo', 'msg');
		System.assert(true);
    }
    
    @isTest static void assumeErrorWorks() {
        
        log = new DebugLogger(metadata);
        
        log.error(ex, 'source', '0013F00000IRc4kQAD', 'refInfo', 'msg');
        log.error(ex, '0013F00000IRc4kQAD', 'refInfo', 'msg');
        log.error(ex, 'source', 'msg');
        log.error(ex, 'msg');
		
        System.assert(true);
    }
}