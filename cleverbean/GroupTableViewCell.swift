//
//  GroupTableViewCell.swift
//  cleverbean
//
//  Created by Angus Johnston on 28/8/17.
//  Copyright © 2017 AAMSCO. All rights reserved.
//

protocol GroupCellProtocol: class {
	func groupTapped(groupCellInfo: GroupTableViewCell)
	func addStudent(groupCellInfo: GroupTableViewCell)
}

import UIKit

class GroupTableViewCell: UITableViewCell {

	@IBOutlet weak var groupName: UILabel!
	@IBOutlet weak var picture: UIImageView!
	@IBOutlet weak var groupNameFrame: UIView!
	@IBOutlet weak var addStudentFrame: UIView!

	weak var delegate: GroupCellProtocol?
	
	
    override func awakeFromNib() {
        super.awakeFromNib()
		
		//gesture recognizer
		let tapGroupNameFrame = UITapGestureRecognizer(target: self, action:  #selector (self.tappedGroups (_:)))
		self.groupNameFrame.addGestureRecognizer(tapGroupNameFrame)

		let tapAddStudentFrame = UITapGestureRecognizer(target: self, action:  #selector (self.tappedAddStudent (_:)))
		self.addStudentFrame.addGestureRecognizer(tapAddStudentFrame)
		
    }
	
	func tappedGroups(_ sender: UITapGestureRecognizer) {
		delegate?.groupTapped(groupCellInfo: self)
	}
	
	func tappedAddStudent(_ sender: UITapGestureRecognizer) {
		delegate?.addStudent(groupCellInfo: self)
	}
	
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
		
    }
    
}

