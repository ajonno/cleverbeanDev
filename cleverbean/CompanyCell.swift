import UIKit

class CompanyCell: UITableViewCell {
	
	let labelName: UILabel
	let labelCategory: UILabel
	let companyImage: UIImageView
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		self.labelName = UILabel()
		self.labelCategory = UILabel()
		self.companyImage = UIImageView()
		
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		initViews()
		addViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func initViews() {
		labelName.textColor = .black
		labelName.font = UIFont.systemFont(ofSize: 17.0)
		
		labelCategory.textColor = .gray
		labelCategory.font = UIFont.systemFont(ofSize: 13.0)
		
		companyImage.clipsToBounds = true
		companyImage.layer.borderWidth = 1.0
		companyImage.layer.borderColor = UIColor.lightGray.cgColor
	}
	
	func addViews() {
		self.addSubview(labelName)
		self.addSubview(labelCategory)
		self.addSubview(companyImage)
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		companyImage.layer.cornerRadius = companyImage.frame.size.width / 2
	}

}
