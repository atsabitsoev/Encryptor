//
//  RoundedCornersView.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 05/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedCornersView: UIView {

    
    @IBInspectable var upLeft: Bool = false
    @IBInspectable var upRight: Bool = false
    @IBInspectable var downLeft: Bool = false
    @IBInspectable var downRight: Bool = false
    @IBInspectable var color: UIColor = .white
    
    
    override func draw(_ rect: CGRect) {
        drawCorners()
    }
    
    
    private func drawCorners() {
        var allCorners: [UIRectCorner] = [.topLeft, .topRight, .bottomLeft, .bottomRight]
        var masCorners: UIRectCorner = []
        
        var masBools = [upLeft, upRight, downLeft, downRight]
        for i in 0..<masBools.count {
            if masBools[i] {
                masCorners.insert(allCorners[i])
            }
        }
        
        let cornerRadius = bounds.width / 375 * 70
        
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: masCorners,
                                cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        
        color.setFill()
        path.fill()
    }

}
