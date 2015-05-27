package screens
{
	import feathers.controls.Screen;
	import feathers.controls.List;
	import feathers.controls.ScreenNavigator;
	import feathers.controls.ScrollContainer;
	import feathers.controls.WebView;
    import feathers.data.ListCollection;

    import flash.events.Event;
    import flash.net.URLLoader;
    import flash.net.URLRequest;

    import starling.events.Event;

    public class FeedScreen extends Screen
	{

		private var scrollContainer:ScrollContainer;
		public var feedList:List;
        public var feedListCollection:ListCollection;
		public var web:WebView;
        public var xmlLoader:URLLoader;
        public var feedData:XML;

		override protected function initialize():void {
			buildContainer();
			buildComponents();
            gatherFeedData();
		}

		private function buildContainer():void {
			scrollContainer = new ScrollContainer();
			var p:ScreenNavigator = this.parent as ScreenNavigator;
			scrollContainer.width = p.width;
			scrollContainer.height = p.height;
			addChild(scrollContainer);
		}

		private function buildComponents():void {
            var p:ScreenNavigator = this.parent as ScreenNavigator;

			feedList = new List();
			feedList.width = p.width;
			feedList.height = p.height/2;
			scrollContainer.addChild(feedList);

			web = new WebView();
			web.width = p.width;
			web.height = p.height/2;
            web.y = feedList.height;
			addChild(web);
		}

        private function gatherFeedData():void {
            xmlLoader = new URLLoader();
            xmlLoader.addEventListener(flash.events.Event.COMPLETE, feedLoaded);
            xmlLoader.load(new URLRequest("http://inflagrantedelicto.memoryspiral.com/feed/"));
        }

        private function feedLoaded(e:flash.events.Event):void {
            feedData = new XML(e.target.data);
            feedListCollection = new ListCollection();
            for each(var feedItem:XML in feedData.channel.item) {
                feedListCollection.push({title:String(feedItem.title), link:String(feedItem.link)})
            }
            feedList.dataProvider = feedListCollection;
            feedList.itemRendererProperties.labelField = "title";
            feedList.addEventListener(starling.events.Event.CHANGE, loadArticle);
        }

        private function loadArticle(e:starling.events.Event):void {
            web.loadURL(feedList.selectedItem.link);
        }
		
		
	}
}