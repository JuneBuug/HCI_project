//
//  FirstViewController.swift
//  hciProject
//
//  Created by 준킴 on 2017. 12. 11..
//  Copyright © 2017년 junebuug. All rights reserved.
//

import UIKit
import AVFoundation

class FirstViewController: UIViewController {
    
    var youtubeIDList = ["llwXGZlgdU0","XTH5saFBDqA"]
    var IDList = ["P8CDv4dgHEM","llwXGZlgdU0","XTH5saFBDqA","1KGU6iB5MVE","wc_PizWNp6k"]
    var list : [Video] = []
    
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var subTitle2: UILabel!
    @IBOutlet weak var aiView: UIView!
    @IBOutlet weak var topTitle: UILabel!
    var globalID : String = "50GX-0jydXM"
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var routineScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setScrollView()
        
        if Global.isRecommended {
            topTitle.text = "이어보기 Continue Watching"
            subTitle.text = "\'광배근\' 추천 루틴 Recommendation for \'Latissimus dorsi\'"
            subTitle2.text = "중급자용 For Intermediate"
        }else{
            topTitle.text = "가장 많이 본 영상 Top workout Videos"
            subTitle.text = "\'상복근\' 추천 루틴 Recommendation for \'Upper Abs\'"
            subTitle2.text = "초보용 For Beginners"
        }
        
        
        // Notification : Recommened가 설정됐을 때
        NotificationCenter.default.addObserver(self, selector: #selector(self.onRecommended), name: NSNotification.Name.init("recommendationKey"), object: nil)
        
        // Notification : Ad가 설정됐을 때
        NotificationCenter.default.addObserver(self, selector: #selector(self.onAd), name: NSNotification.Name.init("adKey"), object: nil)
        
        list.append(Video(id: "P8CDv4dgHEM", videoName: "전신운동 춤 갓 조쉬 앤 바믜", videoEng: "Dance good for losing weight"))
        list.append(Video(id: "llwXGZlgdU0", videoName: "레베카 루이즈 운동", videoEng: "Rebeca Louis Workout"))
        list.append(Video(id: "XTH5saFBDqA", videoName: "다리운동", videoEng: "Leg Workout"))
        list.append(Video(id: "1KGU6iB5MVE", videoName: "다이어트 자극 영상", videoEng: "Do workout"))
        list.append(Video(id: "wc_PizWNp6k", videoName: "비욘세 Move Your body", videoEng: "Beyonce : Move Your body"))
        setRoutineScrollView()
        
        aiView.layer.cornerRadius = 4.0
        aiView.clipsToBounds = true
        speak(text: "안녕하세요, 오늘은 \'레베카 루이즈 11자 복근\' 운동 어떠신가요?")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCloseAd(_ sender: Any) {
        UIView.animate(withDuration: 2.0, animations: {
            self.aiView.alpha = 0.0
            self.aiView.isHidden = true
        })
    }
    
    @IBAction func onTouchYoga(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.id = "2c_oijA34Z8"
        self.show(vc, sender: nil)
    }
    
    @IBAction func onTouchRndBtn(_ sender: Any) {
        speak(text: "강도 높은 운동을 자주 하신 것 같아요. 오늘은 이런 운동, 어떠세요? \'힐링요가\', \'10분 스트레칭\'")
        let when = DispatchTime.now() + 40
    }

    @objc func onRecommended(){
        if Global.isRecommended {
            topTitle.text = "이어보기 Continue Watching"
            subTitle.text = "\'광배근\' 추천 루틴 Recommendation for \'Latissimus dorsi\'"
            subTitle2.text = "중급자용 For Intermediate"
        }else{
            topTitle.text = "가장 많이 본 영상 Top workout Videos"
            subTitle.text = "\'상복근\' 추천 루틴 Recommendation for \'Upper Abs\'"
            subTitle2.text = "초보용 For Beginners"
        }
    }
    
    @objc func onAd(){
        if (Global.adVar != 0) && (Global.adVar % 3 == 0){
            aiView.isHidden = false
            aiView.alpha = 1.0
        }
    }
    @objc func pressed(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.id = globalID
        self.show(vc, sender: nil)
    }
    
    func loadYoutube(webView: UIWebView, videoID videoID:String) {
        // create a custom youtubeURL with the video ID
        guard
            let youtubeURL = NSURL(string: "https://www.youtube.com/embed/\(videoID)")        
            else { return }
        // load your web request
        webView.loadRequest( URLRequest(url: youtubeURL as URL) )
    }
    
    func setScrollView(){
        let webViewWidth = 540
        let webViewHeight = 300
        var xPosition = 0
        self.scrollView.contentSize = CGSize(width: (webViewWidth+40)*youtubeIDList.count, height: webViewHeight)
        self.scrollView.contentOffset.y = 0
        for id in youtubeIDList {
            let videoView = MainVideo.instanceFromNib();
            videoView.frame = CGRect(x: xPosition, y: 0, width: webViewWidth, height: webViewHeight)
            videoView.url = id
            if id == "llwXGZlgdU0" {
                 videoView.videoName.text = "레베카 루이즈 11자 복근"
            }else{
                 videoView.videoName.text = "10분 심장 강화 운동"
            }
            videoView.nextBtn.addTarget(nil, action: #selector(self.pressed), for: .touchUpInside)
            loadYoutube(webView: videoView.webView, videoID: id)
            scrollView.addSubview(videoView)
            xPosition += webViewWidth+40
        }
        
    }
    func setRoutineScrollView(){
        let webViewWidth = 210
        let webViewHeight = 140
        var xPosition = 0
        self.routineScrollView.contentSize = CGSize(width: (webViewWidth+20)*list.count, height: webViewHeight)
        self.routineScrollView.contentOffset.y = 0
        
        for video in list {
            let routineView = Routine.instanceFromNib()
            routineView.frame = CGRect(x: xPosition, y: 0, width: webViewWidth, height: webViewHeight)
            loadYoutube(webView: routineView.videoView, videoID: video.id)
            routineView.videoName.text = video.videoName
            routineView.videoNameEng.text = video.videoEng
            routineScrollView.addSubview(routineView)
            xPosition += webViewWidth+20
        }
    }
    
    func speak(text: String){
        let synthesizer = AVSpeechSynthesizer()
        
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        utterance.rate = 0.5
        
        synthesizer.speak(utterance)
    }
   

}

