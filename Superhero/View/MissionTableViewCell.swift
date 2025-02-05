//
//  MissionTableViewCell.swift
//  Superhero
//
//  Created by Francis Adelante on 2/6/25.
//

import UIKit

class MissionTableViewCell: GenericCell<Mission> {

    let missionName = UILabel()
    let details = UILabel()
    let dateTime = UILabel()
    let difficultyLabel = UILabel()
    let starStack = UIStackView()
    
    var tryStar = UIImageView()
      override var item: Mission!{
        didSet{
            missionName.text = item.missionTitle
            details.text = item.details
            dateTime.text = item.datePosted
            
            guard starStack.arrangedSubviews.isEmpty else {
                return
            }
            for i in (0 ..< 5) {
                let star = UIImageView(image: UIImage(systemName: "star.fill"))
                if i >= item.difficulty  {
                    star.tintColor = .myGray
                }else {
                    star.tintColor = .shBlue
                }
                star .snp.makeConstraints { make in
                    make.width.equalTo(20)
                    make.height.equalTo(20)
                }
                starStack.addArrangedSubview(star)
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(missionName)
        self.addSubview(details)
        self.addSubview(dateTime)
        self.addSubview(difficultyLabel)
        self.addSubview(starStack)
        self.addSubview(tryStar)
    
        starStack.axis = .horizontal
        starStack.distribution = .fill
        starStack.spacing = 5
        
        difficultyLabel.text = "Difficulty:"
        
        missionName.snp.makeConstraints { make in
            
            make.top.equalTo(self.snp.top).offset(15)
            make.left.equalTo(self.snp.left).offset(20)
            make.right.equalTo(self.snp.right).offset(-20)
        }
      
        details.snp.makeConstraints { make in
            make.top.equalTo(missionName.snp.bottom).offset(15)
            make.left.equalTo(self.snp.left).offset(20)
            make.right.equalTo(self.snp.right).offset(-20)
        }
        
        difficultyLabel.snp.makeConstraints { make in
            make.top.equalTo(details.snp.bottom).offset(15)
            make.left.equalTo(self.snp.left).offset(20)
            make.bottom.equalTo(self.snp.bottom).offset(-15)
        }
        
        starStack.snp.makeConstraints { make in
            make.top.equalTo(details.snp.bottom).offset(15)
            make.left.equalTo(difficultyLabel.snp.right).offset(15)
            make.bottom.equalTo(self.snp.bottom).offset(-15)
        }
        
        dateTime.snp.makeConstraints { make in
            make.top.equalTo(details.snp.bottom).offset(15)
            make.right.equalTo(self.snp.right).offset(-20)
            make.bottom.equalTo(self.snp.bottom).offset(-15)
        }
        
        missionName.modified(textColor: .myBlue, fontSize: 14)
        missionName.numberOfLines = 0
        details.modified(textColor: .shCharcoal, fontSize: 12, bold: false)
        details.numberOfLines = 0
        dateTime.modified(textColor: .lightGray, fontSize: 12, bold: false)
        dateTime.numberOfLines = 0
        difficultyLabel.modified(textColor: .shCharcoal, fontSize: 12, bold: false)

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
