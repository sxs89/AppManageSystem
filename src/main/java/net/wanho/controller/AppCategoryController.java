package net.wanho.controller;

import net.wanho.model.AppCategory;
import net.wanho.service.AppCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("category")
public class AppCategoryController {

    @Autowired
    private AppCategoryService appCategoryService;

    @RequestMapping("queryLevelTwoByLevelOne/{levelOne}")
    @ResponseBody
    public List<AppCategory> queryLevelTwoByLevelOne(@PathVariable("levelOne") Long id){
        List<AppCategory> levelTwo = appCategoryService.queryLevelTwoByLevelOne(id);
        return levelTwo;
    }

    //查询子类，根据父类Id查询
    @RequestMapping("queryLevelThreeBylevelTwo/{levelTwo}")
    @ResponseBody
    public List<AppCategory> queryLevelThreeBylevelTwo(@PathVariable("levelTwo") Long id){
        List<AppCategory> levelThree = appCategoryService.queryLevelThreeBylevelTwo(id);
        return levelThree;
    }
}
