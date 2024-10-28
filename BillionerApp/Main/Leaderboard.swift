//
//  Leaderboard.swift
//  BillionerApp
//
//  Created by Nijat Shikhaliyev on 18.10.24.
//

import UIKit

class Leaderboard: UIViewController {

    @IBOutlet weak var quitLabel: UIButton!
    @IBOutlet weak var leaderView: UIView!
    @IBOutlet weak var leaderScore: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
        
        override func viewDidLoad() {
            super.viewDidLoad()
            leaderViewCheck()
            setResult()
           
        }
    
    @IBAction func quitButton(_ sender: Any) {
        if let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate{
            scene.switchToMain()
        }
    }
        
        func leaderViewCheck(){
            leaderView.layer.cornerRadius = 10
            
        }
        
        func setResult() {
            let name = UserDefaults.standard.string(forKey: "Name")
            let scores = UserDefaults.standard.string(forKey: "scores")

            
            nameLabel.text = name
            leaderScore.text = scores
            
        }
        

    }
