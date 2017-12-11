//
//  DetailViewController.swift
//  hciProject
//
//  Created by 준킴 on 2017. 12. 12..
//  Copyright © 2017년 junebuug. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var ripplesImg: UIImageView!
    @IBOutlet var startRecogBtn: UIButton!
    @IBOutlet var currentTime: UILabel!
    @IBOutlet var webView: UIWebView!
    var id : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        loadYoutube(webView: webView,videoID: id)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var startVoiceRecognition: UIButton!
    
    func loadYoutube(webView: UIWebView, videoID:String) {
        // create a custom youtubeURL with the video ID
        guard
            let youtubeURL = NSURL(string: "https://www.youtube.com/embed/\(videoID)")
            else { return }
        // load your web request
        webView.loadRequest( URLRequest(url: youtubeURL as URL) )
    }
}
