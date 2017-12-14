//
//  RecommendationViewController.swift
//  hciProject
//
//  Created by 준킴 on 2017. 12. 12..
//  Copyright © 2017년 junebuug. All rights reserved.
//

import UIKit
import AVFoundation
class RecommendationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let synthesizer = AVSpeechSynthesizer()
        
        let utterance = AVSpeechUtterance(string: "안녕하세요! 원하는 운동을 추천해드리기 위해, 몇가지만 여쭤볼게요.")
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        utterance.rate = 0.5
        
        synthesizer.speak(utterance)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
