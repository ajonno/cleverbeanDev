//
//  Label+Text.swift
//  cleverbean
//
//  Created by Angus Johnston on 3/9/17.
//  Copyright © 2017 AAMSCO. All rights reserved.
//

import UIKit

@IBDesignable class Label_Text: UIView {

	var contentView:UIView?
	
	@IBInspectable var nibName:String?

	
	@IBOutlet weak var title: UILabel!
	@IBOutlet weak var inputField: UITextField!
	
	
	override func awakeFromNib() {
		super.awakeFromNib()
		xibSetup()
	}
	
	func xibSetup() {
		guard let view = loadViewFromNib() else { return }

		view.layer.cornerRadius = 4
		
		view.frame = bounds
		view.autoresizingMask =
			[.flexibleWidth, .flexibleHeight]
		
		addSubview(view)
		contentView = view
	}
	
	func loadViewFromNib() -> UIView? {
		guard let nibName = nibName else { return nil }
		let bundle = Bundle(for: type(of: self))
		let nib = UINib(nibName: nibName, bundle: bundle)
		return nib.instantiate(
			withOwner: self,
			options: nil).first as? UIView
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		//this must be done in this method
		//https://stackoverflow.com/questions/26090078/shadow-not-fully-extending-the-width-of-a-uiview
		self.addShadow()
	}
	
	override func prepareForInterfaceBuilder() {
		super.prepareForInterfaceBuilder()
		xibSetup()
		contentView?.prepareForInterfaceBuilder()
	}
	
}
