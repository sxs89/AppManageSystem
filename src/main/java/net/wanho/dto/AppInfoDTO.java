package net.wanho.dto;

/**
 * 应用程序DTO对象
 */
public class AppInfoDTO {

    private String softwareName;
    private Long appStatus;
    private Long appFlatform;
    private Long levelOneId;
    private Long levelTwoId;
    private Long levelThreeId;
    private Integer pageNum;
    private Long devUserId;

    public String getSoftwareName() {
        return softwareName;
    }

    public void setSoftwareName(String softwareName) {
        this.softwareName = softwareName;
    }

    public Long getAppStatus() {
        return appStatus;
    }

    public void setAppStatus(Long appStatus) {
        this.appStatus = appStatus;
    }

    public Long getAppFlatform() {
        return appFlatform;
    }

    public void setAppFlatform(Long appFlatform) {
        this.appFlatform = appFlatform;
    }

    public Long getLevelOneId() {
        return levelOneId;
    }

    public void setLevelOneId(Long levelOneId) {
        this.levelOneId = levelOneId;
    }

    public Long getLevelTwoId() {
        return levelTwoId;
    }

    public void setLevelTwoId(Long levelTwoId) {
        this.levelTwoId = levelTwoId;
    }

    public Long getLevelThreeId() {
        return levelThreeId;
    }

    public void setLevelThreeId(Long levelThreeId) {
        this.levelThreeId = levelThreeId;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Long getDevUserId() {
        return devUserId;
    }

    public void setDevUserId(Long devUserId) {
        this.devUserId = devUserId;
    }

    @Override
    public String toString() {
        return "AppInfoDTO{" +
                "softwareName='" + softwareName + '\'' +
                ", appStatus=" + appStatus +
                ", appFlatform=" + appFlatform +
                ", levelOneId=" + levelOneId +
                ", levelTwoId=" + levelTwoId +
                ", levelThreeId=" + levelThreeId +
                ", pageNum=" + pageNum +
                ", devUserId=" + devUserId +
                '}';
    }
}
