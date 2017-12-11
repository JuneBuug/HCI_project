//
//  ExpViewController.swift
//  hciProject
//
//  Created by 준킴 on 2017. 12. 11..
//  Copyright © 2017년 junebuug. All rights reserved.
//

import UIKit

class ExpViewController: UIViewController {

    @IBOutlet weak var novice: UIButton!
    @IBOutlet weak var intermediate: UIButton!
    @IBOutlet weak var expert: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()

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
