package net.wanho.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class AppVersion implements Serializable {

    private Long id;
    private Long appId;
    private String versionNo;
    private String versionInfo;
    private Long publishStatus;
    private String downloadLink;
    private BigDecimal versionSize;
    private Long createdBy;
    private Date creationDate;
    private Long modifyBy;
    private Date modifyDate;
    private String apklocPath;
    private String apkFilename;

    private AppInfo appInfo;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getAppId() {
        return appId;
    }

    public void setAppId(Long appId) {
        this.appId = appId;
    }

    public String getVersionNo() {
        return versionNo;
    }

    public void setVersionNo(String versionNo) {
        this.versionNo = versionNo;
    }

    public String getVersionInfo() {
        return versionInfo;
    }

    public void setVersionInfo(String versionInfo) {
        this.versionInfo = versionInfo;
    }

    public Long getPublishStatus() {
        return publishStatus;
    }

    public void setPublishStatus(Long publishStatus) {
        this.publishStatus = publishStatus;
    }

    public String getDownloadLink() {
        return downloadLink;
    }

    public void setDownloadLink(String downloadLink) {
        this.downloadLink = downloadLink;
    }

    public BigDecimal getVersionSize() {
        return versionSize;
    }

    public void setVersionSize(BigDecimal versionSize) {
        this.versionSize = versionSize;
    }

    public Long getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Long createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Long getModifyBy() {
        return modifyBy;
    }

    public void setModifyBy(Long modifyBy) {
        this.modifyBy = modifyBy;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    public String getApklocPath() {
        return apklocPath;
    }

    public void setApklocPath(String apklocPath) {
        this.apklocPath = apklocPath;
    }

    public String getApkFilename() {
        return apkFilename;
    }

    public void setApkFilename(String apkFilename) {
        this.apkFilename = apkFilename;
    }

    public AppInfo getAppInfo() {
        return appInfo;
    }

    public void setAppInfo(AppInfo appInfo) {
        this.appInfo = appInfo;
    }
}
