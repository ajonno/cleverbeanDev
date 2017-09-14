//
//  CB_Button.swift
//  cleverbean
//
//  Created by Angus Johnston on 18/8/17.
//  Copyright © 2017 AAMSCO. All rights reserved.
//

import UIKit

@IBDesignable class CB_Button: UIButton {

	@IBInspectable var fillColor: UIColor = .blue
	@IBInspectable var borderColor: UIColor = .white
	@IBInspectable var borderWidth: CGFloat = 0
	@IBInspectable var cornerRadius: CGFloat = 0
	@IBInspectable var isTransparent: Bool = false
	@IBInspectable var height: CGFloat = 50
	@IBInspectable var isShadow: Bool = false
	
	
    override func draw(_ rect: CGRect) {
		layer.cornerRadius = cornerRadius
		layer.backgroundColor = fillColor.cgColor
		layer.borderColor = borderColor.cgColor
		layer.borderWidth = borderWidth

		layer.frame.size.height = height
		
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
	}
}
