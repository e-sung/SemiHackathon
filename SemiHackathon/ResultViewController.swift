//
//  ResultViewController.swift
//  SemiHackathon
//
//  Created by Sangjun Lee on 02/11/2017.
//  Copyright © 2017 esung. All rights reserved.
//

import UIKit


class ResultViewController: UIViewController {
    
    let mainView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2
        return view
    }()
    let guessLabel: UILabel = {
       let label = UILabel()
        label.text = "나의 예상은? "
        label.backgroundColor = .white
        return label
    }()
    let textView: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = .white
        tv.layer.borderColor = UIColor.black.cgColor
        tv.layer.borderWidth = 2
        tv.isEditable = false
        return tv
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        print(mainView.frame.width)
        var coordinates = Coordinates()
        
        
        var user = User()
        user.increaseScore(of: .D)
        user.increaseScore(of: .D)
        user.increaseScore(of: .I)
        user.increaseScore(of: .S)
        user.increaseScore(of: .S)
        user.increaseScore(of: .I)
//        user.increaseScore(of: .I)
//        user.increaseScore(of: .C)
//        user.increaseScore(of: .C)
//        user.increaseScore(of: .D)
        
        if let userResult = user.personalityType{
            if let result = DataHandler.results.getResultData(of: userResult){
                textView.text = result.title + "\n" + result.content
            }
        }
        
        coordinates.addPoint(point: user.point)
        print(user.point)
        mainView.draw(coordinates: coordinates)
    }
    
    func setupViews(){
        view.backgroundColor = .white
        
        view.addSubview(mainView)
        
        //좌표 화면 그리기
        mainView.anchor(to: view, topSpacing: 50, leftSpacing: 50, bottomSpacing: nil, rightSpacing: 50, width: nil, height: 200)
        mainView.addAxes(color: .black)
        mainView.layoutIfNeeded()
        
        //나의 예상 레이블 설정
        view.addSubview(guessLabel)
        guessLabel.anchor(top: mainView.bottomAnchor, left: mainView.leftAnchor, bottom: nil, right: mainView.rightAnchor, topSpacing: 20, leftSpacing: 0, bottomSpacing: nil, rightSpacing: 0, width: nil, height: 30)
        
        //타입 설명 텍스트뷰 설정
        view.addSubview(textView)
        textView.anchor(top: guessLabel.bottomAnchor, left: mainView.leftAnchor, bottom: nil, right: mainView.rightAnchor, topSpacing: 20, leftSpacing: 0, bottomSpacing: nil, rightSpacing: 0, width: nil, height: 200)
    }

    
}


