package net.wanho.mapper;

import net.wanho.model.DataDictionary;

import java.util.List;

public interface DataDictionaryMapper {
    List<DataDictionary> queryAllAppStatus();

    List<DataDictionary> queryAllFlatforms();
}
