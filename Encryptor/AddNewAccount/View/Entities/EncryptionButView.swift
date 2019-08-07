//
//  EncryptionButView.swift
//  Encryptor
//
//  Created by Ацамаз Бицоев on 06/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import UIKit


class EncryptionButView: UIButton {

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        addTargets()
        stateChangedToStart()
        setTextLabel()
    }
    
    
    override var frame: CGRect {
        didSet {
            if oldValue.width < frame.width {
                frame = oldValue
            }
        }
    }
    
    override var bounds: CGRect {
        didSet {
            if oldValue.width < bounds.width {
                bounds = oldValue
            }
        }
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }
    
    
    private var imageViewRotating: UIImageView = UIImageView()
    
    
    private func setTextLabel() {
        
        setTitleColor(#colorLiteral(red: 0.2823529412, green: 0.2039215686, blue: 0.831372549, alpha: 1), for: .normal)
    }
    
    
    private var buttonState: EncryptionButViewState = .start {
        didSet {
            switch buttonState {
            case .start:
                stateChangedToStart()
            case .loading:
                stateChangedToLoading()
            case .ready:
                stateChangedToReady()
            }
        }
    }
    
    
    var actionEncrypt: () -> () = {}
    var actionOnFinish: () -> () = {}
    
    
    private func addTargets() {
        
        addTarget(self,
                  action: #selector(touchUpInside),
                  for: .touchUpInside)
    }
    
    
    @objc private func touchUpInside() {
        isUserInteractionEnabled = false
        nextState()
        actionEncrypt()
    }
    
    
    private func nextState() {
        switch buttonState {
        case .start:
            buttonState = .loading
        case .loading:
            buttonState = .ready
        case .ready:
            buttonState = .ready
        }
    }
    
    
    private func stateChangedToStart() {
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }
    
    private func stateChangedToLoading() {
        hideLabTitle()
        transformToCircle()
        showAnimationImage()
    }
    
    private func stateChangedToReady() {
        imageViewRotating.image = #imageLiteral(resourceName: "Щит")
        Timer.scheduledTimer(withTimeInterval: 1,
                             repeats: false) { (_ ) in
                                self.actionOnFinish()
        }
    }
    
    
    private func transformToCircle() {
        
        let circleRadius = bounds.height / 2
        
        UIView.animate(withDuration: 0.3,
                       animations: {

                        self.frame = CGRect(x: self.center.x - circleRadius,
                                            y: self.center.y - circleRadius,
                                            width: circleRadius * 2,
                                            height: circleRadius * 2)
        })
    }
    
    private func hideLabTitle() {
        let rect = CGRect(x: 0, y: 0, width: bounds.height, height: bounds.height)
        let whiteView = UIView(frame: rect)
        whiteView.backgroundColor = .white
        self.addSubview(whiteView)
    }
    
    private func showAnimationImage() {
        imageViewRotating.frame = CGRect(x: 0, y: 0, width: bounds.height, height: bounds.height).inset(by: UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15))
        imageViewRotating.contentMode = .scaleAspectFit
        imageViewRotating.image = #imageLiteral(resourceName: "spinner-circle")
        self.addSubview(imageViewRotating)
        
        let basicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        basicAnimation.duration = 3
        basicAnimation.toValue = CGFloat.pi * 6
        basicAnimation.isCumulative = true
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        self.imageViewRotating.layer.add(basicAnimation, forKey: "gaugeRotationAnimation")
        
        setTimerGoingToReady()
    }
    
    private func setTimerGoingToReady() {
        
        Timer.scheduledTimer(withTimeInterval: 3,
                             repeats: false) { (_ ) in
                                self.buttonState = .ready
        }
    }

}


enum EncryptionButViewState {
    case start
    case loading
    case ready
}
