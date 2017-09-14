//
//  UIView.swift
//  cleverbean
//
//  Created by Angus Johnston on 19/8/17.
//  Copyright © 2017 AAMSCO. All rights reserved.
//

import UIKit

extension UIView {
	
	func setBackgroundShadow() {
		//apply a shadow
		//if (isShadow) {
			layer.masksToBounds = false
			layer.shadowColor = UIColor.lightGray.cgColor
			layer.shadowOpacity = 0.2
			layer.shadowOffset = CGSize(width: -1, height: 1)
			layer.shadowRadius = 4
			
			layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
			layer.shouldRasterize = true
			layer.rasterizationScale = UIScreen.main.scale
		//}
	}
	
	func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
		
		let gradientLayer = CAGradientLayer()
		gradientLayer.frame = bounds
		gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
		gradientLayer.locations = [0.0, 1.0]
		gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
		gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
		
		layer.insertSublayer(gradientLayer, at: 0)
	}
	
	func dropShadow(scale: Bool = true) {
		self.layer.masksToBounds = false
		self.layer.shadowColor = UIColor.black.cgColor
		self.layer.shadowOpacity = 0.5
		self.layer.shadowOffset = CGSize(width: -1, height: 1)
		self.layer.shadowRadius = 1
		
		self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
		self.layer.shouldRasterize = true
		self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
	}
	
	func addShadow(shadowColor: CGColor = UIColor.black.cgColor, shadowOffset: CGSize = CGSize(width: 1, height: 1), shadowOpacity: Float = 0.35, shadowRadius: CGFloat = 3.0) {
		let layer = self.layer
		
		layer.cornerRadius = 4
		
		layer.masksToBounds = false
		
		layer.shadowColor = UIColor.lightGray.cgColor
		layer.shadowRadius = 2.5
		layer.shadowOpacity = 0.2
		layer.shadowOffset = CGSize(width: 1, height: 3)
		layer.masksToBounds = false
	}
	
}
