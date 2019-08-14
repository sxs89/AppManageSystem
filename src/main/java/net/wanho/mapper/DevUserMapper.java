package net.wanho.mapper;

import net.wanho.model.DevUser;

import java.util.List;

public interface DevUserMapper {
    List<DevUser> queryByNamePwd(DevUser devUser);
}
