//
//  Newton.swift
//  MO.Lab1
//
//  Created by Vlad Krupenko on 14.03.17.
//  Copyright © 2017 fixique. All rights reserved.
//

import Foundation

class Newton {
    
    private var _u0: Double = 0.0
    private var _u: Double
    private var _uNext: Double = 0.0
    private var _uX: Double = 0.0
    private var _capacity = 0.0
    private var _iteration = 1
    private var _funcResult: Double = 0.0
    
    var funcResult: Double {
        
        return _funcResult
    }
    
    var iteration: Int {
        
        return _iteration
    }
    
    var u: Double {
        
        get {
            return _u
        } set {
            _u = newValue
        }
    }
    
    var capacity: Double {
        
        get {
            return _capacity
        } set {
            _capacity = newValue
        }
    }
    
    init(u: Double, capacity: Double) {
        
        self._u = u
        self._capacity = capacity
    }
    
    func recursion() {
        
        
        if abs(firstDerivative(u: _u)) <= _capacity {
            _uX = _u
            _funcResult = function(u: _uX)
        } else {
            _u = _u - firstDerivative(u: _u) / secondDerivative(u: _u)
            _iteration += 1
            recursion()
        }
    }
    
    private func function(u: Double) -> Double {
        
        return (pow(u, 5) - (1/3) * pow(u,3) - 4 * u + 5)
    }

    
    
    
    private func firstDerivative(u: Double) -> Double {
        
        return (5 * pow(u, 4) - pow(u, 2) - 4)
        
    }
    
    private func secondDerivative(u: Double) -> Double {
        
        return (20 * pow(u, 3) - 2 * u)
    }
}
