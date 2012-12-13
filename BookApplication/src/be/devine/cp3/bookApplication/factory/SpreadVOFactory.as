/**
 * Created with IntelliJ IDEA.
 * User: bramseynhaeve
 * Date: 03/12/12
 * Time: 17:40
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.bookApplication.factory {
import be.devine.cp3.AppModel;
import be.devine.cp3.bookApplication.pageViewer.vo.SpreadVO;

public class SpreadVOFactory {

    public static function createSpreadVO(spreadXML:XML):SpreadVO{
        var appModel:AppModel = AppModel.getInstance();

        var spreadVO:SpreadVO = new SpreadVO();

        for each( var page:XML in spreadXML.page){
            if(page.childIndex() == 0){
                spreadVO.page1 = PageVOFactory.createPageVO(page);
            }else{
                spreadVO.page2 = PageVOFactory.createPageVO(page);
            }
            appModel.totalPages ++;
        }

        spreadVO.chapterIndex = appModel.spreadsPerChapter.length;


        return spreadVO;
    }
}
}
