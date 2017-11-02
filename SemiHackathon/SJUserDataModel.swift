//
//  SJUserDataModel.swift
//  SemiHackathon
//
//  Created by Sangjun Lee on 02/11/2017.
//  Copyright © 2017 esung. All rights reserved.
//

import UIKit

struct User{
    private var resultScoreByType: [PersonalityType: CGFloat]
    init(){
        resultScoreByType = [.D: 0, .I: 0, .S: 0, .C: 0]
    }
    mutating func increaseScore(of type: PersonalityType){
        resultScoreByType[type]! += 1
    }
    
    var point: Point{
        var x: CGFloat = 0
        var y: CGFloat = 0
        for (type, score) in resultScoreByType{
            switch type{
            case .D:
                x -= score
                y += score
            case .I:
                x += score
                y += score
            case .S:
                x += score
                y -= score
            case .C:
                x -= score
                y -= score
            }
        }
        return Point(x: x, y: y)
    }

//    var personalityType: PersonalityType {
//        var result: [String: Int] = [:]
//        for (type, score) in resultScoreByType{
//            result[type.rawValue] = Int(score)
//        }
//        return result
//    }
}
