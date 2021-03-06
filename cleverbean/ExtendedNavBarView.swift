import UIKit

class ExtendedNavBarView: UIView {
	
	/**
	*  Called when the view is about to be displayed.  May be called more than
	*  once.
	*/
	override func willMove(toWindow newWindow: UIWindow?) {
		super.willMove(toWindow: newWindow)
		
		// Use the layer shadow to draw a one pixel hairline under this view.
		layer.shadowOffset = CGSize(width: 0, height: CGFloat(1) / UIScreen.main.scale)
		layer.shadowRadius = 0
		
		layer.backgroundColor = UIColor.blue.cgColor
		layer.frame.size.height = 150
		
		// UINavigationBar's hairline is adaptive, its properties change with
		// the contents it overlies.  You may need to experiment with these
		// values to best match your content.
		layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
		layer.shadowOpacity = 0.25
	}
	
}
