package com.jx.modules.controller;

import com.jx.modules.dto.UserBigDTO;
import com.jx.modules.service.UserBigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/userBig")
public class UserBigController {

    @Autowired
    private UserBigService service;

    //跳转到查询页面
    @RequestMapping(value = "/search",method = RequestMethod.GET)
    public ModelAndView searchUserBig(HttpServletRequest  request){
        UserBigDTO dto = new UserBigDTO();
        String  id = request.getParameter("id");
        String  username = request.getParameter("username");
        String  password = request.getParameter("password");

        ModelAndView model = new ModelAndView();
        Map param = new HashMap();
        if (null != id)
          dto.setId(Long.valueOf(id));
        dto.setUsername(username);
        dto.setPassword(password);
        param.put("dto", dto);
        List<UserBigDTO> list = service.searchUserBigDaoByUsername(param);

        if (null != list && list.size()>0){
            model.addObject("userbig",list.get(0));
            model.setViewName("showName");
        }else{
            model.addObject("error","查无此人");
            model.setViewName("error");
        }
        return model;

    }

    //登录
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(HttpServletRequest  request,UserBigDTO dto){
        System.out.println(dto.toString());
        ModelAndView model = new ModelAndView();
        Map param = new HashMap();
        param.put("dto", dto);
        UserBigDTO dto1 = service.serachUserByUsernameAndPassword(param);
        if (null != dto1){
            model.addObject("userbig",dto1);
            model.setViewName("showName");
        }else {
            model.addObject("error","登录失败，用户名或密码错误");
            model.setViewName("error");
        }

        return  model;
    }

    //验证用户名
    @RequestMapping(value = "/confirmUsername", method = RequestMethod.POST)
    @ResponseBody
    public Map confirmUsername(String username){
        UserBigDTO dto = new UserBigDTO();
        Map param = new HashMap();
        dto.setUsername(username);
        param.put("dto", dto);
        UserBigDTO dto1 = service.serachUserByUsername(param);

        Map respMap = new HashMap();
        if (null != dto1){
            respMap.put("msg","NO");
        }else {
            respMap.put("msg","OK");
        }
        param.clear();
        return respMap;
    }

    //跳转到注册页面
    @RequestMapping(value = "/register")
     public ModelAndView register(){
        ModelAndView model = new ModelAndView();
        model.setViewName("register");
        return model;
     }
}
