//
//  CircleProgressVC.swift
//  CoreAnimationDemo
//
//  Created by Alvin Tu on 3/5/21.
//  Copyright © 2021 Kaibo Lu. All rights reserved.
//

import UIKit

class CircleProgressVC: UIViewController {
    var topLabel = CountingLabel()
    var middleLabel = CountingLabel()
    var bottomLabel = CountingLabel()

    let topCircleShapeLayer = CAShapeLayer()
    let middleCircleShapeLayer = CAShapeLayer()
    let bottomCircleShapeLayer = CAShapeLayer()
    let rectangleShapeLayer = CAShapeLayer()
    let ovalShapeLayer = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        addThreeCircles()
    }
    
    
    
    @objc func handleTap(){
        
        let topPercentageValue:Float = 0.96
        let topAnimation = CABasicAnimation(keyPath: "strokeEnd")
        topAnimation.toValue = topPercentageValue
        topAnimation.duration = 2
        topAnimation.fillMode = CAMediaTimingFillMode.forwards
        topAnimation.isRemovedOnCompletion = false
        topLabel.count(fromValue: 1, to: 1000, withDuration: 2.0, andAnimationType: .EaseOut, andCounterType: .Int)

        
        let middlePercentageValue:Float = 0.48
        let middleAnimation = CABasicAnimation(keyPath: "strokeEnd")
        middleAnimation.toValue = middlePercentageValue
        middleAnimation.duration = 2
        middleAnimation.fillMode = CAMediaTimingFillMode.forwards
        middleAnimation.isRemovedOnCompletion = false
        middleLabel.count(fromValue: 0.0, to: middlePercentageValue, withDuration: 2.0, andAnimationType: .EaseIn, andCounterType: .Float)

        
        let bottomPercentageValue:Float = 0.23
        let bottomAnimation = CABasicAnimation(keyPath: "strokeEnd")
        bottomAnimation.toValue = bottomPercentageValue
        bottomAnimation.duration = 2
        bottomAnimation.fillMode = CAMediaTimingFillMode.forwards
        bottomAnimation.isRemovedOnCompletion = false
        bottomLabel.count(fromValue: 0.0, to: bottomPercentageValue, withDuration: 2.0, andAnimationType: .EaseOut, andCounterType: .Float)

        
        middleCircleShapeLayer.add(middleAnimation, forKey: "middleCircleDraw")
        topCircleShapeLayer.add(topAnimation, forKey: "topCircleDraw")
        bottomCircleShapeLayer.add(bottomAnimation, forKey: "bottomCircleDraw")

        
    }
    
    private func addThreeCircles() {
        let topCenter = CGPoint(x: view.center.x, y: view.center.y - 145 )
        let center = view.center
        let bottomCenter = CGPoint(x: view.center.x,y: view.center.y + 145)
        let radius: CGFloat = 70
        
        
        let topCircular = UIBezierPath(arcCenter: topCenter,
                                        radius: radius, startAngle: 0,
                                        endAngle: 2 * CGFloat.pi,
                                        clockwise: true)
        topCircleShapeLayer.path = topCircular.cgPath
        topCircleShapeLayer.fillColor = UIColor.black.cgColor
        topCircleShapeLayer.strokeColor = UIColor.systemGreen.cgColor
        topCircleShapeLayer.lineWidth = 10
        topCircleShapeLayer.strokeEnd = 0

        
        let middleCircularPath = UIBezierPath(arcCenter: center,
                                        radius: radius, startAngle: 0,
                                        endAngle: 2 * CGFloat.pi,
                                        clockwise: true)
        middleCircleShapeLayer.path = middleCircularPath.cgPath
        middleCircleShapeLayer.fillColor = UIColor.black.cgColor
        middleCircleShapeLayer.strokeColor = UIColor.systemYellow.cgColor
        middleCircleShapeLayer.lineWidth = 10
        middleCircleShapeLayer.strokeEnd = 0


        let bottomCircularPath = UIBezierPath(arcCenter: bottomCenter,
                                        radius: radius, startAngle: 0,
                                        endAngle: 2 * CGFloat.pi,
                                        clockwise: true)
        bottomCircleShapeLayer.path = bottomCircularPath.cgPath
        bottomCircleShapeLayer.fillColor = UIColor.black.cgColor
        bottomCircleShapeLayer.strokeColor = UIColor.systemRed.cgColor
        bottomCircleShapeLayer.lineWidth = 10
        bottomCircleShapeLayer.strokeEnd = 0



        
        
        view.layer.addSublayer(topCircleShapeLayer)
        view.layer.addSublayer(middleCircleShapeLayer)
        view.layer.addSublayer(bottomCircleShapeLayer)
        
        topLabel = CountingLabel(frame: CGRect(x: topCenter.x, y:topCenter.y, width: 100, height: 40))
        topLabel.textColor = .systemGreen
        middleLabel = CountingLabel(frame: CGRect(x: center.x, y:center.y, width: 100, height: 40))
        middleLabel.textColor = .systemYellow
        bottomLabel = CountingLabel(frame: CGRect(x: bottomCenter.x, y:bottomCenter.y, width: 100, height: 40))
        bottomLabel.textColor = .systemRed

        
        self.view.addSubview(topLabel)
        self.view.addSubview(middleLabel)
        self.view.addSubview(bottomLabel)

        
        
    }
    private func addCircle() {
        let center = view.center
        let circularPath = UIBezierPath(arcCenter: center,
                                        radius: 100, startAngle: 0,
                                        endAngle: 2 * CGFloat.pi,
                                        clockwise: true)
        
        
        middleCircleShapeLayer.path = circularPath.cgPath
        middleCircleShapeLayer.fillColor = UIColor.blue.cgColor
        middleCircleShapeLayer.strokeColor = UIColor.red.cgColor
        middleCircleShapeLayer.lineWidth = 10
        middleCircleShapeLayer.strokeEnd = 0
        view.layer.addSublayer(middleCircleShapeLayer)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    
    
    private func addRectangle() {
        
        let rentangularPath = UIBezierPath(roundedRect: CGRect(x: 105,
                                                               y: 85,
                                                               width: 100  ,
                                                               height: 100),
                                           byRoundingCorners: .allCorners,
                                           cornerRadii: CGSize(width: 30, height: 30))

        rectangleShapeLayer.path = rentangularPath.cgPath
        rectangleShapeLayer.fillColor = UIColor.cyan.cgColor
        
        rectangleShapeLayer.strokeColor = UIColor.systemGray.cgColor
        rectangleShapeLayer.lineWidth = 10
        rectangleShapeLayer.strokeEnd = 0
        view.layer.addSublayer(rectangleShapeLayer)


    }
    
    private func addOval(){
        
        let ovalPath = UIBezierPath(ovalIn: CGRect  (x: 120,
                                                 y: 390,
                                                 width: 80  ,
                                                 height: 150))
        ovalShapeLayer.path = ovalPath.cgPath
        ovalShapeLayer.fillColor = UIColor.systemGreen.cgColor
        ovalShapeLayer.strokeColor = UIColor.black.cgColor
        ovalShapeLayer.lineWidth = 30
        ovalShapeLayer.strokeEnd = 50
        view.layer.addSublayer(ovalShapeLayer)

    }
    
  
}
