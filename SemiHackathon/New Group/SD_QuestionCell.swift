//
//  QuestionCell.swift
//  SemiHackathon
//
//  Created by esung on 2017. 11. 2..
//  Copyright © 2017년 esung. All rights reserved.
//

import UIKit

class SD_QuestionCell: UICollectionViewCell {
    @IBOutlet weak private var q1Button:UIButton!
    @IBOutlet weak private var q2Button:UIButton!
    @IBOutlet weak private var q3Button:UIButton!
    @IBOutlet weak private var q4Button:UIButton!
    private var closure:(()->Void)?
    func setClosure(_ closure:@escaping ()->Void){
        self.closure = closure
    }
    
    @IBAction private func q1ClickHandler(_ sender:UIButton){
        closure?()
    }
    @IBAction private func q2ClickHandler(_ sender:UIButton){
        closure?()
    }
    @IBAction private func q3ClickHandler(_ sender:UIButton){
        closure?()
    }
    @IBAction private func q4ClickHandler(_ sender:UIButton){
        closure?()
    }
    
    
}
