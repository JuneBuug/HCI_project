//
//  Routine.swift
//  hciProject
//
//  Created by 준킴 on 2017. 12. 11..
//  Copyright © 2017년 junebuug. All rights reserved.
//

import UIKit

class Routine: UIView {


    @IBOutlet var videoView: UIWebView!
    @IBOutlet var videoName: UILabel!
    @IBOutlet var videoNameEng: UILabel!
    class func instanceFromNib() -> Routine {
        return UINib(nibName: "Routine", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! Routine
    }

}
