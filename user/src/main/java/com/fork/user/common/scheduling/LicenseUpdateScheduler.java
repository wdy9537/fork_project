package com.fork.user.common.scheduling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.fork.user.management.model.service.ManagementService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class LicenseUpdateScheduler {

    @Autowired
    private ManagementService mService;

    @Scheduled(cron = "0 0 0 * * *")
    public void updateLicense() {

        mService.updateLhStatus();

    }
}
