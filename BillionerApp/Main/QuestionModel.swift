//
//  QuestionModel.swift
//  BillionerApp
//
//  Created by Nijat Shikhaliyev on 12.10.24.
//

import Foundation
import UIKit

struct Question {
    let title: String
    var answer: [Answer]
}

struct Answer {
    let title: String
    let correct: Bool
    var color: UIColor = .clear
}
