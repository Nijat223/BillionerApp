//
//  ProfileController.swift
//  BillionerApp
//
//  Created by Nijat Shikhaliyev on 20.10.24.
//

import UIKit

class ProfileController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

     setupUI()
        
    }
    
    func setupUI() {
        let name = UserDefaults.standard.string(forKey: "name")
        let surname = UserDefaults.standard.string(forKey: "surname")
        let email = UserDefaults.standard.string(forKey: "email")
        
        nameLabel.text = name ?? ""
        surnameLabel.text = surname ?? ""
        emailLabel.text = email ?? ""
    }
    
    @IBAction func logOutButtonClicked(_ sender: Any){
        
    }



}
