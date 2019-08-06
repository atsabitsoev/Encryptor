//
//  ANAView.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 06/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import UIKit

class ANAView: UIViewController, ANAViewDelegate {
    
    
    private var controller: ANAControllerDelegate!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    
    private func configureView() {
        self.controller = ANAController(view: self)
    }

}
