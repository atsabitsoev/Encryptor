//
//  ANAController.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 06/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation


class ANAController: ANAControllerDelegate {
    
    
    required init(view: ANAViewDelegate) {
        self.veiw = view
        self.model = ANAModel(controller: self)
    }
    
    
    private var view: ANAViewDelegate!
    private var model: ANAModelDelegate!
}
