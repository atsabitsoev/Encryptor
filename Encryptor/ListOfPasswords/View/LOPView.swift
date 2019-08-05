//
//  LOPView.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 05/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import UIKit

class LOPView: UIViewController, LOPViewDelegate {
    
    
    private var controller: LOPControllerDelegate!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
    
    
    private func configureView() {
        
        controller = LOPController(view: self)
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }

}
