//
//  Mission.swift
//  Hack2018
//
//  Created by CharlesOlivier Demers on 18-01-20.
//  Copyright © 2018 Charles-Olivier Demers. All rights reserved.
//

import Foundation
import CoreLocation

class Mission {
    var title: String!
    var description: String!
    var position: CLLocationCoordinate2D!
    var reward: Int!
    var questions = [Question]()
    var feedback: String!
    var lang: String!
    var completed: Bool!
    
    init(title: String, description: String, position: CLLocationCoordinate2D, reward: Int, questions: [Question], feedback: String, lang: String, completed: Bool) {
        
        self.title = title
        self.description = description
        self.position = position
        self.reward = reward
        self.questions = questions
        self.feedback = feedback
        self.lang = lang
        self.completed = completed
    }
}

struct Question {
    var title: String!
    var answer = [Answer]()
}

struct Answer {
    var text: String!
    var isCorrect: Bool!
}