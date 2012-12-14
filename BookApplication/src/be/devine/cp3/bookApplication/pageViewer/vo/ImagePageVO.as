/**
 * Created with IntelliJ IDEA.
 * User: bramseynhaeve
 * Date: 14/12/12
 * Time: 11:23
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.bookApplication.pageViewer.vo {
public class ImagePageVO extends PageVO{
    public var imgUrl:String;
    public function ImagePageVO() {
        x = 64;
        y = 46;
        width = 391;
        height = 585;

        imgUrl = "assets/img/";
    }
}
}
