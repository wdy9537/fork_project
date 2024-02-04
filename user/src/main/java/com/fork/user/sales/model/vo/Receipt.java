package com.fork.user.sales.model.vo;

import lombok.Data;

@Data
public class Receipt {
    private String menuName;
    private int cnt;
    private int price;
    private int kioskNo;
}