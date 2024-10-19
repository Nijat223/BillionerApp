//
//  QuestionHeaderView.swift
//  BillionerApp
//
//  Created by Nijat Shikhaliyev on 11.10.24.
//

import UIKit

class QuestionHeaderView: UICollectionReusableView {
    @IBOutlet private weak var questionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        questionLabel.layer.cornerRadius = 25
        questionLabel.backgroundColor = .clear
        questionLabel.layer.backgroundColor = UIColor.white.cgColor
    }
    
    func configureView(model: Question) {
        questionLabel.text = model.title
    
    }
}
