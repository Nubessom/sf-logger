global with sharing class NoLogLogger extends Logger {
    
    public NoLogLogger(Error_Handling_Configuration__mdt metadata) {
        super(metadata);
    }
      
    public void debug(Exception ex, String source, Id referenceId, String referenceInfo, String msg){}
    public void debug(Exception ex, Id referenceId, String referenceInfo, String msg){}
    public void debug(Exception ex, String source,String msg){}
    public void debug(Exception ex, String msg){}
  
    public void debug(String source, Id referenceId, String referenceInfo, String msg){}
    public void debug(Id referenceId, String referenceInfo, String msg){}
    public void debug(String source, String msg){}
    public void debug(String msg){}
    
    public void info(Exception ex, String source, Id referenceId, String referenceInfo, String msg){}
    public void info(Exception ex, Id referenceId, String referenceInfo, String msg){}
    public void info(Exception ex, String source,String msg){}
    public void info(Exception ex, String msg){}

    public void info(String source, Id referenceId, String referenceInfo, String msg){}
    public void info(Id referenceId, String referenceInfo, String msg){}
    public void info(String source,String msg){}
    public void info(String msg){}
    
    public void warning(Exception ex, String source, Id referenceId, String referenceInfo, String msg){}
    public void warning(Exception ex, Id referenceId, String referenceInfo, String msg){}
    public void warning(Exception ex, String source, String msg){}
    public void warning(Exception ex, String msg){}
    
    public void error(Exception ex, String source, Id referenceId, String referenceInfo, String msg){}
    public void error(Exception ex, String source,String msg){}
    public void error(Exception ex, Id referenceId, String referenceInfo, String msg){}
    public void error(Exception ex, String msg){}
}