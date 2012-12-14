/**
 * Created with IntelliJ IDEA.
 * User: bramseynhaeve
 * Date: 03/12/12
 * Time: 17:48
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.bookApplication.factory {
import be.devine.cp3.AppModel;
import be.devine.cp3.bookApplication.pageViewer.vo.FrontPageVO;
import be.devine.cp3.bookApplication.pageViewer.vo.ImagePageVO;
import be.devine.cp3.bookApplication.pageViewer.vo.IndexPageVo;
import be.devine.cp3.bookApplication.pageViewer.vo.PageVO;
import be.devine.cp3.bookApplication.pageViewer.vo.TextPageVO;

public class PageVOFactory {
    public static function createPageVO(pageXML:XML):PageVO{
        var appModel:AppModel = AppModel.getInstance();
        var returnPage:PageVO = new PageVO();

        //var pageVO:PageVO = new PageVO();
        //pageVO.style = pageXML.@style;
        //pageVO.pageNumber = appModel.totalPages;

        switch(String(pageXML.@style)){

            case 'text':
                    var textPageVO:TextPageVO = new TextPageVO();
                    //textPageVO.style = pageXML.@style;
                    //textPageVO.pageNumber = appModel.totalPages;

                    for each(var paragraph in pageXML.p){
                        textPageVO.paragraph +=  removeTabsAndNewLines(paragraph) + '\n \n';
                    }

                    //set X and Y offset if filled in
                    //TODO deze werkt beter! i.p.v. != 0
                    if(pageXML.@X != pageXML.@noneExistingAttributeInXml) textPageVO.x = pageXML.@X;
                    if(int(pageXML.@Y) != 0) textPageVO.y = pageXML.@Y;

                    //set width and heigth if filled in
                    if(int(pageXML.@width) != 0) textPageVO.width = pageXML.@width;
                    if(int(pageXML.@height) != 0) textPageVO.height = pageXML.@height;

                    returnPage = textPageVO;
                break;

            case 'image':
                    var imagePageVo:ImagePageVO = new ImagePageVO();
                    imagePageVo.imgUrl += pageXML.@url;
                    //set X and Y offset if filled in
                    if(int(pageXML.img.@X) != 0) imagePageVo.x =pageXML.img.@X;
                    if(int(pageXML.img.@Y) != 0) imagePageVo.y =pageXML.img.@Y;

                    //set width and heigth if filled in
                    if(int(pageXML.img.@width) != 0) imagePageVo.width = pageXML.img.@width;
                    if(int(pageXML.img.@height) != 0) imagePageVo.height = pageXML.img.@height;

                    returnPage = imagePageVo;
                break;

            case 'index':
            //set X and Y offset if filled in
                    var indexPageVo:IndexPageVo = new IndexPageVo();

                if(int(pageXML.@X) != 0) indexPageVo.x = pageXML.@X;
                if(int(pageXML.@Y) != 0) indexPageVo.y= pageXML.@Y;

                //set width and heigth if filled in
                if(int(pageXML.@width) != 0) indexPageVo.width = pageXML.@width;
                if(int(pageXML.@height) != 0) indexPageVo.height= pageXML.@height;

                //de hele xml is hier nog niet ingeladen, dus kan nog niet aan alle chapterTitles
                //index inladen in de page zelf
                    returnPage = indexPageVo;
                break;

            case 'front':
                //set X and Y offset if filled in
                    var frontPageVo:FrontPageVO = new FrontPageVO();

                if(int(pageXML.@X) != 0) frontPageVo.x = pageXML.@X;
                if(int(pageXML.@Y) != 0) frontPageVo.y= pageXML.@Y;

                //set width and heigth if filled in
                if(int(pageXML.@width) != 0) frontPageVo.width = pageXML.@width;
                if(int(pageXML.@height) != 0) frontPageVo.height = pageXML.@height;

                if(String(pageXML.title) != "") frontPageVo.title = pageXML.title;

                returnPage = frontPageVo;
                break;
        }

        function removeTabsAndNewLines($str:String):String
        {
            var rex:RegExp = /(\t|\n|\r)/gi;
            $str = $str.replace(rex,'');
            return $str;
        }

        returnPage.style = pageXML.@style;
        returnPage.pageNumber = appModel.totalPages;
        return returnPage;
    }



}
}
