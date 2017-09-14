//
//  NewGroupViewController.swift
//  cleverbean
//
//  Created by Angus Johnston on 7/9/17.
//  Copyright © 2017 AAMSCO. All rights reserved.
//

import UIKit

class NewGroupViewController: UIViewController {

	@IBOutlet weak var labelAndInput: Label_Text!
	@IBOutlet weak var saveButton: CB_Button!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		labelAndInput.title.text = "CLASS OR READING GROUP NAME"
		labelAndInput.inputField.placeholder = "Enter name..."
		labelAndInput.inputField.spellCheckingType = .no
		labelAndInput.inputField.autocorrectionType = .no
		labelAndInput.inputField.autocapitalizationType = .words
		
		navigationController!.navigationBar.isTranslucent = false
		navigationController!.navigationBar.shadowImage = #imageLiteral(resourceName: "dots_card")
		
		navigationController!.navigationBar.setBackgroundImage(#imageLiteral(resourceName: "dots_card"), for: .default)
		
		navigationController!.navigationBar.barTintColor = UIColor.init(colorLiteralRed: 0.251, green: 0.922, blue: 0.937, alpha: 1)
		
	}
	
	override func viewWillDisappear(_ animated: Bool) {
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
	}
	
	@IBAction func tappedSave(_ sender: UIButton) {
		self.navigationController?.popViewController(animated: true)
	}

}
