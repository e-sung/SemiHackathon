//
//  SJQuestionDataModel.swift
//  SemiHackathon
//
//  Created by Sangjun Lee on 02/11/2017.
//  Copyright © 2017 esung. All rights reserved.
//

import Foundation

enum PersonalityType: String{
    case D = "d"
    case I = "i"
    case S = "s"
    case C = "c"
}

class QuestionDataHandler{
    static var main = QuestionDataHandler()
    
    //각 문항을 담고 있는 배열
    
    var questions: [Question] = []
    private init(){
        loadData()
    }
    
    //plist 파일에서 데이터를 불러와서 Question 구조체를 만든 뒤, 자신의 questions 배열에 담는다.
    func loadData(){
        if let path = Bundle.main.path(forResource: "exampleList", ofType: "plist"){
            guard let dict = NSDictionary(contentsOfFile: path) as? [String: [String: String]] else { return }
            for (_, question) in dict{
                let q = Question(data: question)
                questions.append(q)
            }
        }
    }
    
    //(디버깅 용도) 자신의 questions 배열을 프린트 한다.
    func printData(){
        for question in questions{
            print(question.options)
        }
    }
}

//문항: 네 가지의 선택지를 담은 구조체
struct Question{
    
    //각 (선택지, 성향 타입) 튜플을 담는 배열
    var options: [(String, PersonalityType)] = []
    
    init(data: [String: String]){
        
        //받은 데이터(딕셔너리)를 튜플 형태로 가공하여 options 배열에 넣는다.
        for (type, option) in data{
            switch type{
            case PersonalityType.D.rawValue:
                options.append((option, .D))
            case PersonalityType.I.rawValue:
                options.append((option, .I))
            case PersonalityType.S.rawValue:
                options.append((option, .S))
            case PersonalityType.C.rawValue:
                options.append((option, .C))
            default:
                break
            }
        }
    }
}
