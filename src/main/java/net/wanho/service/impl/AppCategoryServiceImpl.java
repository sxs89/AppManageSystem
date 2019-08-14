package net.wanho.service.impl;

import net.wanho.mapper.AppCategoryMapper;
import net.wanho.model.AppCategory;
import net.wanho.service.AppCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("appCategoryService")
public class AppCategoryServiceImpl implements AppCategoryService {

    @Autowired
    private AppCategoryMapper appCategoryMapper;

    @Override
    public List<AppCategory> queryAllLevelOne() {
        return appCategoryMapper.queryAllLevelOne();
    }

    @Override
    public List<AppCategory> queryLevelTwoByLevelOne(Long id) {
        return appCategoryMapper.queryLevelByParentId(id);
    }

    @Override
    public List<AppCategory> queryLevelThreeBylevelTwo(Long id) {
        return appCategoryMapper.queryLevelByParentId(id);
    }

}
