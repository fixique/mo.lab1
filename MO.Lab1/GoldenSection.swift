//
//  GoldenSection.swift
//  MO.Lab1
//
//  Created by Vlad Krupenko on 14.03.17.
//  Copyright © 2017 fixique. All rights reserved.
//

import Foundation

class GoldenSection {
    private var _iteration: Int = 0
    private var _left: Double, _right: Double
    private var _deviation: Double
    private var _alphaOne: Double = (sqrt(5) - 1) / 2
    private var _alphaTwo: Double = (3 - sqrt(5)) / 2
    private var _u1: Double = 0.0, _u2: Double = 0.0
    private var _funcValue1: Double = 0.0, _funcValue2: Double = 0.0
    private var _uResult: Double = 0.0
    private var _funcResult: Double = 0.0
    
    var iteration: Int {
        return _iteration
    }
    
    var funcResult: Double {
        return _funcResult
    }
    
    var uResult: Double {
        return _uResult
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
    
    
    init(left: Double, right: Double, deviation: Double) {
        
        self._left = left
        self._right = right
        self._deviation = deviation
    }

    func recursion() {
        
        _iteration += 1
        
        _u1 = _left + _alphaTwo * (_right - _left)
        _u2 = _left + _alphaOne * (_right - _left)
        
        _funcValue1 = function(u: _u1)
        _funcValue2 = function(u: _u2)
        
        if _funcValue1 < _funcValue2 {
            
            _right = _u2
            _u2 = _u1
            _funcValue2 = _funcValue1
            _u1 = _left + _alphaTwo * (_right - _left)
            _funcValue1 = function(u: _u1)
        } else if _funcValue1 > _funcValue2 {
            _left = _u1
            _u1 = _u2
            _funcValue1 = _funcValue2
            _u2 = _left + _alphaOne * (_right - _left)
            _funcValue2 = function(u: _u2)
        } else if _funcValue1 == _funcValue2 {
            _right = _u2
            _left = _u1
            _u1 = _left + _alphaTwo * (_right - _left)
            _u2 = _left + _alphaOne * (_right - _left)
            _funcValue1 = function(u: _u1)
            _funcValue2 = function(u: _u2)
        }
        
        if _right - _left >= deviation {
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





















