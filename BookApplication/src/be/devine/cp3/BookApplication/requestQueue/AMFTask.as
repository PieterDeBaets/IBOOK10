package be.devine.cp3.BookApplication.RequestQueue {
import flash.events.Event;
import flash.net.NetConnection;
import flash.net.Responder;

public class AMFTask extends NetConnection implements IQueueTask{

    private var _path:String;
    private var gatwayURL:String;
    private var method:String;
    private var netConnection:NetConnection;
    private var methodParameters:Array;
    private var result:Object;


    public function AMFTask(gatewayURL:String, method:String, ... methodParameters) {
        trace("[AMFTask] Construct");
        this.gatwayURL = gatewayURL;
        this.method = method;
        this.methodParameters = methodParameters;

    }

    public function start():void {
        netConnection = new NetConnection();
        netConnection.connect(this.gatwayURL);

        var netConnectionArray = new Array();
        netConnectionArray.push(method);
        netConnectionArray.push(new Responder(onAmfResult, onAmfError));
        netConnectionArray.concat(this.methodParameters);

        netConnection.call.apply(this, netConnectionArray);

    }

    private function onAmfResult(r:Object):void {
        trace("result")
        this.result = r;
        dispatchEvent(new Event(Event.COMPLETE));
    }

    private function onAmfError(e:Object):void {
        throw new Error("AMF Error "+ e);
    }

}
}
