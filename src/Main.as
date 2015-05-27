package {
    import flash.display.Sprite;
    import starling.core.Starling;

    [SWF(width="400", height="680", frameRate="60", backgroundColor="#000000")]

    public class Main extends Sprite
    {
        private var _starling:Starling;

        public function Main() {
            _starling = new Starling(StartApp, stage);
            _starling.start();
        }

    }
}