@isTest
public class NoLogLoggerTest {
    
    static Error_Handling_Configuration__mdt metadata = new Error_Handling_Configuration__mdt(Logger__c='No Logs', 
                                                                                              Email_Address__c='arseniys@nubessom.com', 
                                                                                              Email_on_Error__c=true, 
                                                                                              MasterLabel='Sandbox');
    static Exception ex = new ApexObjectLoggerTest.LoggerTestException();
    static NoLogLogger log = new NoLogLogger(metadata);
    
    @isTest static void assumeDebugWorks() {
        
        log.debug(ex, 'test', '0013F00000IRc4kQAD', 'test', 'test');
        log.debug(ex, '0013F00000IRc4kQAD', 'test', 'test');
        log.debug(ex, 'test', 'test');
        log.debug(ex, 'test');
                    
        log.debug('test', '0013F00000IRc4kQAD', 'test', 'test');
        log.debug('0013F00000IRc4kQAD', 'test', 'test');
        log.debug('test', 'test');
        log.debug('test');

        System.assert(true);    
    }

    @isTest static void assumeInfoWorks() {
        
        log.info(ex, 'test', '0013F00000IRc4kQAD', 'test', 'test');
        log.info(ex, '0013F00000IRc4kQAD', 'test', 'test');
        log.info(ex, 'test', 'test');
        log.info(ex, 'test');

        log.info('test', '0013F00000IRc4kQAD', 'test', 'test');
        log.info('0013F00000IRc4kQAD', 'test', 'test');
        log.info('test', 'test');
        log.info('test');        
        
        System.assert(true);
    }

    @isTest static void assumeWarningWorks() {
        
        log.warning(ex, 'test', '0013F00000IRc4kQAD', 'test', 'test');
        log.warning(ex, '0013F00000IRc4kQAD', 'test', 'test');
        log.warning(ex, 'test', 'test');
        log.warning(ex, 'test');
        
        System.assert(true);
    }
    
    @isTest static void assumeErrorWorks() {
        
        log.error(ex, 'test', '0013F00000IRc4kQAD', 'test', 'test');
        log.error(ex, '0013F00000IRc4kQAD', 'test', 'test');
        log.error(ex, 'test', 'test');
        log.error(ex, 'test');
        
        System.assert(true);
    }   
}