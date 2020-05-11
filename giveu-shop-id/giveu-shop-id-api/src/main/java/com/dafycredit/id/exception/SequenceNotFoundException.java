package com.dafycredit.id.exception;


/** 
* @ClassName: SequenceNotFoundException 
* @Description: 序列没有找到 
* @author zhouqian@dafycredit.com
* @date 2017年4月20日 下午2:56:09 
*  
*/
public class SequenceNotFoundException extends RuntimeException {

    private static final long serialVersionUID = 8202389462734865197L;

    private int code = 0;

    public SequenceNotFoundException() {
        super();
    }

    public SequenceNotFoundException(String message, Throwable cause) {
        super(message, cause);
    }

    public SequenceNotFoundException(String message) {
        super(message);
    }

    public SequenceNotFoundException(Throwable cause) {
        super(cause);
    }

    public SequenceNotFoundException(int code, String message, Throwable cause) {
        super(message, cause);
        this.code = code;
    }

    public SequenceNotFoundException(int code, String message) {
        super(message);
        this.code = code;
    }

    public SequenceNotFoundException(int code, Throwable cause) {
        super(cause);
        this.code = code;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

}