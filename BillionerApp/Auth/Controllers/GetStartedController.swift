//
//  GetStartedController.swift
//  BillionerApp
//
//  Created by Nijat Shikhaliyev on 07.10.24.
//

import UIKit

final class GetStartedController: UIViewController{
    @IBOutlet private weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
    }
    
    fileprivate func configureButton() {
        submitButton.addTarget(self, action: #selector(submitButtonClicked), for: .touchUpInside)
        submitButton.setTitle("Get Started", for: .normal)
    }
    
    fileprivate func configureUI() {
        
    }
    
    @objc
    fileprivate func submitButtonClicked() {
        showLoginController()
    }
    
    fileprivate func showLoginController() {
        let vc = UIStoryboard.init(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "LoginController") as? LoginController ?? LoginController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
