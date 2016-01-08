//
//  ParameterTableViewCell.swift
//  SmartEyesUI
//
//  Created by Architect_ZBX on 15/12/18.
//  Copyright © 2015年 zhaobingxu. All rights reserved.
//

import UIKit

class ParameterTableViewCell: UITableViewCell {
    var parameterImage:String?
    var name:String?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell() {
        let imageView = UIImageView(frame: CGRect(x: 15, y: 5, width: 40, height: 40))
        imageView.image = UIImage(named: parameterImage!)
        let parameterLabel = UILabel(frame: CGRect(x: imageView.frame.maxX + 15, y: 5, width: 100, height: 40))
        parameterLabel.text = name
        parameterLabel.font = UIFont.systemFontOfSize(20)
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(parameterLabel)
    }

}
