//
//  AccountCell.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 05/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import UIKit

class AccountCell: UITableViewCell {
    
    
    @IBOutlet weak var sliderView: SliderView!
    var title: String?

    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureSlider()
        layoutIfNeeded()
    }

    
    private func configureSlider() {
        
        sliderView.butColor1 = #colorLiteral(red: 0.9371625781, green: 0.9373195171, blue: 0.9371418357, alpha: 1)
        sliderView.butColor2 = #colorLiteral(red: 0.748944819, green: 0.7490720153, blue: 0.7489280701, alpha: 1)
        sliderView.myCornerRadius = 18
        guard let title = self.title else { return }
        sliderView.titleText = title
    }

}
