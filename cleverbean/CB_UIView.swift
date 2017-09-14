//
//  CB_UIView.swift
//  cleverbean
//
//  Created by Angus Johnston on 19/8/17.
//  Copyright © 2017 AAMSCO. All rights reserved.
//

import UIKit


@IBDesignable class CB_UIView: UIView {

	
	// Shadow
	@IBInspectable var shadow: Bool {
		get {
			return layer.shadowOpacity > 0.0
		}
		set {
			if newValue == true {
				//self.addShadow()
				self.dropShadow()
			}
		}
	}
	
	// Corner radius
	@IBInspectable var circle: Bool {
		get {
			return layer.cornerRadius == self.bounds.width*0.5
		}
		set {
			if newValue == true {
				self.cornerRadius = self.bounds.width*0.5
			}
		}
	}
	
	@IBInspectable var cornerRadius: CGFloat {
		get {
			return self.layer.cornerRadius
		}
		
		set {
			self.layer.cornerRadius = newValue
		}
	}
	
	
	// Border width
	@IBInspectable
	public var borderWidth: CGFloat {
		set {
			layer.borderWidth = newValue
		}
		
		get {
			return layer.borderWidth
		}
	}
	
	// Border color
	@IBInspectable
	public var borderColor: UIColor? {
		set {
			layer.borderColor = newValue?.cgColor
		}
		
		get {
			if let borderColor = layer.borderColor {
				return UIColor(cgColor: borderColor)
			}
			return nil
		}
	}
	

}
