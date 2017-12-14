//
//  ExpViewController.swift
//  hciProject
//
//  Created by 준킴 on 2017. 12. 11..
//  Copyright © 2017년 junebuug. All rights reserved.
//

import UIKit
import AVFoundation
class ExpViewController: UIViewController {

    @IBOutlet weak var novice: UIButton!
    @IBOutlet weak var intermediate: UIButton!
    @IBOutlet weak var expert: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let synthesizer = AVSpeechSynthesizer()
        let synthesizer2 = AVSpeechSynthesizer()
        
        let utterance = AVSpeechUtterance(string: "선택한 운동에 얼마나 익숙한가요? 다음 버튼 중 하나를 선택해주세요.")
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        utterance.rate = 0.5
        
        synthesizer.speak(utterance)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTouchNoviceBtn(_ sender: Any) {
        if novice.isSelected {
            novice.isSelected = false
        }else{
            novice.isSelected = true
            intermediate.isSelected = false
            expert.isSelected = false
        }
    }
    
    @IBAction func onTouchIntermediateBtn(_ sender: Any) {
        if intermediate.isSelected {
            intermediate.isSelected = false
        }else{
            intermediate.isSelected = true
            novice.isSelected = false
            expert.isSelected = false
        }
    }
    
    @IBAction func onTouchExpertBtn(_ sender: Any) {
        if expert.isSelected {
            expert.isSelected = false
        }else{
            expert.isSelected = true
            novice.isSelected = false
            intermediate.isSelected = false
        }
    }
    

}
