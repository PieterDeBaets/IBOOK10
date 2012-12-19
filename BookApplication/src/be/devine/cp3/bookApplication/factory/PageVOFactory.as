/**
 * Created with IntelliJ IDEA.
 * User: bramseynhaeve
 * Date: 03/12/12
 * Time: 17:48
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.bookApplication.factory {
import be.devine.cp3.AppModel;
import be.devine.cp3.bookApplication.pageViewer.vo.CoverPageVO;
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

                    for each(var paragraph:String in pageXML.p){
                        textPageVO.paragraph +=  removeTabsAndNewLines(paragraph) + '\n \n';
                    }

                    //set X and Y offset if filled in
                    if(pageXML.@X != pageXML.@noneExistingAttributeInXml) textPageVO.x = pageXML.@X;
                    if(pageXML.@Y != pageXML.@noneExistingAttributeInXml) textPageVO.y = pageXML.@Y;

                    //set width and heigth if filled in
                    if(pageXML.@width != pageXML.@noneExistingAttributeInXml) textPageVO.width = pageXML.@width;
                    if(pageXML.@height != pageXML.@noneExistingAttributeInXml) textPageVO.height = pageXML.@height;

                    returnPage = textPageVO;
                break;

            case 'image':
                    var imagePageVo:ImagePageVO = new ImagePageVO();
                    imagePageVo.imgUrl += pageXML.@url;
                    //set X and Y offset if filled in
                    if(pageXML.img.@X != pageXML.img.@noneExistingAttributeInXml) imagePageVo.x =pageXML.img.@X;
                    if(pageXML.img.@Y != pageXML.img.@noneExistingAttributeInXml) imagePageVo.y =pageXML.img.@Y;

                    //set width and heigth if filled in
                    if(pageXML.img.@width != pageXML.@noneExistingAttributeInXml) imagePageVo.width = pageXML.img.@width;
                    if(pageXML.img.@height != pageXML.@noneExistingAttributeInXml) imagePageVo.height = pageXML.img.@height;

                    returnPage = imagePageVo;
                break;

            case 'index':
            //set X and Y offset if filled in
                    var indexPageVo:IndexPageVo = new IndexPageVo();

                if(pageXML.@X != pageXML.@noneExistingAttributeInXml) indexPageVo.x = pageXML.@X;
                if(pageXML.@Y != pageXML.@noneExistingAttributeInXml) indexPageVo.y= pageXML.@Y;

                //set width and heigth if filled in
                if(pageXML.@width != pageXML.@noneExistingAttributeInXml) indexPageVo.width = pageXML.@width;
                if(pageXML.@height != pageXML.@noneExistingAttributeInXml) indexPageVo.height= pageXML.@height;

                //de hele xml is hier nog niet ingeladen, dus kan nog niet aan alle chapterTitles
                //index inladen in de page zelf
                    returnPage = indexPageVo;
                break;

            case 'front':
                //set X and Y offset if filled in
                    var frontPageVo:FrontPageVO = new FrontPageVO();

                if(pageXML.@X != pageXML.@noneExistingAttributeInXml) frontPageVo.x = pageXML.@X;
                if(pageXML.@Y != pageXML.@noneExistingAttributeInXml) frontPageVo.y= pageXML.@Y;

                //set width and heigth if filled in
                if(pageXML.@width != pageXML.@noneExistingAttributeInXml) frontPageVo.width = pageXML.@width;
                if(pageXML.@height != pageXML.@noneExistingAttributeInXml) frontPageVo.height = pageXML.@height;

                if(String(pageXML.title) != "") frontPageVo.title = pageXML.title;

                returnPage = frontPageVo;
                break;
            case 'cover':
                    var coverPageVO:CoverPageVO = new CoverPageVO();

                if(pageXML.@X != pageXML.@noneExistingAttributeInXml) coverPageVO.x = pageXML.@X;
                if(pageXML.@Y != pageXML.@noneExistingAttributeInXml) coverPageVO.y= pageXML.@Y;

                //set width and heigth if filled in
                if(pageXML.@width != pageXML.@noneExistingAttributeInXml) coverPageVO.width = pageXML.@width;
                if(pageXML.@height != pageXML.@noneExistingAttributeInXml) coverPageVO.height = pageXML.@height;

                if(String(pageXML.title) != "") coverPageVO.title = pageXML.title;
                if(String(pageXML.author) != "") coverPageVO.author = pageXML.author;
                    trace('------------------------' +coverPageVO.author);
                    returnPage = coverPageVO;
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
