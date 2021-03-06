//
//  SettingsFinalViewController.swift
//  hciProject
//
//  Created by 준킴 on 2017. 12. 12..
//  Copyright © 2017년 junebuug. All rights reserved.
//

import UIKit
import AVFoundation
class SettingsFinalViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let synthesizer = AVSpeechSynthesizer()
        
        let utterance = AVSpeechUtterance(string: "이제 모두 완료되었어요. 아래 버튼을 눌러 운동을 시작하세요.")
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        utterance.rate = 0.5
        
        synthesizer.speak(utterance)
        
        // Do any additional setup after loading the view.
    }

    @IBAction func onEnd(_ sender: Any) {
        Global.isRecommended = true
        _ = navigationController?.popToRootViewController(animated: true)
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
