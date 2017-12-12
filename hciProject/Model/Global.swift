//
//  Global.swift
//  hciProject
//
//  Created by 준킴 on 2017. 12. 12..
//  Copyright © 2017년 junebuug. All rights reserved.
//

import Foundation


struct Global{
    public static var isRecommended = false{
        didSet{
            NotificationCenter.default.post(name: NSNotification.Name.init("recommendationKey"), object: nil)
        }
    }
    public static var adVar = 0 {
        didSet {
            NotificationCenter.default.post(name: NSNotification.Name.init("adKey"), object: nil)
        }
    }
}
