package com.jx.modules.service;

import com.jx.modules.dao.UserBigDao;
import com.jx.modules.dto.UserBigDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserBigService {

    @Autowired
    private UserBigDao dao;

    public List<UserBigDTO> searchUserBigDaoByUsername(Map<String, Object> searchParams){
        return dao.searchUserBigDaoByUsername(searchParams);

    }

    //登录验证
    public UserBigDTO serachUserByUsernameAndPassword(Map<String, Object> searchParams){
        return dao.serachUserByUsernameAndPassword(searchParams);
    }

    //验证用户名是否存在
    public UserBigDTO serachUserByUsername(Map<String, Object> searchParams){
        return dao.serachUserByUsername(searchParams);
    }
}
