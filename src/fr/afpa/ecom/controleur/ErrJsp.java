package fr.afpa.ecom.controleur;

public class ErrJsp {
    private int errcode;
    private String errtype;
    private String errmsg;
    
    public int getErrcode() {
        return errcode;
    }
    public String getErrtype() {
        return errtype;
    }
    public String getErrmsg() {
        return errmsg;
    }
    public ErrJsp( int errcode, String errtype, String errmsg ) {
        super();
        this.errcode = errcode;
        this.errtype = errtype;
        this.errmsg = errmsg;
    }
    
    
}
