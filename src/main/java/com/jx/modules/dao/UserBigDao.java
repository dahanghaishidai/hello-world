package com.jx.modules.dao;

import com.jx.modules.dto.UserBigDTO;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface UserBigDao {
    //查询数据
    public List<UserBigDTO> searchUserBigDaoByUsername(Map<String, Object> searchParams);

    //登录验证
    public UserBigDTO serachUserByUsernameAndPassword(Map<String, Object> searchParams);

    //验证用户名是否存在
    public UserBigDTO serachUserByUsername(Map<String, Object> searchParams);

}
