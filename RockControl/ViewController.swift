//
//  ViewController.swift
//  RockControl
//
//  Created by Ilgar Ilyasov on 2/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - Properties
    
    var mainView: UIView!
    var stackView: UIStackView!
    var lockImageView: UIImageView!
    var scrollView: LockControl!
    var scrollingBallView: UIView!
    
    
    // MARK: - Lifecycle functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawMainView()
        drawStackView()
        drawLockImageView()
        drawScrollView()
        drawScrollingBallView()
    }

    
    // MARK: - Bar button action

    @IBAction func resetTapped(_ sender: Any) {
        
        
        
    }
    
    // MARK: - Drawings
    
    private func drawMainView() {
        mainView = UIView()
        view.addSubview(mainView)
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mainView.widthAnchor.constraint(equalToConstant: 320).isActive = true
        mainView.heightAnchor.constraint(equalToConstant: 320).isActive = true
        
        mainView.backgroundColor = .lightGray
        mainView.layer.cornerRadius = 20
    }
    
    private func drawStackView() {
        stackView = UIStackView()
        mainView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        stackView.layer.cornerRadius = 25
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
    }
    
    private func drawLockImageView() {
        let lockImageView = UIImageView()
        stackView.addArrangedSubview(lockImageView)
        
        lockImageView.translatesAutoresizingMaskIntoConstraints = false
        lockImageView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        lockImageView.contentMode = .scaleAspectFit
        lockImageView.image = UIImage(named: "lock")!
    }
    
    private func drawScrollView() {
        scrollView = LockControl()
        stackView.addArrangedSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        scrollView.layer.cornerRadius = 25
        scrollView.backgroundColor = .gray
        
        scrollView.addTarget(self, action: #selector(scrolViewAction), for: .valueChanged)
    }
    
    private func drawScrollingBallView() {
        scrollingBallView = UIView()
        scrollView.addSubview(scrollingBallView)
        
        scrollingBallView.translatesAutoresizingMaskIntoConstraints = false
        scrollingBallView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        scrollingBallView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
        scrollingBallView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        scrollingBallView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scrollingBallView.layer.cornerRadius = 25
        scrollingBallView.backgroundColor = .black
    }
    
    // MARK: - Scroll view action
    
    @objc func scrolViewAction(sender: LockControl) {
        print("Values changed")
    }
    
    private func updateScrollingBallViewLocation() {
        
    }
    
    private func toggleLockImageViewImage() {
        
    }
}

