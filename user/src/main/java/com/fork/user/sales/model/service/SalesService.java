package com.fork.user.sales.model.service;

import java.util.List;

import com.fork.user.sales.model.vo.Receipt;
import com.fork.user.sales.model.vo.Structure;
import com.fork.user.sales.model.vo.TotalMenuList;

public interface SalesService {

    List<Structure> selectStructureList();

    int deleteStructure();

    int saveStructure(List<Structure> strucList);

    List<Receipt> selectOrderList();

    List<TotalMenuList> detailOrderList(int kioskNo);

    int clearTable(int kioskNo);


}