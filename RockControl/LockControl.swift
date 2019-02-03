//
//  LockControl.swift
//  RockControl
//
//  Created by Ilgar Ilyasov on 2/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class LockControl: UIControl {
    
    // MARK: - Properties

    var value: Bool?
    var scrollingBallView = UIView()
    
    // MARK: - Touch handlers
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        sendActions(for: [.touchDown])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            sendActions(for: [.valueChanged, .touchDragInside])
            updateBallFrame(touchPoint: touchPoint, bound: bounds)
        } else {
            sendActions(for: [.touchDragOutside])
        }
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        
        guard let touchPoint = touch?.location(in: self) else { return }
        
        if bounds.contains(touchPoint) {
            sendActions(for: [.valueChanged, .touchDragInside])
            moveScrollingBall(to: touchPoint, bound: bounds)
        } else {
            sendActions(for: [.touchDragOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    // MARK: - Update view
    
    private func updateBallFrame(touchPoint: CGPoint, bound: CGRect) {
        
        print(touchPoint.x)
        print(bound.minX)
        print(bound.maxX)
        
        if touchPoint.x <= (self.scrollingBallView.bounds.width / 2) {
            self.layoutIfNeeded()
            UIView.animate(withDuration: 0.5) {
                self.scrollingBallView.center.x = touchPoint.x + (self.scrollingBallView.bounds.width / 2)
            }
            value = false
        } else if touchPoint.x >= (bound.maxX * 0.8) {
            self.layoutIfNeeded()
            UIView.animate(withDuration: 0.5) {
                self.scrollingBallView.center.x = touchPoint.x - (self.scrollingBallView.bounds.width / 2)
            }
            value = true
        } else {
            self.layoutIfNeeded()
            UIView.animate(withDuration: 0.5) {
                self.scrollingBallView.center.x = touchPoint.x
            }
            value = false
        }
    }
    
    private func moveScrollingBall(to touchPoint: CGPoint, bound: CGRect) {
        
        if touchPoint.x >= (bound.maxX * 0.8) {
            self.layoutIfNeeded()
            UIView.animate(withDuration: 0.5) {
                self.scrollingBallView.center.x = bound.maxX - (self.scrollingBallView.bounds.width / 2)
            }
        } else {
            self.layoutIfNeeded()
            UIView.animate(withDuration: 0.5) {
                self.scrollingBallView.center.x = bound.minX + (self.scrollingBallView.bounds.width / 2)
            }
        }
    }
}
