//
//  ResultViewController.swift
//  SemiHackathon
//
//  Created by Sangjun Lee on 02/11/2017.
//  Copyright © 2017 esung. All rights reserved.
//

import UIKit


class ResultViewController: UIViewController {
    
    let coordinatesView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2
        return view
    }()
    
    let coordinatesTypeLabels: [UILabel] = {
        let labelTexts = ["D", "I", "S", "C"]
        var labels: [UILabel] = []
        for i in 0..<labelTexts.count{
            let label = UILabel()
            label.text = labelTexts[i]
            labels.append(label)
            label.textAlignment = .center
        }
        return labels
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
    
    let goToInitialScreenButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("시작화면으로 가기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.layer.backgroundColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        
        return button
    }()
    
    let findSimilarPeopleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("비슷한 사람 보기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.layer.backgroundColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
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
        coordinatesView.draw(coordinates: coordinates)
    }
    
    func setupViews(){
        view.backgroundColor = .white
        
        view.addSubview(coordinatesView)
        
        //좌표 화면 그리기
        coordinatesView.anchor(to: view, topSpacing: 50, leftSpacing: 50, bottomSpacing: nil, rightSpacing: 50, width: nil, height: 200)
        coordinatesView.addAxes(color: .black)
        coordinatesView.layoutIfNeeded()
        addCoordinatesLabels(to: coordinatesView)
        //나의 예상 레이블 설정
        view.addSubview(guessLabel)
        guessLabel.anchor(top: coordinatesView.bottomAnchor, left: coordinatesView.leftAnchor, bottom: nil, right: coordinatesView.rightAnchor, topSpacing: 20, leftSpacing: 0, bottomSpacing: nil, rightSpacing: 0, width: nil, height: 30)
        
        //타입 설명 텍스트뷰 설정
        view.addSubview(textView)
        textView.anchor(top: guessLabel.bottomAnchor, left: coordinatesView.leftAnchor, bottom: nil, right: coordinatesView.rightAnchor, topSpacing: 20, leftSpacing: 0, bottomSpacing: nil, rightSpacing: 0, width: nil, height: nil)
        
        //하단 버튼 추가
        let stackView = UIStackView(arrangedSubviews: [goToInitialScreenButton, findSimilarPeopleButton])
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 15
        
        view.addSubview(stackView)
        stackView.anchor(top: textView.bottomAnchor, left: coordinatesView.leftAnchor, bottom: view.bottomAnchor, right: coordinatesView.rightAnchor, topSpacing: 20, leftSpacing: 0, bottomSpacing: 30, rightSpacing: 0, width: nil, height: 50)
        textView.setContentOffset(.zero, animated: false)

    }
    
    func addCoordinatesLabels(to container: UIView){
        let labelWidth = container.frame.width / 2
        let labelHeight = container.frame.height / 2
        let firstQuadrant = CGPoint(x: labelWidth + 1, y: 0)
        let secondQuadrant = CGPoint(x: 0, y: 0)
        let thirdQuadrant = CGPoint(x: 0, y: labelHeight + 1)
        let fourthQuadrant = CGPoint(x: labelWidth + 1, y: labelHeight + 1)
        
        let quadrants: [CGPoint] = [secondQuadrant, firstQuadrant, fourthQuadrant, thirdQuadrant]
        
        for i in 0..<coordinatesTypeLabels.count{
            coordinatesTypeLabels[i].frame = CGRect(origin: quadrants[i], size: CGSize(width: labelWidth, height: labelHeight))
            container.addSubview(coordinatesTypeLabels[i])
        }
    }

    
}


