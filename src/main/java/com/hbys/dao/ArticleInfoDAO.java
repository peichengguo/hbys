package com.hbys.dao;

import com.hbys.common.vo.ArticleContentVo;
import com.hbys.common.vo.ArticleInfoVo;
import com.hbys.common.vo.SearchObject;

import java.util.List;

/**
 * Created by pcg on 15/12/15.
 */
public interface ArticleInfoDAO {

    public Long insertArticleInfo(ArticleInfoVo vo);

    public void insertArticleContent(ArticleContentVo vo);

    public ArticleInfoVo selectArticleInfoById(Long id);

    public ArticleContentVo selectArticleContentById(Long id);

    public List<ArticleInfoVo> selectAllArticleInfo(SearchObject seaObj);

    public Integer selectAllArticleInfoCount(SearchObject seaObj);

    public void updateArticleInfo(ArticleInfoVo vo);

    public void updateArticleContent(ArticleContentVo vo);

}
