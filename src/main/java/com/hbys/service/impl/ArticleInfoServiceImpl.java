package com.hbys.service.impl;

import com.hbys.common.Common;
import com.hbys.common.utils.DateUtils;
import com.hbys.common.vo.ArticleContentVo;
import com.hbys.common.vo.ArticleInfoVo;
import com.hbys.common.vo.SearchObject;
import com.hbys.common.vo.User;
import com.hbys.dao.ArticleInfoDAO;
import com.hbys.service.ArticleInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by pcg on 15/12/22.
 */
@Service
public class ArticleInfoServiceImpl implements ArticleInfoService{

    @Autowired
    private ArticleInfoDAO articleInfoDAO;

    @Override
    public Long addUpdateArticle(ArticleInfoVo vo,User user) {
        Long id = vo.getId();
        if(id > 0){
            vo.setUpdateTime(new Date());
            this.updateArticleInfo(vo);
            ArticleContentVo articleContentVo = new ArticleContentVo();
            articleContentVo.setId(id);
            articleContentVo.setContent(articleContentVo.getContent());
            this.updateArticleContent(articleContentVo);
        }else{
            vo.setCreateTime(new Date());
            vo.setUpdateTime(new Date());
            vo.setState(Common.BOOLEAN.YES);
            vo.setReadNum(0);
            vo.setUserId(user.getId().longValue());
            vo.setUserName(user.getName());
            id = this.insertArticleInfo(vo);
            if(id > 0){
                ArticleContentVo articleContentVo = new ArticleContentVo();
                articleContentVo.setId(id);
                articleContentVo.setContent(articleContentVo.getContent());
                this.insertArticleContent(articleContentVo);
            }
        }
        return id;
    }

    @Override
    public Long insertArticleInfo(ArticleInfoVo vo) {
        return articleInfoDAO.insertArticleInfo(vo);
    }

    @Override
    public void insertArticleContent(ArticleContentVo vo) {
        articleInfoDAO.insertArticleContent(vo);
    }

    @Override
    public ArticleInfoVo selectArticleInfoById(Long id) {
        return articleInfoDAO.selectArticleInfoById(id);
    }

    @Override
    public ArticleContentVo selectArticleContentById(Long id) {
        return articleInfoDAO.selectArticleContentById(id);
    }

    @Override
    public List<ArticleInfoVo> selectAllArticleInfo(SearchObject seaObj) {
        return articleInfoDAO.selectAllArticleInfo(seaObj);
    }

    @Override
    public Integer selectAllArticleInfoCount(SearchObject seaObj) {
        return articleInfoDAO.selectAllArticleInfoCount(seaObj);
    }

    @Override
    public void updateArticleInfo(ArticleInfoVo vo) {
        articleInfoDAO.updateArticleInfo(vo);
    }

    @Override
    public void updateArticleContent(ArticleContentVo vo) {
        articleInfoDAO.updateArticleContent(vo);
    }
}
