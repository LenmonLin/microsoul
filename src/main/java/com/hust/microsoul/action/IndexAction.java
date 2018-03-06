package com.hust.microsoul.action;

import com.hust.microsoul.model.AD1Node;
import com.hust.microsoul.model.ContentsModel;
import com.hust.microsoul.model.GoodsModel;
import com.hust.microsoul.service.ContentService;
import com.hust.microsoul.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * @author LemonLin
 * @Description :商品首页IndexAction
 * @date 2018/3/5-9:40
 */
@Controller
@RequestMapping("microsoul/contentIndex")
public class IndexAction {

    @Value("${AD1_CATEGORY_ID}")
    private Integer AD1_CATEGORY_ID;

    @Value("${GOOD_CATEGORY_ID}")
    private Integer GOOD_CATEGORY_ID;

    @Value("${AD1_WIDTH}")
    private Integer AD1_WIDTH;
    @Value("${AD1_WIDTH_B}")
    private Integer AD1_WIDTH_B;
    @Value("${AD1_HIGHT}")
    private Integer AD1_HIGHT;
    @Value("${AD1_HIGHT_B}")
    private Integer AD1_HIGHT_B;


    @Autowired
    private ContentService contentService;

    @RequestMapping("index")
    @ResponseBody
    public Msg showIndex(){


        //根据cid查询内容列表，因为刚登录首页就不能传东西过来，就得固定显示一个广告位

        List<ContentsModel> contentsModelList = contentService.selectContentVByCid(AD1_CATEGORY_ID);
        //把内容列表转换为Ad1Node列表;

        List<AD1Node> ad1Nodes = new ArrayList<>();
        for (ContentsModel contentsModel : contentsModelList){
            AD1Node ad1Node =new AD1Node();
            ad1Node.setAlt(contentsModel.getTitle());
            ad1Node.setHeight(AD1_HIGHT);
            ad1Node.setHeightB(AD1_HIGHT_B);
            ad1Node.setWidth(AD1_WIDTH);
            ad1Node.setWidthB(AD1_WIDTH_B);
            ad1Node.setSrc(contentsModel.getPic());
            ad1Node.setSrcB(contentsModel.getPic2());
            ad1Node.setHref(contentsModel.getUrl());
            //添加到节点列表
            ad1Nodes.add(ad1Node);
        }

        //根据cid查询内容列表，
        List<ContentsModel> contentsModelList2 = contentService.selectContentVByCid(GOOD_CATEGORY_ID);

        //把内容列表转换为GoodNode列表；
        List<GoodsModel> goodNodes = new ArrayList<>();
        for (ContentsModel contentsModel : contentsModelList2){
                GoodsModel goodsModel = new GoodsModel();
                goodsModel.setImageUrl(contentsModel.getUrl());
                goodsModel.setUnitPrice(contentsModel.getContentPrice());
                goodsModel.setTitle(contentsModel.getTitle());
                goodsModel.setSellpoint(contentsModel.getSubtitle());
                //添加到节点列表
                goodNodes.add(goodsModel);
        }

        //返回给前端
        return Msg.success().add("ad1Nodes",ad1Nodes).add("goodNodes",goodNodes);
    }
}
