package {

    import feathers.controls.Header;
    import feathers.controls.ScreenNavigator;
    import feathers.controls.ScreenNavigatorItem;
    import feathers.controls.TabBar;
    import feathers.data.ListCollection;
    import feathers.motion.Fade;
    import feathers.themes.MetalWorksMobileTheme;

    import starling.core.Starling;
    import starling.display.Sprite;
    import starling.events.Event;

    import screens.AboutScreen;
    import screens.HomeScreen;
    import screens.FeedScreen;


    public class StartApp extends Sprite {
        public var appHeader:Header;
        public var screenNavigator:ScreenNavigator;
        public var tabBar:TabBar;

        private static const HOME_SCREEN:String = "homeScreen";
        private static const FEED_SCREEN:String = "feedScreen";
        private static const ABOUT_SCREEN:String = "aboutScreen";

        public function StartApp() {
            this.addEventListener(Event.ADDED_TO_STAGE, buildApp);
        }

        public function buildApp(e:Event):void {
            new MetalWorksMobileTheme();
            setScreens();
            buildLayout();
        }

        public function setScreens():void {
            screenNavigator = new ScreenNavigator();
            screenNavigator.addScreen(HOME_SCREEN, new ScreenNavigatorItem(HomeScreen));
            screenNavigator.addScreen(FEED_SCREEN, new ScreenNavigatorItem(FeedScreen));
            screenNavigator.addScreen(ABOUT_SCREEN, new ScreenNavigatorItem(AboutScreen));
            screenNavigator.transition = Fade.createCrossfadeTransition();
        }

        public function buildLayout():void {
            appHeader = new Header();
            appHeader.width = Starling.current.stage.stageWidth;
            appHeader.title = "Starling and Feathers";
            appHeader.validate();

            tabBar = new TabBar();
            tabBar.dataProvider = new ListCollection([
                {label:"Home", data:HOME_SCREEN},
                {label:"Feed", data:FEED_SCREEN},
                {label:"About", data:ABOUT_SCREEN}
            ]);
            tabBar.addEventListener(Event.CHANGE, screenChanged);
            tabBar.width = Starling.current.stage.stageWidth;
            tabBar.validate();
            tabBar.y = Starling.current.stage.stageHeight - tabBar.height;
            tabBar.selectedIndex = 0;

            screenNavigator.y = appHeader.height;
            screenNavigator.width = Starling.current.stage.stageWidth;
            screenNavigator.height = (Starling.current.stage.stageHeight - appHeader.height) - tabBar.height;
            screenNavigator.showScreen(HOME_SCREEN);

            addChild(screenNavigator);
            addChild(appHeader);
            addChild(tabBar);
        }

        private function screenChanged(e:Event):void {
            screenNavigator.showScreen(tabBar.selectedItem.data);
        }

    }
}
