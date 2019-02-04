//
//  BallControl.swift
//  RockControl
//
//  Created by Ilgar Ilyasov on 2/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class BallControl: UIControl {
    
    var scrollingBallView = UIView()
    var value: Bool?
    var currentTouchPoint: CGPoint!
    var previousTouchPoint: CGPoint!
    var differenceX: CGFloat!
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        sendActions(for: [.touchDown])
        print("Began")
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        currentTouchPoint = touch.location(in: self)
        previousTouchPoint = touch.previousLocation(in: self)
        
        if previousTouchPoint.x > 0 {
           differenceX = currentTouchPoint.x - previousTouchPoint.x
        } else if previousTouchPoint.x < 0 {
            differenceX = currentTouchPoint.x + previousTouchPoint.x
        }
        
        if bounds.contains(currentTouchPoint) {
            if differenceX > 0 && center.x <= 265 {
                sendActions(for: [.touchDragInside])
                layoutIfNeeded()
                UIView.animate(withDuration: 0.5) {
                    self.center.x += self.differenceX
                }
            } else if differenceX < 0 && center.x >= 35 {
                sendActions(for: [.touchDragInside])
                layoutIfNeeded()
                UIView.animate(withDuration: 0.5) {
                    self.center.x += self.differenceX
                }
            }
        } else {
            sendActions(for: [.touchDragOutside])
        }
        value = center.x >= 240 ? true : false
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        
        guard let touchPoint = touch?.location(in: self) else { return }
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside])
            if center.x >= 240 {
                layoutIfNeeded()
                UIView.animate(withDuration: 0.5) {
                    self.center.x = 265
                }
            } else {
                layoutIfNeeded()
                UIView.animate(withDuration: 0.5) {
                    self.center.x = 35
                }
            }
        } else {
            sendActions(for: [.touchUpOutside])
            if center.x >= 240 {
                layoutIfNeeded()
                UIView.animate(withDuration: 0.5) {
                    self.center.x = 265
                }
            } else {
                layoutIfNeeded()
                UIView.animate(withDuration: 0.5) {
                    self.center.x = 35
                }
            }
        }
        value = center.x >= 240 ? true : false
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
}
