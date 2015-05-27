package screens
{
	import feathers.controls.Screen;
	import feathers.controls.ImageLoader;
    import feathers.controls.ScreenNavigator;
    import feathers.controls.ScrollContainer;
	import feathers.layout.VerticalLayout;

    import starling.core.Starling;

    public class HomeScreen extends Screen
	{

		private var scrollContainer:ScrollContainer;
		private var verticalLayout:VerticalLayout;
		public var imageLoader:ImageLoader;
		
		override protected function initialize():void {
			buildContainer();
			buildComponents();
		}
		
		private function buildContainer():void {
			verticalLayout = new VerticalLayout();
			verticalLayout.verticalAlign = VerticalLayout.VERTICAL_ALIGN_MIDDLE;
			verticalLayout.horizontalAlign = VerticalLayout.HORIZONTAL_ALIGN_CENTER;
			verticalLayout.gap = 25;
			
			scrollContainer = new ScrollContainer();
			scrollContainer.layout = verticalLayout;
            var p:ScreenNavigator = this.parent as ScreenNavigator;
			scrollContainer.width = p.width;
			scrollContainer.height = p.height;

			addChild(scrollContainer);
		}
		
		private function buildComponents():void {
            imageLoader = new ImageLoader();
            imageLoader.source = "assets/Labrecque.png";
            imageLoader.maintainAspectRatio = true;
            imageLoader.width = Starling.current.stage.stageWidth - 50;
            scrollContainer.addChild(imageLoader);
		}
		
	}
}