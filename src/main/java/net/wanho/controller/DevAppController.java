package net.wanho.controller;

import com.github.pagehelper.PageInfo;
import net.wanho.dto.AppInfoDTO;
import net.wanho.model.AppCategory;
import net.wanho.model.AppInfo;
import net.wanho.model.DataDictionary;
import net.wanho.service.AppCategoryService;
import net.wanho.service.AppInfoService;
import net.wanho.service.DataDictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("app")
public class DevAppController {

    @Autowired
    private AppInfoService appInfoService;

    @Autowired
    private DataDictionaryService dataDictionaryService;

    @Autowired
    private AppCategoryService appCategoryService;

    @RequestMapping("index/devId/{id}")
    public String index(@PathVariable("id") Long id, Model model, HttpSession session){
        session.setAttribute("USER_ID",id);
        PageInfo<AppInfo> pageInfo = new PageInfo<>();
        pageInfo.setPageSize(5);
        pageInfo.setPageNum(1);
        pageInfo = appInfoService.queryByDevUserId(id,pageInfo);
        //查询所有的平台
        List<DataDictionary> appFlatforms = appInfoService.queryAllFlatforms();
        //查询所有的APP状态
        List<DataDictionary> appStatus = appInfoService.queryAllAppStatus();

        //查询所有的一级分类
        List<AppCategory> levelOne = appCategoryService.queryAllLevelOne();

        model.addAttribute("page",pageInfo);
        model.addAttribute("appFlatforms",appFlatforms);
        model.addAttribute("appStatus",appStatus);
        model.addAttribute("levelOne",levelOne);
        return "app/index";
    }

    @RequestMapping("query")
    public String query(AppInfoDTO appInfoDTO,Model model,HttpSession session){
        Object obj = session.getAttribute("USER_ID");
        if (obj != null){
            long userId = (long) obj;
            appInfoDTO.setDevUserId(userId);
            PageInfo<AppInfo> pageInfo = new PageInfo<>();
            pageInfo.setPageSize(5);
            pageInfo.setPageNum(1);
            pageInfo = appInfoService.query(appInfoDTO);
            //查询所有的平台
            List<DataDictionary> appFlatforms = appInfoService.queryAllFlatforms();
            //查询所有的APP状态
            List<DataDictionary> appStatus = appInfoService.queryAllAppStatus();
            //查询所有的一级分类
            List<AppCategory> levelOne = appCategoryService.queryAllLevelOne();
            model.addAttribute("page",pageInfo);
            model.addAttribute("appFlatforms",appFlatforms);
            model.addAttribute("appStatus",appStatus);
            model.addAttribute("levelOne",levelOne);
            model.addAttribute("appInfoDTO",appInfoDTO);
            return "app/index";
        }else{
            return "redirect:/";
        }

    }


    @RequestMapping("toAdd")
    public String toAdd(Model model){
        //查询所有的平台
        List<DataDictionary> appFlatforms = appInfoService.queryAllFlatforms();
        //查询所有的APP状态
        List<DataDictionary> appStatus = appInfoService.queryAllAppStatus();
        //查询所有的一级分类
        List<AppCategory> levelOne = appCategoryService.queryAllLevelOne();
        model.addAttribute("appFlatforms",appFlatforms);
        model.addAttribute("appStatus",appStatus);
        model.addAttribute("levelOne",levelOne);
        return "app/add";
    }

    @RequestMapping("add")
    public String add(AppInfo appInfo,HttpSession session){
        Object id = session.getAttribute("USER_ID");
        Long userId = Long.parseLong(id.toString());
        System.out.println("appInfo");
        System.out.println(appInfo);
        boolean flag = appInfoService.add(appInfo,userId);
        //转发到action
        return "forward:index/devId/"  + userId;
    }

    @RequestMapping("delete/{id}")
    public String delete(@PathVariable("id") Long id,HttpSession session){
        Object uid = session.getAttribute("USER_ID");
        Long userId = Long.parseLong(uid.toString());
        boolean flag = appInfoService.delete(id);
        return "forward:index/devId/"  + userId;
    }
}
