package com.fork.kiosk.main.model.vo;

import java.util.List;

import lombok.Data;

@Data
public class Receipt{
    private int receiptNo;
    private int payNo;
    private int trNo;
    
    private Pay pay;
    
    List<ReceiptMenu> rmList;
}