package com.jsh.erp.utils;

/**
 *
 */
public enum ErpInfo {
    //通过构造传递参数
    OK(200, "Thành công"),
    BAD_REQUEST(400, "Yêu cầu hoặc tham số xấu"),
    UNAUTHORIZED(401, "Người dùng không được xác thực"),
    INVALID_VERIFY_CODE(461, "Mã xác minh sai"),
    ERROR(500, "Lỗi dịch vụ nội bộ"),
    WARING_MSG(201, "Thông tin nhắc nhở"),
    REDIRECT(301, "session Vô hiệu, chuyển hướng"),
    FORWARD_REDIRECT(302, "Phiên yêu cầu chuyển tiếp không hợp lệ"),
    FORWARD_FAILED(303, "Yêu cầu chuyển tiếp không thành công!");

    public final int code;
    public final String name;

    public int getCode() {
        return code;
    }

    public String getName() {
        return name;
    }

    /**
     * 定义枚举构造函数
     */
    ErpInfo(int code, String name) {
        this.code = code;
        this.name = name;
    }
}
