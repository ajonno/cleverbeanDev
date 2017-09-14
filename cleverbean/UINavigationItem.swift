//
//  UINavigationItem.swift
//  cleverbean
//
//  Created by Angus Johnston on 20/8/17.
//  Copyright © 2017 AAMSCO. All rights reserved.
//

import UIKit

extension UINavigationItem{
	
	override open func awakeFromNib() {
		super.awakeFromNib()
		
		let backItem = UIBarButtonItem()
		
		
		let font = UIFont(name: "Courier", size: 12)!
		var attributes: [String : Any] = [NSFontAttributeName : font]
		
		attributes[NSForegroundColorAttributeName] = UIColor.black
		
		backItem.setTitleTextAttributes(attributes, for: .normal)
		
		/*Changing color*/
//		backItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: .normal)
		
		self.backBarButtonItem = backItem
	}
	
}
