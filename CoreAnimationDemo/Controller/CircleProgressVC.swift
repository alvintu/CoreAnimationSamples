//
//  CircleProgressVC.swift
//  CoreAnimationDemo
//
//  Created by Alvin Tu on 3/5/21.
//  Copyright © 2021 Kaibo Lu. All rights reserved.
//

import UIKit
import EFCountingLabel

class CircleProgressVC: UIViewController {
    var topLabel = EFCountingLabel()
    var middleLabel = EFCountingLabel()
    var bottomLabel = EFCountingLabel()

    let topCircleShapeLayer = CAShapeLayer()
    let middleCircleShapeLayer = CAShapeLayer()
    let bottomCircleShapeLayer = CAShapeLayer()
    let rectangleShapeLayer = CAShapeLayer()
    let ovalShapeLayer = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
//        addRectangle()
//        addCircle()
//        addOval()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))

        addThreeCircles()



    }
    
    
    
    @objc func handleTap(){
        let topPercentageValue = 0.96
        let topValue: CGFloat = CGFloat(topPercentageValue * 100)
        let topAnimation = CABasicAnimation(keyPath: "strokeEnd")
        topAnimation.toValue = topPercentageValue
        topAnimation.duration = 2
        topAnimation.fillMode = CAMediaTimingFillMode.forwards
        topAnimation.isRemovedOnCompletion = false
        topLabel.countFrom(1, to: topValue)

        
        let middlePercentageValue = 0.5
        let middleValue: CGFloat = CGFloat(middlePercentageValue * 100)
        let middleAnimation = CABasicAnimation(keyPath: "strokeEnd")
        middleAnimation.toValue = middlePercentageValue
        middleAnimation.duration = 2
        middleAnimation.fillMode = CAMediaTimingFillMode.forwards
        middleAnimation.isRemovedOnCompletion = false
        middleLabel.countFrom(1, to: middleValue)
    
        let bottomPercentageValue = 0.2
        let bottomValue: CGFloat = CGFloat(bottomPercentageValue * 100)
        let bottomAnimation = CABasicAnimation(keyPath: "strokeEnd")
        bottomAnimation.toValue = bottomPercentageValue
        bottomAnimation.duration = 2
        bottomAnimation.fillMode = CAMediaTimingFillMode.forwards
        bottomAnimation.isRemovedOnCompletion = false
        bottomLabel.countFrom(1, to: bottomValue)

        
        middleCircleShapeLayer.add(middleAnimation, forKey: "middleCircleDraw")
        topCircleShapeLayer.add(topAnimation, forKey: "topCircleDraw")
        bottomCircleShapeLayer.add(bottomAnimation, forKey: "bottomCircleDraw")
//
//        rectangleShapeLayer.add(basicAnimation, forKey: "retangleDraw")
//        rectangleShapeLayer.add(basicAnimation, forKey: "retangleDraw")
//        ovalShapeLayer.add(basicAnimation, forKey: "ovalDraw")

        
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
        
        topLabel = EFCountingLabel(frame: CGRect(x: topCenter.x, y:topCenter.y, width: 100, height: 40))
        topLabel.textColor = .systemGreen
        middleLabel = EFCountingLabel(frame: CGRect(x: center.x, y:center.y, width: 100, height: 40))
        middleLabel.textColor = .systemYellow
        bottomLabel = EFCountingLabel(frame: CGRect(x: bottomCenter.x, y:bottomCenter.y, width: 100, height: 40))
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
