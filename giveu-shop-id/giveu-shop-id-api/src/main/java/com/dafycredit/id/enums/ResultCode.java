package com.dafycredit.id.enums;

/**
 * id错误码，70代表id系统
 * 
 */
public enum ResultCode {
    
    // 基本错误码
    ILLEGAL_ARGS_ERR(-9999, "Illegal args error."),
    NO_ROWS_AFFECTED(-10000, "Database DML SQL no row affected."),
    
    //ID调用相关异常--服务调用异常 (700101-700199)
    SERVICE_INVOKE_SINGLEID_FAILED(700101,"生成单个id异常"),
    SERVICE_INVOKE_BATCHID_FAILED(700102,"生成批量id异常"),
    
    SERVICE_INVOKE_SINGLEID_OVERTIME(700103,"生成单个id超时"),
    SERVICE_INVOKE_BATCHID_OVERTIME(700104,"生成批量id超时"),
    ;

    private int code;

    private String msg;

    private ResultCode(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

}