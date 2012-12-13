/**
 * Created with IntelliJ IDEA.
 * User: bramseynhaeve
 * Date: 03/12/12
 * Time: 17:48
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.bookApplication.factory {
import be.devine.cp3.AppModel;
import be.devine.cp3.bookApplication.pageViewer.vo.PageVO;

public class PageVOFactory {
    public static function createPageVO(pageXML:XML):PageVO{
        var appModel:AppModel = AppModel.getInstance();

        var pageVO:PageVO = new PageVO();
        pageVO.style = pageXML.@style;
        pageVO.pageNumber = appModel.totalPages;

        switch(String(pageXML.@style)){

            case 'text':
                    for each(var paragraph in pageXML.p){
                        pageVO.paragraph +=  removeTabsAndNewLines(paragraph) + '\n \n';
                    }

                    //set X and Y offset if filled in
                    if(int(pageXML.@X) != 0) pageVO.paragraphX = pageXML.@X;
                    if(int(pageXML.@Y) != 0) pageVO.paragraphY = pageXML.@Y;

                    //set width and heigth if filled in
                    if(int(pageXML.@width) != 0) pageVO.paragraphWidth = pageXML.@width;
                    if(int(pageXML.@height) != 0) pageVO.paragraphHeight = pageXML.@height;
                break;

            case 'image':
                    pageVO.imageUrl += pageXML.@url;
                    trace(pageVO.imageUrl);

                    //set X and Y offset if filled in
                    if(int(pageXML.img.@X) != 0) pageVO.image1X =pageXML.img.@X;
                    if(int(pageXML.img.@Y) != 0) pageVO.image1X =pageXML.img.@Y;

                    //set width and heigth if filled in
                    if(int(pageXML.img.@width) != 0) pageVO.image1Width = pageXML.img.@width;
                    if(int(pageXML.img.@height) != 0) pageVO.image1Height = pageXML.img.@height;
                break;

            case 'index':
                //set X and Y offset if filled in
                if(int(pageXML.@X) != 0) pageVO.indexX = pageXML.@X;
                if(int(pageXML.@Y) != 0) pageVO.indexY= pageXML.@Y;

                //set width and heigth if filled in
                if(int(pageXML.@width) != 0) pageVO.indexWidth = pageXML.@width;
                if(int(pageXML.@height) != 0) pageVO.indexHeight= pageXML.@height;

                //de hele xml is hier nog niet ingeladen, dus kan nog niet aan alle chapterTitles
                //index inladen in de page zelf
                break;

            case 'front':
                //set X and Y offset if filled in
                if(int(pageXML.@X) != 0) pageVO.titleX = pageXML.@X;
                if(int(pageXML.@Y) != 0) pageVO.titleY= pageXML.@Y;

                //set width and heigth if filled in
                if(int(pageXML.@width) != 0) pageVO.titleWidth= pageXML.@width;
                if(int(pageXML.@height) != 0) pageVO.titleHeight= pageXML.@height;

                if(String(pageXML.title) != "") pageVO.title = pageXML.title;

                break;
        }

        function removeTabsAndNewLines($str:String):String
        {
            trace($str);
            var rex:RegExp = /(\t|\n|\r)/gi;
            $str = $str.replace(rex,'');
            trace($str);
            return $str;
        }

        return pageVO;
    }



}
}
