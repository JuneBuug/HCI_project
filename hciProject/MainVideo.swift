//
//  MainVideo.swift
//  hciProject
//
//  Created by 준킴 on 2017. 12. 11..
//  Copyright © 2017년 junebuug. All rights reserved.
//

import UIKit

class MainVideo: UIView {

  
    @IBOutlet var webView: UIWebView!
    var url : String = ""
    @IBOutlet var videoName: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBAction func onClickBtn(_ sender: Any) {
    }
    class func instanceFromNib() -> MainVideo {
        return UINib(nibName: "MainVideo", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! MainVideo
    }
}
