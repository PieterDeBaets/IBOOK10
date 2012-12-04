/**
 * Created with IntelliJ IDEA.
 * User: bramseynhaeve
 * Date: 04/12/12
 * Time: 20:49
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.bookApplication.factory {
import be.devine.cp3.AppModel;
import be.devine.cp3.bookApplication.timeline.vo.PageIconVO;

public class PageIconVOFactory {
    public static function createPageIconVO(style:String, chapterIndex:uint):PageIconVO{
        var appModel:AppModel = AppModel.getInstance();

        var pageIconVo:PageIconVO = new PageIconVO();
        pageIconVo.chapter = chapterIndex;
        pageIconVo.style = style;
        return pageIconVo;
    }
}
}
