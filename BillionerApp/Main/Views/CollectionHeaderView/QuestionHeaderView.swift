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
        // Initialization code
    }
    
    func configureView(model: Question) {
        questionLabel.text = model.title
    }
}
