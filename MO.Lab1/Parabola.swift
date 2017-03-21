//
//  Parabola.swift
//  MO.Lab1
//
//  Created by Vlad Krupenko on 14.03.17.
//  Copyright © 2017 fixique. All rights reserved.
//

import Foundation

class Parabola {
    
    private var _u1: Double, _u2: Double, _u3:Double
    private var _w: Double = 0.0, _u2m: Double = 0.0
    private var _delta = 0.01
    private var _funcResult: Double = 0.0
    private var _iteration: Int = 0
    
    var u1: Double {
        get {
            return _u1
        } set {
            _u1 = newValue
        }
    }
    
    var u2: Double {
        get {
            return _u2
        } set {
            _u2 = newValue
        }
    }
    
    var u3: Double {
        get {
            return _u3
        } set {
            _u3 = newValue
        }
    }
    
    var iteration: Int {
        return _iteration
    }
    
    var funcResult: Double {
        return _funcResult
    }
    
    init(u1: Double, u2: Double, u3: Double) {
        
        self._u1 = u1
        self._u2 = u2
        self._u3 = u3
    }
    
    func recursion() {
        
        _iteration += 1
        //checkForConvexity()
        
        _w = _u2 + ((_u3 - _u2) * (_u3 - _u2) * (function(u: _u1) - function(u: _u2)) - (_u2 - _u1) * (_u2 - _u1) * (function(u: _u3) - function(u: _u2)) / 2 * ((_u3 - _u2) * function(u: _u1) - function(u: _u2) + (_u2 - _u1) * function(u: _u3) - function(u: _u2)))
        
        if _w < _u2 {
            
            if function(u: _w) < function(u: _u2) {
                
                //_u1 = _u1
                _u2 = _w
                _u3 = _u2
            }
            
            if function(u: _w) > function(u: _u2) {
                
                _u1 = _w
                //_u2 = _u2
                //_u3 = _u3
            }
            
            if function(u: _w) == function(u: _u2) {
                
                if function(u: _u1) > function(u: _u2) {
                    
                    //_u1 = _u1
                    _u2 = _w
                    _u3 = _u2
                }
                if function(u: _u2) > function(u: _u3) {
                    
                    _u1 = _w
                    //_u2 = _u2
                    //_u3 = _u3
                }
                
            }
            
            recursion()
        }
        
        if _w > _u2 {
            
            if function(u: _w) < function(u: _u2) {
                
                _u1 = _u2
                _u2 = _w
                // _u3 = _u3
            }
            
            if function(u: _w) > function(u: _u2) {
                
                // _u1 = _u1
                // _u2 = _u2
                _u3 = _w
            }
            
            if function(u: _w) == function(u: _u2) {
                
                if function(u: _u3) > function(u: _u2) {
                    
                    _u1 = _u2
                    _u2 = _w
                    //_u3 = _u3
                }
                
                if function(u: _u1) > function(u: _u2) {
                    
                    // _u1 = _u1
                    // _u2 = _u2
                    _u3 = _w
                }
            }
            
            recursion()
        }
        
        if _w == _u2 {
            _funcResult = function(u: _u2)
        } else {
            recursion()
        }
        
    }
    
    private func function(u: Double) -> Double {
        
        return (pow(u, 5) - (1/3) * pow(u,3) - 4 * u + 5)
    }
    

    
    private func checkForConvexity() {
        
        let deltaM = function(u: _u1) - function(u: _u2)
        let deltaP = function(u: _u3) - function(u: _u2)
        
        if deltaM <= 0 && deltaP <= 0 && deltaM + deltaP < 0 {
            _u2 += 0.0001
        }
    }

    
}

















