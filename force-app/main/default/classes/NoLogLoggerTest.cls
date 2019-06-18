@isTest
public class NoLogLoggerTest {
    
    static Error_Handling_Configuration__mdt metadata = new Error_Handling_Configuration__mdt(Logger__c='No Logs', 
                                                                                              Email_Address__c='arseniys@nubessom.com', 
                                                                                              Email_on_Error__c=true, 
                                                                                              MasterLabel='Sandbox');
    static Exception ex = new ApexObjectLoggerTest.LoggerTestException();
    static NoLogLogger log = new NoLogLogger(metadata);
    
    @isTest static void assumeDebugWorks() {
        
        log.debug(ex, 'source', '0013F00000IRc4kQAD', 'referenceInfo');
        log.debug(ex);
                    
        log.debug('customMessage', 'source', '0013F00000IRc4kQAD', 'referenceInfo');
        log.debug('customMessage');

        System.assert(true);    
    }

    @isTest static void assumeInfoWorks() {
        
        log.info(ex, 'source', '0013F00000IRc4kQAD', 'referenceInfo');
        log.info(ex);

        log.info('customMessage', 'source', '0013F00000IRc4kQAD', 'referenceInfo');
        log.info('customMessage');
        
        System.assert(true);
    }

    @isTest static void assumeWarningWorks() {
        
        log.warning(ex, 'source', '0013F00000IRc4kQAD', 'referenceInfo');
        log.warning(ex);
        
        System.assert(true);
    }
    
    @isTest static void assumeErrorWorks() {
        
        log.error(ex, 'source', '0013F00000IRc4kQAD', 'referenceInfo');
        log.error(ex);
        
        System.assert(true);
    }   
}