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
    var scrollView: UIView!
    var scrollingBallView: BallControl!
    var resetButton: UIBarButtonItem!
    
    
    // MARK: - Lifecycle functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawResetBarButtonItem()
        drawMainView()
        drawStackView()
        drawLockImageView()
        drawScrollView()
        drawScrollingBallView()
        view.backgroundColor = .lightGray
        title = "Locked"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Drawings
    
    private func drawResetBarButtonItem() {
        resetButton = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(resetTapped))
        navigationItem.rightBarButtonItem = resetButton
        resetButton.isEnabled = false
    }
    
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
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
    }
    
    private func drawLockImageView() {
        lockImageView = UIImageView()
        stackView.addArrangedSubview(lockImageView)
        
        lockImageView.translatesAutoresizingMaskIntoConstraints = false
        lockImageView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        lockImageView.contentMode = .scaleAspectFit
        lockImageView.image = UIImage(named: "lock")!
    }
    
    private func drawScrollView() {
        scrollView = UIView()
        stackView.addArrangedSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        scrollView.layer.cornerRadius = 25
        scrollView.backgroundColor = .gray
        
//        scrollView.addTarget(self, action: #selector(scrollViewAction),
//                             for: [.touchDown, .touchDragInside, .valueChanged, .touchDragOutside, .touchUpInside, .touchUpOutside])
    }
    
    private func drawScrollingBallView() {
        scrollingBallView = BallControl()
        scrollView.addSubview(scrollingBallView)
        
        scrollingBallView.translatesAutoresizingMaskIntoConstraints = false
        scrollingBallView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        scrollingBallView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
        scrollingBallView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        scrollingBallView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scrollingBallView.layer.cornerRadius = 25
        scrollingBallView.backgroundColor = .black
//        scrollView.scrollingBallView = scrollingBallView
        scrollingBallView.scrollingBallView = scrollingBallView
        scrollingBallView.addTarget(self, action: #selector(ballViewAction),
                                     for: [.touchDown, .touchDragInside, .valueChanged, .touchDragOutside, .touchUpInside, .touchUpOutside])
    }
    
    // MARK: - Bar button action
    
    @objc func resetTapped(_ sender: Any) {
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.7) {
            self.lockImageView.image = UIImage(named: "lock")
            self.scrollingBallView.frame.origin.x = 10
            self.resetButton.isEnabled = !self.resetButton.isEnabled
//            self.scrollView.isEnabled = true
            self.scrollingBallView.isEnabled = true
            self.view.backgroundColor = .lightGray
//            self.scrollView.value = false
            self.scrollingBallView.value = false
            self.title = "Lock"
        }
    }
    
    // MARK: - Scroll view action
    
//    @objc func scrollViewAction(sender: LockControl) {
//        guard let value = sender.value, value == true else { return }
//        updateViews(value: value)
//        sender.isEnabled = value ? false : true
//    }
    
    @objc func ballViewAction(sender: BallControl) {
        guard let value = sender.value, value == true else { return }
        updateViews(value: value)
        sender.isEnabled = value ? false : true
    }
    
    // MARK: - Helper methods
    
    private func updateViews(value: Bool) {
        let imageName = value ? "unlock" : "lock"
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.7) {
            self.lockImageView.image = UIImage(named: imageName)
            self.resetButton.isEnabled = value ? true : false
            self.view.backgroundColor = .white
            self.title = "Unlocked"
        }
    }
}

