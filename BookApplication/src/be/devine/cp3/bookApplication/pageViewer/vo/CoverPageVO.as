/**
 * Created with IntelliJ IDEA.
 * User: bramseynhaeve
 * Date: 16/12/12
 * Time: 16:49
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.bookApplication.pageViewer.vo {
public class CoverPageVO extends PageVO{
    public var title:String;
    public var author:String;
    public function CoverPageVO() {
            x = 58;
            y = 57;
            width = 390;
            height = 400;
            title = '';
            author = '';
        }
    }
}
