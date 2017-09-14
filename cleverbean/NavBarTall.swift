import UIKit

class NavBarTall: UINavigationBar {
	
	override func sizeThatFits(_ size: CGSize) -> CGSize {
		return CGSize(width: UIScreen.main.bounds.width, height: 90)
	}
	
}
