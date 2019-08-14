package net.wanho.service;

import net.wanho.model.AppCategory;

import java.util.List;

public interface AppCategoryService {
    List<AppCategory> queryAllLevelOne();

    List<AppCategory> queryLevelTwoByLevelOne(Long id);

    List<AppCategory> queryLevelThreeBylevelTwo(Long id);
}
