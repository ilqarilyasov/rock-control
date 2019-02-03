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
    var scrollingBallFirstXPoint: CGFloat! {
        return 10.0 + (scrollingBallView.bounds.width / 2)
    }
    var scrollingBallLastXPoint: CGFloat! {
        return 300.0 - 10.0 - (scrollingBallView.bounds.width / 2)
    }
    
    // MARK: - Touch handlers
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        print("Touched \(touchPoint)")
        
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDown])
            moveScrollingBall(to: touchPoint, bound: bounds)
        }
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            sendActions(for: [.valueChanged, .touchDragInside])
            moveScrollingBall(to: touchPoint, bound: bounds)
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
            moveScrollingBallWhenTouchEnds(to: touchPoint, bound: bounds)
        } else {
            sendActions(for: [.touchDragOutside])
            moveScrollingBallWhenTouchEnds(to: touchPoint, bound: bounds)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    // MARK: - Update views position
    
    private func moveScrollingBall(to touchPoint: CGPoint, bound: CGRect) {
        
        if touchPoint.x <= (self.scrollingBallView.bounds.width / 2) {
            self.layoutIfNeeded()
            UIView.animate(withDuration: 0.5) {
                self.scrollingBallView.center.x = touchPoint.x + (self.scrollingBallView.bounds.width / 2)
            }
        } else if touchPoint.x >= (bound.maxX * 0.8) {
            self.layoutIfNeeded()
            UIView.animate(withDuration: 0.5) {
                self.scrollingBallView.center.x = touchPoint.x - (self.scrollingBallView.bounds.width / 2)
            }
        } else {
            self.layoutIfNeeded()
            UIView.animate(withDuration: 0.5) {
                self.scrollingBallView.center.x = touchPoint.x  - (self.scrollingBallView.bounds.width / 2)
            }
        }
        value = scrollingBallView.center.x >= (bound.maxX * 0.8) ? true : false
    }
    
    private func moveScrollingBallWhenTouchEnds(to touchPoint: CGPoint, bound: CGRect) {
        
        if scrollingBallView.center.x >= (bound.maxX * 0.8) {
            self.layoutIfNeeded()
            UIView.animate(withDuration: 0.7) {
                self.scrollingBallView.center.x = self.scrollingBallLastXPoint
            }
        } else {
            self.layoutIfNeeded()
            UIView.animate(withDuration: 0.7) {
                self.scrollingBallView.center.x = self.scrollingBallFirstXPoint
            }
        }
        
        value = scrollingBallView.center.x >= (bound.maxX * 0.8) ? true : false
    }
}
