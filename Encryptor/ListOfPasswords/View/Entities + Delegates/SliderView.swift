//
//  SliderView.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 05/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import UIKit


@IBDesignable
class SliderView: UIView {
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    
    private func commonInit() {
        setDefaultValues()
    }
    
    override func layoutSubviews() {
        configureMainButton()
        layer.cornerRadius = myCornerRadius
    }
    
    
    private var slider: UIView = UIView()
    private var imageView: UIImageView = UIImageView()
    private var dragging = false
    
    
    @IBInspectable var butWidth: CGFloat = 100
    var butHeight: CGFloat!
    @IBInspectable var myCornerRadius: CGFloat = 0
    @IBInspectable var butColor1: UIColor = .red
    @IBInspectable var butColor2: UIColor = .blue
    
    
    var action: () -> () = {}
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        if touch.location(in: self).x >= 0 &&
            touch.location(in: self).x <= butWidth {
            dragging = true
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard dragging else { return }
        
        guard let touch = touches.first else { return }
        let touchX = touch.location(in: self).x
        var newSliderCenterX: CGFloat = 0
        if touchX < butWidth / 2 {
            newSliderCenterX = butWidth / 2
        } else if touchX > bounds.width - butWidth / 2 {
            newSliderCenterX = bounds.width - butWidth / 2
        } else {
            newSliderCenterX = touchX
        }
        
        slider.center.x = newSliderCenterX
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if slider.center.x >= bounds.width - butWidth / 2 {
            action()
            freezeSlider(seconds: 1)
        } else {
            goBackAnimation()
        }
        
        dragging = false
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        goBackAnimation()
    }
    
    
    private func setDefaultValues() {
        addSubview(slider)
        butHeight = bounds.height
        layer.masksToBounds = true
    }
    
    private func configureMainButton() {
        slider.frame = CGRect(x: 0,
                              y: 0,
                              width: butWidth,
                              height: butHeight)
        slider.layer.cornerRadius = myCornerRadius
        slider.layer.masksToBounds = true
        
        addSliderGradient()
        setArrowImage()
    }
    
    private func addSliderGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = slider.bounds
        gradient.colors = [butColor1.cgColor, butColor2.cgColor]
        slider.layer.addSublayer(gradient)
    }
    
    private func setArrowImage() {
        imageView.frame = slider.bounds.inset(by: UIEdgeInsets(top: 22, left: 22, bottom: 22, right: 22))
        imageView.image = UIImage(named: "Стрелка вправо")
        imageView.contentMode = .scaleAspectFit
        slider.addSubview(imageView)
    }
    
    private func goBackAnimation() {
        UIView.animate(withDuration: 0.3) {
            self.slider.center.x = self.butWidth / 2
        }
    }
    
    private func freezeSlider(seconds: TimeInterval) {
        isUserInteractionEnabled = false
        Timer.scheduledTimer(withTimeInterval: seconds,
                             repeats: false) { (timer) in
                                self.isUserInteractionEnabled = true
                                self.sliderToStartPosition()
        }
    }
    
    private func sliderToStartPosition() {
        
        UIView.animate(withDuration: 0.3) {
            self.slider.center.x = self.butWidth / 2
        }
    }

}
