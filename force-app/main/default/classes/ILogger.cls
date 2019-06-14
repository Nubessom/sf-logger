public virtual interface ILogger{

    /**
    * @description debug log level
    */
    void debug(Exception ex, String source, String referenceId, String referenceInfo, String msg);
    void debug(Exception ex, String source, String msg);
    void debug(Exception ex, String ReferenceId, String ReferenceInfo, String msg);
    void debug(Exception ex, String msg);
    
    void debug(String source, String referenceId, String referenceInfo, String msg);
    void debug(String source, String msg);
    void debug(String ReferenceId, String ReferenceInfo, String msg);
    void debug(String msg);

    /**
    * @description info log level
    */
    void info(Exception ex, String source, String ReferenceId, String ReferenceInfo, String msg);
    void info(Exception ex, String source, String msg);
    void info(Exception ex, String ReferenceId, String ReferenceInfo, String msg);
    void info(Exception ex, String msg);
    
    void info(String source, String ReferenceId, String ReferenceInfo, String msg);
    void info(String source, String msg);
    void info(String ReferenceId, String ReferenceInfo, String msg);
    void info(String msg);
    	
    /**
    * @description warning log level
    */
    //User?Profile?RoleID
    //void warning();
    void warning(Exception ex, String source, String referenceId, String referenceInfo, String msg);
    void warning(Exception ex, String source, String msg);
    void warning(Exception ex, String ReferenceId, String ReferenceInfo, String msg);
    void warning(Exception ex, String msg);

    /**
    * @description error log level
    */
    void error(Exception ex, String source, String referenceId, String referenceInfo, String msg);
    void error(Exception ex, String source, String msg);
    void error(Exception ex, String ReferenceId, String ReferenceInfo, String msg);
    void error(Exception ex, String msg);
}