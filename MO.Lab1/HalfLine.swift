//
//  HalfLine.swift
//  MO.Lab1
//
//  Created by Vlad Krupenko on 13.03.17.
//  Copyright © 2017 fixique. All rights reserved.
//

import Foundation

class HalfLine {
    
    private var _iteration: Int = 0
    private var _left: Double, _right: Double
    private var _capacity: Double
    private var _deviation: Double
    private var _funcValue1: Double = 0, _funcValue2: Double = 0
    private var _u1:Double = 0, _u2: Double = 0
    private var _uResult: Double = 0
    private var _funcResult: Double = 0
    
    var iteration: Int {
        return _iteration
    }
    
    var funcResult: Double {
        return _funcResult
    }
    
    var uResult: Double {
        return _uResult
    }
    
    var capacity: Double {
        get {
            return _capacity
        } set {
            _capacity = newValue
        }
    }
    
    var deviation: Double {
        get {
            return _deviation
        } set {
            _deviation = newValue
        }
    }
    
    var left: Double {
        get {
            return _left
        } set {
            _left = newValue
        }
    }
    
    var right: Double {
        get {
            return _right
        } set {
            _right = newValue
        }
    }
    

    init(left: Double, right: Double, capacity: Double, deviation: Double) {
        self._left = left
        self._right = right
        self._capacity = capacity
        self._deviation = deviation
    }
    
    
    func recursion() {
        _iteration += 1
        
        _u1 = (_right + _left - _deviation) / 2
        _u2 = (_right + _left + _deviation) / 2
        
        _funcValue1 = function(u: _u1)
        _funcValue2 = function(u: _u2)
        
        if _funcValue1 < _funcValue2 {
            _right = _u2
        } else if _funcValue1 > _funcValue2 {
            _left = _u1
        } else if _funcValue1 == _funcValue2 {
            _right = _u2
            _left = _u1
        }
        
        if _right - _left >= _capacity {
            recursion()
        } else {
            _uResult = (_right + _left) / 2
            _funcResult = function(u: _uResult)
        }
    }
    
    private func function(u: Double) -> Double {
        //return pow(u,2)
        return (pow(u, 5) - (1/3) * pow(u,3) - 4 * u + 5)
    }
    
    
}

































