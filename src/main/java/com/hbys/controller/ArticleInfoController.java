package com.hbys.controller;

import com.hbys.common.vo.ArticleInfoVo;
import com.hbys.common.vo.SearchObject;
import com.hbys.common.vo.User;
import com.hbys.service.ArticleInfoService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by pcg on 15/12/22.
 */

@Controller
@RequestMapping("article")
public class ArticleInfoController {

    @Autowired
    private ArticleInfoService articleInfoService;

    @RequestMapping("to_send_article_info")
    public String toSendArticleInfo(Model model,ArticleInfoVo articleInfoVo){

        return "article_addUpdate";
    }

    /**
     * 增加文章
     * @param model
     * @param articleInfoVo
     * @param request
     * @return
     */
    @RequestMapping("add_update_article")
    public String addUpdateArticleInfo(Model model,ArticleInfoVo articleInfoVo,HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        Long id = articleInfoService.addUpdateArticle(articleInfoVo,user);
        if(id > 0){
            model.addAttribute("id",id);
        }
        return "article_addUpdate";
    }

    /**
     * 获取 医术文章列表
     * @param seaObj
     * @return
     */
    @RequestMapping("get_article_info_list")
    @ResponseBody
    public Object getArticleInfoList(SearchObject seaObj){
        List<ArticleInfoVo> articleInfoVoList = articleInfoService.selectAllArticleInfo(seaObj);
        return articleInfoVoList;
    }

    /**
     * 进入 全部页面医术文章
     * @param model
     * @param seaObj
     * @return
     */
    @RequestMapping("to_article_list")
    public String getAllArticleInfoList(Model model,SearchObject seaObj){
        List<ArticleInfoVo> articleInfoVoList = articleInfoService.selectAllArticleInfo(seaObj);
        model.addAttribute("articleInfoList",articleInfoVoList);

        return "article_list";
    }

}
