//
//  PickerViewController.swift
//  hciProject
//
//  Created by 준킴 on 2017. 12. 11..
//  Copyright © 2017년 junebuug. All rights reserved.
//

import UIKit
import AVFoundation
class PickerViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    

    @IBOutlet weak var timePicker: UIPickerView!
    
    var time = [String]()
    var metric = ["분","시간"]
    override func viewDidLoad() {
        super.viewDidLoad()
        timePicker.delegate = self
        timePicker.dataSource = self
        
        for i in 1..<60 {
            time.append(i.description)
            timePicker.reloadAllComponents()
        }
        
        let synthesizer = AVSpeechSynthesizer()
        
        let utterance = AVSpeechUtterance(string: "어떤 주기로 운동하실 건가요?")
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            return time.count
        }else{
            return metric.count
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            return time[row]
        }else{
            return metric[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        if component == 0 {
            let attributedString = NSAttributedString(string: time[row], attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
            return attributedString
        }else{
            let attributedString = NSAttributedString(string: metric[row], attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
            return attributedString
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 54.0
    }

}
