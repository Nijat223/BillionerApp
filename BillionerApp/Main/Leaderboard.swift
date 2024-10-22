//
//  Leaderboard.swift
//  BillionerApp
//
//  Created by Nijat Shikhaliyev on 18.10.24.
//

import UIKit

class Leaderboard: UIViewController {

    @IBOutlet weak var leaderView: UIView!
    @IBOutlet weak var leaderScore: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
        
        override func viewDidLoad() {
            super.viewDidLoad()
            leaderViewCheck()
            setResult()
           
        }
        
        func leaderViewCheck(){
            leaderView.layer.cornerRadius = 10
            
        }
        
        func setResult() {
            let name = UserDefaults.standard.string(forKey: "Name")
//            let leader = UserDefaults.standard.string(forKey: "Leader")

            
            nameLabel.text = name
//            leaderScore.text = leader
            
        }
        

    }
