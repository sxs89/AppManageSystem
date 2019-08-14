package net.wanho.controller;

import net.wanho.model.DevUser;
import net.wanho.service.DevUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("dev")
public class DevUserController {

    @Autowired
    private DevUserService devUserService;

    //进入登录界面
    @RequestMapping("toLogin")
    public String toLogin(){
        return "dev/login";
    }

    @RequestMapping("login")
    public String login(DevUser devUser, Model model, HttpSession session){
        devUser = devUserService.login(devUser);
        if (devUser != null){
            //登录成功
            session.setAttribute("devUser",devUser);
            return "dev/index";
        }else{
            //登录失败
            model.addAttribute("errMsg","登录失败");
            return "dev/login";
        }
    }


    @RequestMapping("logout/{id}")
    public String logout(@PathVariable("id") Long id,HttpSession session){
        //判断session信息是否存在
        session.removeAttribute("devUser");
        session.invalidate();
        return "redirect:/";
    }

}
