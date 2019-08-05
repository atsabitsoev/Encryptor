//
//  LOPController.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 05/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation


class LOPController: LOPControllerDelegate {
    
    
    required init(view: LOPViewDelegate) {
        
        self.view = view
        self.model = LOPModel(controller: self)
    }
    
    
    func viewDidLoad() {
        view.makeNavBarTranslucent()
    }
    
    
    private var view: LOPViewDelegate!
    private var model: LOPModelDelegate!
    
}
