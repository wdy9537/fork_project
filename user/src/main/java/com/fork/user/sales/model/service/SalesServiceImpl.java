package com.fork.user.sales.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fork.user.sales.model.dao.SalesDao;
import com.fork.user.sales.model.vo.Receipt;
import com.fork.user.sales.model.vo.Structure;
import com.fork.user.sales.model.vo.TotalMenuList;

@Service
public class SalesServiceImpl implements SalesService {
    
    @Autowired
    private SalesDao salesDao;

    @Override
    public List<Structure> selectStructureList() {
        return salesDao.selectStructureList();
    }

    @Override
    public int deleteStructure() {
        return salesDao.deleteStructure();
    }

    @Override
    public int saveStructure(List<Structure> strucList) {
        return salesDao.saveStructure(strucList);
    }

    @Override
    public List<Receipt> selectOrderList() {
        return salesDao.selectOrderList();
    }

    @Override
    public List<TotalMenuList> detailOrderList(int kioskNo) {
        return salesDao.detailOrderList(kioskNo);
    }

    @Override
    public int clearTable(int kioskNo) {
        return salesDao.clearTable(kioskNo);
    }



}