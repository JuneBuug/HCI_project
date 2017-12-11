//
//  SettingsViewController.swift
//  hciProject
//
//  Created by 준킴 on 2017. 12. 11..
//  Copyright © 2017년 junebuug. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var muscleLabel: UILabel!
    @IBOutlet weak var proficiencyLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if Global.isRecommended {
            muscleLabel.text = "승모근, 광배근"
            proficiencyLabel.text = "중급자"
            
        }else{
            muscleLabel.text = "상복근"
            proficiencyLabel.text = "초보자"
        }
        
        // Notification : Recommened가 설정됐을 때
        NotificationCenter.default.addObserver(self, selector: #selector(self.onRecommended), name: NSNotification.Name.init("recommendationKey"), object: nil)
        
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "ic_back")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "ic_back")
//        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = UIColor.white
        // Do any additional setup after loading the view.
    }

    @objc func onRecommended(){
        if Global.isRecommended {
            muscleLabel.text = "승모근, 광배근"
            proficiencyLabel.text = "중급자"
            
        }else{
            muscleLabel.text = "상복근"
            proficiencyLabel.text = "초보자"
        }
        
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
