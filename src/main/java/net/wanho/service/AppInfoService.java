package net.wanho.service;

import com.github.pagehelper.PageInfo;
import net.wanho.dto.AppInfoDTO;
import net.wanho.model.AppInfo;
import net.wanho.model.DataDictionary;

import java.util.List;

public interface AppInfoService {
    PageInfo<AppInfo> queryByDevUserId(Long id,PageInfo pageInfo);

    List<DataDictionary> queryAllAppStatus();

    List<DataDictionary> queryAllFlatforms();

    PageInfo<AppInfo> query(AppInfoDTO appInfoDTO);

    boolean add(AppInfo appInfo, Long userId);

    boolean delete(Long id);

    AppInfo queryById(Long id);
}
