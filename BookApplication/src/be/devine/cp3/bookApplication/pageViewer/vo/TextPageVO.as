/**
 * Created with IntelliJ IDEA.
 * User: bramseynhaeve
 * Date: 14/12/12
 * Time: 11:26
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.bookApplication.pageViewer.vo {
public class TextPageVO extends PageVO{
    public var paragraph:String;

    public function TextPageVO() {
        /*public var paragraph:String = '';
        public var paragraphX:int = 75;
        public var paragraphY:int= 70;
        public var paragraphWidth:int = 351;
        public var paragraphHeight:int = 489
        ;*/

        super();

        x = 75;
        y = 70;
        width = 351;
        height = 489;
        paragraph = '';
    }
}
}
