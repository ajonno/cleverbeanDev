//
//  GroupsViewController.swift
//  cleverbean
//
//  Created by Angus Johnston on 27/8/17.
//  Copyright © 2017 AAMSCO. All rights reserved.
//

import UIKit

class GroupsViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!

	
	var items = [[String: String]]()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.items = loadPlist()
		
		let nib = UINib.init(nibName: "GroupTableViewCell", bundle: nil)
		self.tableView.register(nib, forCellReuseIdentifier: "cell")
		
		//remove padding at the top of the tableview
		self.edgesForExtendedLayout = UIRectEdge.init(rawValue: 0)
		
		//hide empty rows in tableview
		tableView.backgroundColor = UIColor.clear
		tableView.separatorColor = UIColor.clear
		
	}
	
	
	override func viewWillAppear(_ animated: Bool) {
		self.view.backgroundColor = UIColor(colorLiteralRed: 0.973, green: 0.980, blue: 1, alpha: 1)
		
		let navBarTitle = UILabel()
		navBarTitle.text = "GROUPS "
		navBarTitle.sizeToFit()
		navBarTitle.frame.size.width = 150
		navBarTitle.textColor = .white
		let leftItem = UIBarButtonItem(customView: navBarTitle)
		self.navigationItem.leftBarButtonItem = leftItem

		self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)

		
	}
	
	func loadPlist() -> [[String: String]] {
		let path = Bundle.main.path(forResource: "sample_group_data", ofType: "plist")
		
		return NSArray.init(contentsOf: URL.init(fileURLWithPath: path!)) as! [[String: String]]
	}
	
	var selectedIndex: IndexPath?
	var isExpanded = false
	
	func didExpandCell() {
		self.isExpanded = !isExpanded
		self.tableView.reloadRows(at: [selectedIndex!], with: .automatic)
	}
}

extension GroupsViewController: UITableViewDelegate, UITableViewDataSource, GroupCellProtocol {
	
	func groupTapped(groupCellInfo: GroupTableViewCell) {
		print("boom!", groupCellInfo.groupName)
		performSegue(withIdentifier: "groupDetail", sender: self)
	}

	func addStudent(groupCellInfo: GroupTableViewCell) {
		print("add student tapped!", groupCellInfo.groupName)
		performSegue(withIdentifier: "addStudent", sender: self)
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.selectedIndex = indexPath
		print("selected row \(indexPath)")
		
		performSegue(withIdentifier: "groupDetail", sender: self)
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return self.items.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	// Set the spacing between sections
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 10
	}

	// Make background color show through
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let headerView = UIView()
		headerView.backgroundColor = UIColor.clear
		return headerView
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell : GroupTableViewCell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GroupTableViewCell
		
		//hook up the custom cell XIB
		cell.delegate = self
		
		let item = self.items[indexPath.section]
		cell.groupName.text = item["group_name"]
		
		//style
		cell.layer.cornerRadius = 4
		cell.selectionStyle = .none
		
		return cell
	}
	
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		
		if (isExpanded && self.selectedIndex == indexPath) {
			return 300
		}
		return 110
	}
}
