//
//  Camera.swift
//  SmartEyesUI
//
//  Created by Architect_ZBX on 15/12/22.
//  Copyright © 2015年 zhaobingxu. All rights reserved.
//

import UIKit

func ==(lhs:Camera,rhs:Camera) ->Bool {
    return lhs.hashValue == rhs.hashValue
}

class Camera: NSObject {
    var cameraID:String?
    var cameraName:String?
    var cameraPicture:UIImage?
    override var hashValue:Int {
        get {
            return (self.cameraID?.hashValue)!
        }
    }
}
