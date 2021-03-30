//
//  ChainingTextViewController.swift
//  CoreAnimationDemo
//
//  Created by Alvin Tu on 3/29/21.
//  Copyright © 2021 Kaibo Lu. All rights reserved.
//

import UIKit

class ChainingTextViewController: UIViewController {
    let titleLabel = UILabel()
    let bodyLabel = UILabel()
    fileprivate func addLabels() {
        titleLabel.numberOfLines = 0
        titleLabel.text = "Welcome to company xyz"
        titleLabel.font = UIFont(name: "Futura", size: 34)
        bodyLabel.numberOfLines = 0
        bodyLabel.text = "hello there! welcome to my app! thanks so much for downloading this very magnificent app. please make sure to leave a good review and don't forget to give us lots of money to keep coding"
    }
    
    fileprivate func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, bodyLabel])
        
        stackView.axis = .vertical
        view.addSubview(stackView)
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLabels()
        setupStackView()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action:#selector(handleTapAnimations)))
    }
    
    @objc fileprivate func handleTapAnimations() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.titleLabel.alpha = 0
                self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -200)
            })
        }
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.bodyLabel.alpha = 0
                self.bodyLabel.transform = self.bodyLabel.transform.translatedBy(x: 0, y: -200)
            })
        }

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
