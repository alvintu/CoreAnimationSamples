//
//  CountingLabel.swift
//  CoreAnimationDemo
//
//  Created by Alvin Tu on 3/5/21.
//  Copyright © 2021 Kaibo Lu. All rights reserved.
//

import UIKit
enum CounterAnimationType {
    case Linear
    case EaseIn
    case EaseOut
}

enum CounterType {
    case Int
    case Float
}

class CountingLabel: UILabel {
    
    let counterVelocity: Float = 3.0
    var startNumber:Float = 0.0
    var endNumber: Float = 0.0
    var progress: TimeInterval!
    var duration: TimeInterval!
    var lastUpdate: TimeInterval!
    var counterType: CounterType!
    var counterAnimationType: CounterAnimationType!
    
    var currentCounterValue: Float {
        if progress >= duration {
            return endNumber }
        
        let percentage = Float(progress/duration)
        let update = updateCounter(counterValue: percentage)
        
        return startNumber + (update * (endNumber - startNumber))
    }
    
    
    

    var timer:Timer?
    
    func count(fromValue: Float, to toValue: Float, withDuration duration: TimeInterval, andAnimationType animationType: CounterAnimationType, andCounterType counterType: CounterType) {
        self.startNumber = fromValue
        self.endNumber = toValue
        self.duration = duration
        self.counterType = counterType
        self.progress = 0
        self.lastUpdate = Date.timeIntervalSinceReferenceDate
        
        invalidateTimer()
        
        if duration == 0 {
            updateText(value: toValue)
            return
        }
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(CountingLabel.updateValue), userInfo: nil, repeats: true)
    }
    
    @objc func updateValue() {
        let now = Date.timeIntervalSinceReferenceDate
        progress = progress + (now - lastUpdate)
        lastUpdate = now
        
        if progress >= duration {
            invalidateTimer()
            progress = duration
        }
        
        updateText(value:currentCounterValue)
        
    }
    
    func updateText(value: Float) {
        switch counterType {
        case .Int:
            self.text = "\(Int(value))"
            
        case .Float:
            self.text = String(format: "%.2f",value)
        case .none:
            self.text = String(format: "%.2f",value)
        }
    }
    
    func updateCounter(counterValue: Float) -> Float {
        
        switch counterAnimationType {
        case .Linear:
            return counterValue
        
        case .EaseIn:
            return powf(counterValue, counterVelocity)
        
        case .EaseOut:
            return 1.0 - powf(1.0 - counterValue, counterVelocity)
        case .none:
            return counterValue
        }
        
    }
    
    func invalidateTimer() {
        timer?.invalidate()
        timer = nil
    }
    
}
