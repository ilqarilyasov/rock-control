//
//  ViewController.swift
//  RockControl
//
//  Created by Ilgar Ilyasov on 2/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Super class lifecycle functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawMainView()
        drawLockImageView()
        drawScrollView()
        drawScrollingBallView()
    }
    
    // MARK: - Properties
    
    var mainView: UIView {
        let view = UIView()
        return view
    }
    
    var lockImageView: UIImageView {
        let imageView = UIImageView()
        return imageView
    }
    
    var scrollView: UIView {
        let view = LockControl()
        return view
    }
    
    var scrollingBallView: UIView {
        let view = UIView()
        return view
    }
    
    // MARK: - Bar button action

    @IBAction func resetTapped(_ sender: Any) {
        
        
        
    }
    
    // MARK: - Drawings
    
    private func drawMainView() {
        
    }
    
    private func drawLockImageView() {
        
    }
    
    private func drawScrollView() {
        
    }
    
    private func drawScrollingBallView() {
        
    }
}

