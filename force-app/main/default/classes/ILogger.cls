public virtual interface ILogger{

    /**
    * @description debug log level
    */
    void debug(Exception ex, String source, Id referenceId, String referenceInfo, String msg);
    void debug(Exception ex, String source, String msg);
    void debug(Exception ex, Id ReferenceId, String ReferenceInfo, String msg);
    void debug(Exception ex, String msg);
    
    void debug(String source, Id referenceId, String referenceInfo, String msg);
    void debug(String source, String msg);
    void debug(Id ReferenceId, String ReferenceInfo, String msg);
    void debug(String msg);

    /**
    * @description info log level
    */
    void info(Exception ex, String source, Id ReferenceId, String ReferenceInfo, String msg);
    void info(Exception ex, String source, String msg);
    void info(Exception ex, Id ReferenceId, String ReferenceInfo, String msg);
    void info(Exception ex, String msg);
    
    void info(String source, Id ReferenceId, String ReferenceInfo, String msg);
    void info(String source, String msg);
    void info(Id ReferenceId, String ReferenceInfo, String msg);
    void info(String msg);
    	
    /**
    * @description warning log level
    */
    //User?Profile?RoleID
    //void warning();
    void warning(Exception ex, String source, Id referenceId, String referenceInfo, String msg);
    void warning(Exception ex, String source, String msg);
    void warning(Exception ex, Id ReferenceId, String ReferenceInfo, String msg);
    void warning(Exception ex, String msg);

    /**
    * @description error log level
    */
    void error(Exception ex, String source, Id referenceId, String referenceInfo, String msg);
    void error(Exception ex, String source, String msg);
    void error(Exception ex, Id ReferenceId, String ReferenceInfo, String msg);
    void error(Exception ex, String msg);
}