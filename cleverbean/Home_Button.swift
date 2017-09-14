
import Foundation
import UIKit

@IBDesignable class Home_Button: UIButton {
	
	@IBInspectable var cornerRadius: CGFloat = 8
	@IBInspectable var isShadow: Bool = false
	@IBInspectable var isGradient: Bool = false
	@IBInspectable var gradientColor1: UIColor = .blue
	@IBInspectable var gradientColor2: UIColor = .green
	
	
	override func draw(_ rect: CGRect) {
		layer.cornerRadius = cornerRadius
		
		//apply a shadow
		if (isShadow) {
			layer.masksToBounds = false
			layer.shadowColor = UIColor.black.cgColor
			layer.shadowOpacity = 0.5
			layer.shadowOffset = CGSize(width: -1, height: 1)
			layer.shadowRadius = cornerRadius
			
			layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
			layer.shouldRasterize = true
			layer.rasterizationScale = UIScreen.main.scale
		}
		
		//apply gradient
		if (isGradient) {
			let gradientLayer = CAGradientLayer()
			
			// 2
			gradientLayer.frame = layer.bounds
			
			// 3
			let color1 = UIColor.yellow.cgColor
			let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 1.0).cgColor
			gradientLayer.colors = [color1, color2]
			
			// 4
			gradientLayer.locations = [0.0, 0.75]
			
			layer.addSublayer(gradientLayer)
			
		}
	}
}


