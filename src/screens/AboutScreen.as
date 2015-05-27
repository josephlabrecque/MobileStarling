package screens
{
	import feathers.controls.Screen;
	import feathers.controls.Label;
    import feathers.controls.ScreenNavigator;
    import feathers.controls.ScrollContainer;
	import feathers.layout.VerticalLayout;

    import starling.core.Starling;

    public class AboutScreen extends Screen
	{

		private var scrollContainer:ScrollContainer;
		private var verticalLayout:VerticalLayout;
		public var aboutLabel:Label;

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
            aboutLabel = new Label();
            aboutLabel.text = "This Adobe AIR mobile application was built by Joseph Labrecque. It demonstrates the use of Starling and Feathers and how an app can be built around these frameworks.";
            aboutLabel.width = Starling.current.stage.stageWidth - 50;
            aboutLabel.wordWrap = true;
            scrollContainer.addChild(aboutLabel);
		}
		
	}
}