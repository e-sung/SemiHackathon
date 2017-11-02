//
//  SJUserDataModel.swift
//  SemiHackathon
//
//  Created by Sangjun Lee on 02/11/2017.
//  Copyright © 2017 esung. All rights reserved.
//

import Foundation

struct User{
    private var resultScoreByType: [PersonalityType: Int]
    init(){
        resultScoreByType = [.D: 0, .I: 0, .S: 0, .C: 0]
    }
    mutating func increaseScore(of type: PersonalityType){
        resultScoreByType[type]! += 1
    }
    var result: [String: Int]{
        var result: [String: Int] = [:]
        for (type, score) in resultScoreByType{
            result[type.rawValue] = score
        }
        return result
    }
}
