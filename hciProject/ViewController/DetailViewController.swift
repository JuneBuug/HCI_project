//
//  DetailViewController.swift
//  hciProject
//
//  Created by 준킴 on 2017. 12. 12..
//  Copyright © 2017년 junebuug. All rights reserved.
//

import UIKit
import AVFoundation
class DetailViewController: UIViewController,UIWebViewDelegate{
    
    @IBOutlet weak var recogLabel: UILabel!
    @IBOutlet var startRecogBtn: UIButton!
    @IBOutlet var currentTime: UILabel!
    @IBOutlet var webView: UIWebView!
    var id : String = ""
    var timer = Timer()
    var isTimerRunning = false
    var seconds : Int = 30
    var synthesizer = AVSpeechSynthesizer()
    var nowCanspeak = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        loadYoutube(webView: webView,videoID: id)
        NotificationCenter.default.addObserver(self, selector: #selector(setNowCanSpeak), name: NSNotification.Name.init("detailSpeakKey"), object: nil)
        // Do any additional setup after loading the view.
    }
    
    @objc func setNowCanSpeak(){
        nowCanspeak = true
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
            let when = DispatchTime.now() + 3
            DispatchQueue.main.asyncAfter(deadline: when) {
                self.speak()
                
            }
        }else if seconds == 25 {
            timer.invalidate()
            isTimerRunning = false
            let when = DispatchTime.now() + 6
            DispatchQueue.main.asyncAfter(deadline: when) {
                if !self.isTimerRunning{
                    self.seconds -= 1
                    self.currentTime.text = "\(self.seconds)"
                    self.runTimer()
                    self.recogLabel.text = "다시 시작"
                }
            }
        }else if seconds == 26 {
            seconds -= 1
            currentTime.text = "\(seconds)"
            recogLabel.text = "멈춰"
            recogLabel.isHidden = false
        }
        else{
            seconds -= 1
            currentTime.text = "\(seconds)"
        }
        
    }
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        let when = DispatchTime.now() + 3
        DispatchQueue.main.asyncAfter(deadline: when) {
            if !self.isTimerRunning && self.id == "50GX-0jydXM"{
                self.seconds = 30
                self.runTimer()
            }
        }
    }
    
    func speak(){
        let utterance = AVSpeechUtterance(string: "오늘 정해진 운동량을 끝내셨어요! 수고하셨습니다.")
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        utterance.rate = 0.5
        
        self.synthesizer.speak(utterance)
    }
    
    @IBAction func onTouchNext(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.id = "2c_oijA34Z8"
        self.show(vc, sender: nil)
    }
}
