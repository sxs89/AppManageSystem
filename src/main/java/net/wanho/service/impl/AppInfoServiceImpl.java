package net.wanho.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import net.wanho.constant.CommonCodeConstant;
import net.wanho.dto.AppInfoDTO;
import net.wanho.mapper.AppInfoMapper;
import net.wanho.mapper.DataDictionaryMapper;
import net.wanho.model.AppInfo;
import net.wanho.model.DataDictionary;
import net.wanho.model.DevUser;
import net.wanho.service.AppInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("appInfoService")
public class AppInfoServiceImpl implements AppInfoService {

    @Autowired
    private AppInfoMapper appInfoMapper;

    @Autowired
    private DataDictionaryMapper dataDictionaryMapper;

    @Override
    public PageInfo<AppInfo> queryByDevUserId(Long id,PageInfo pageInfo) {
        //去第几页，页码的大小
        PageHelper.startPage(pageInfo.getPageNum(),pageInfo.getPageSize());
        AppInfoDTO a = new AppInfoDTO();
        a.setDevUserId(id);
        List<AppInfo> l = appInfoMapper.query(a);
        PageInfo<AppInfo> page = new PageInfo<AppInfo>(l);
        return page;
    }

    @Override
    public List<DataDictionary> queryAllAppStatus() {
        return dataDictionaryMapper.queryAllAppStatus();
    }

    @Override
    public List<DataDictionary> queryAllFlatforms() {
        return dataDictionaryMapper.queryAllFlatforms();
    }

    @Override
    public PageInfo<AppInfo> query(AppInfoDTO appInfoDTO) {
        PageHelper.startPage(appInfoDTO.getPageNum(),CommonCodeConstant.PAGE_SIZE);
        List<AppInfo> l = appInfoMapper.query(appInfoDTO);
        PageInfo<AppInfo> page = new PageInfo<AppInfo>(l);
        return page;
    }

    @Override
    public boolean add(AppInfo appInfo, Long userId) {
        appInfo.setCreationDate(new Date());
        DevUser devUser = new DevUser();
        devUser.setId(userId);
        appInfo.setDevUser(devUser);
        appInfo.setCreatedBy(userId);
        DataDictionary dataDictionary = new DataDictionary();
        dataDictionary.setValueId(CommonCodeConstant.APP_STATUS);
        appInfo.setAppStatus(dataDictionary);
        int row = appInfoMapper.add(appInfo);
        return false;
    }

    @Override
    public boolean delete(Long id) {

        if (id != null){
            int row = appInfoMapper.deleteById(id);
            return row==1 ? true : false;
        }
        return false;
    }
}
