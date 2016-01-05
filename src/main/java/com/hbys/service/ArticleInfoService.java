package com.hbys.service;

import com.hbys.common.vo.ArticleContentVo;
import com.hbys.common.vo.ArticleInfoVo;
import com.hbys.common.vo.SearchObject;
import com.hbys.common.vo.User;

import java.util.List;

/**
 * Created by pcg on 15/12/22.
 */
public interface ArticleInfoService {

    /**
     * 发表医术文章
     * @param vo
     * @return
     */
    public Long addUpdateArticle(ArticleInfoVo vo,User user);

    public Long insertArticleInfo(ArticleInfoVo vo);

    public void insertArticleContent(ArticleContentVo vo);

    public ArticleInfoVo selectArticleInfoById(Long id);

    public ArticleContentVo selectArticleContentById(Long id);

    public List<ArticleInfoVo> selectAllArticleInfo(SearchObject seaObj);

    public Integer selectAllArticleInfoCount(SearchObject seaObj);

    public void updateArticleInfo(ArticleInfoVo vo);

    public void updateArticleContent(ArticleContentVo vo);

}
