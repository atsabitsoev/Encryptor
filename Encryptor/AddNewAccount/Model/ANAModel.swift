//
//  ANAModel.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 06/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation


class ANAModel: ANAModelDelegate {
    
    
    required init(controller: ANAControllerDelegate) {
        self.controller = controller
    }
    
    
    private var controller: ANAControllerDelegate!
}
