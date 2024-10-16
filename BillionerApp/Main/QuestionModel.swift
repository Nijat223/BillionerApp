//
//  QuestionModel.swift
//  BillionerApp
//
//  Created by Nijat Shikhaliyev on 12.10.24.
//

import Foundation
struct Question {
    let title: String
    let answer: [Answer]
}

struct Answer {
    let title: String
    let correct: Bool
}
