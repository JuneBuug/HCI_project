//
//  DetailViewController.swift
//  hciProject
//
//  Created by 준킴 on 2017. 12. 12..
//  Copyright © 2017년 junebuug. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UIWebViewDelegate{

    @IBOutlet weak var ripplesImg: UIImageView!
    @IBOutlet var startRecogBtn: UIButton!
    @IBOutlet var currentTime: UILabel!
    @IBOutlet var webView: UIWebView!
    var id : String = ""
    var timer = Timer()
    var isTimerRunning = false
    var seconds : Int = 30
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        loadYoutube(webView: webView,videoID: id)
       
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
         Global.adVar += 1
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
        if !webView.isLoading  {
            timer.invalidate()
        }
    }
    
    @objc func updateTimer(){
        if seconds == 0 {
            timer.invalidate()
            seconds = 30
        }else{
            seconds -= 1
            currentTime.text = "\(seconds)"
        }
       
    }
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        let when = DispatchTime.now() + 10
        DispatchQueue.main.asyncAfter(deadline: when) {
            if !self.isTimerRunning{
                self.runTimer()
            }
        }
    }
    
}
