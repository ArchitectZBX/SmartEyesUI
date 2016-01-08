//
//  textFieldTableViewCell.swift
//  SmartEyesUI
//
//  Created by Architect_ZBX on 15/12/12.
//  Copyright © 2015年 zhaobingxu. All rights reserved.
//

import UIKit
//定义闭包
typealias countClosure = (num:Int)->Void
class textFieldTableViewCell: UITableViewCell,UITextFieldDelegate {
    var myClosure:countClosure?
    var textField = UITextField()
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func initWithClosure(closure:countClosure) {
        self.myClosure = closure
    }
    
    
    func setCell() {
        textField = UITextField(frame: CGRect(x: 20, y: 0, width: ScreenSize.size.width-20, height: 50))
        textField.placeholder = "请手动输入摄像机UID"
        textField.delegate = self
        textField.textAlignment = NSTextAlignment.Center
        textField.backgroundColor = UIColor(red: 255/255, green: 250/255, blue: 240/255, alpha: 1)
        let label = UILabel(frame: CGRect(x: 0, y: 49, width: ScreenSize.size.width, height: 1))
        label.backgroundColor = UIColor.grayColor()
        
        let leftImageView = UIImageView(image: UIImage(named: "uid.png"))
        leftImageView.frame = CGRect(x:0 , y: 10, width: 30, height: 30)
        textField.leftView = leftImageView
        textField.leftViewMode = UITextFieldViewMode.Always
        textField.clearButtonMode = UITextFieldViewMode.Always
        self.contentView.addSubview(textField)
        self.contentView.addSubview(label)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        print("开始输入了")
    }
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if(myClosure != nil) {
            myClosure!(num:range.location)
        }
        return true
    }
    
    
    
    

}
