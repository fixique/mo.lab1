//
//  Parabola.swift
//  MO.Lab1
//
//  Created by Vlad Krupenko on 14.03.17.
//  Copyright © 2017 fixique. All rights reserved.
//

import Foundation

class Parabola
{
    private var n: Int = 0
    private var u1: Double
    private var u2: Double
    private var u3: Double
    private var eps: Double
    private var w: Double = 0.0
    
    private var JResult = 0.0
    
    var _n: Int {
        return n
    }
    
    var _u1: Double {
        get {
            return u1
        } set {
            u1 = newValue
        }
    }
    
    var _u2: Double {
        get {
            return u2
        } set {
            u2 = newValue
        }
    }
    
    var _u3: Double {
        get {
            return u3
        } set {
            u3 = newValue
        }
    }
    
    
    var _w: Double {
        get {
            return w
        } set {
            w = newValue
        }
    }
    
    var _eps: Double {
        get {
            return eps
        } set {
            eps = newValue
        }
    }
    
    var _JResult: Double {
        return JResult
    }
    
    init(u1: Double, u2: Double, u3: Double, e: Double) {
        self.u1 = u1
        self.u2 = u2
        self.u3 = u3
        self.eps = e
    }
    
    func algorithm() {
        n += 1
        condition()
        
        w = u2 + ((u3 - u2) * (u3 - u2) * (J(u: u1) - J(u: u2)) - (u2 - u1) * (u2 - u1) * (J(u: u3) - J(u: u2))) / 2 * ((u3 - u2) * (J(u: u1) - J(u: u2)) + (u2 - u1) * (J(u: u3) - J(u: u2)))
        
        if w < u2 {
            if J(u: w) < J(u: u2) {
                // u1 = u1 + 0
                u2 = w
                u3 = u2
            }
            
            if J(u: w) > J(u: u2) {
                u1 = w
                // u2 = u2 + 0
                // u3 = u3 + 0
            }
            
            if J(u: w) == J(u: u2) {
                if J(u: u1) > J(u: u2) {
                    // u1 = u1 + 0
                    u2 = w
                    u3 = u2
                }
                
                if J(u: u2) > J(u: u3) {
                    u1 = w
                    // u2 = u2 + 0
                    // u3 = u3 + 0
                }
            }
            
            algorithm()
        }
        
        if w > u2 {
            if J(u: w) < J(u: u2) {
                u1 = u2
                u2 = w
                // u3 = u3 + 0
            }
            
            if J(u: w) > J(u: u2) {
                // u1 = u1 + 0
                // u2 = u2 + 0
                u3 = w
            }
            
            if J(u: w) == J(u: u2) {
                if J(u: u3) > J(u: u2) {
                    u1 = u2
                    u2 = w
                    //  u3 = u3 + 0
                }
                
                if J(u: u1) > J(u: u2) {
                    // u1 = u1 + 0
                    //  u2 = u2 + 0
                    u3 = w
                }
            }
            
            algorithm()
        }
        
        if w == u2 {
            var delta = (u3 - u1) / 4
            
            while (delta >= eps) {
                if J(u: u2 - delta) < J(u: u2) {
                    u2 = u2 - delta
                    JResult = J(u: u2)
                    
                } else if J(u: u2 + delta) < J(u: u2) {
                    u2 = u2 + delta
                    JResult = J(u: u2)
                    
                } else {
                    delta /= 2
                }
            }
            
            JResult = J(u: u2)
        } else {
            algorithm()
            
        }
    }
    
    private func J(u: Double) -> Double {
        //let function = u * u - u - 2
        let function = pow(u,5) - 4 * pow(u,3) + u + 1
        return (pow(u, 5) - (1/3) * pow(u,3) - 4 * u + 5)

        
    }
    
    public func condition() {
        let deltaMinus = J(u: u1) - J(u: u2)
        let deltaPlus = J(u: u3) - J(u: u2)
        
        if (deltaMinus >= 0 && deltaPlus >= 0 && deltaPlus + deltaMinus > 0) {
            
        } else {
            u2 += 0.0001
        }
    }
}


//class Parabola {
//    
//    private var _u1: Double, _u2: Double, _u3:Double
//    private var _w: Double = 0.0, _u2m: Double = 0.0
//    private var _delta = 0.01
//    private var _funcResult: Double = 0.0
//    private var _iteration: Int = 0
//    private var _epsilon: Double = 0.0
//    
//    var u1: Double {
//        get {
//            return _u1
//        } set {
//            _u1 = newValue
//        }
//    }
//    
//    var u2: Double {
//        get {
//            return _u2
//        } set {
//            _u2 = newValue
//        }
//    }
//    
//    var u3: Double {
//        get {
//            return _u3
//        } set {
//            _u3 = newValue
//        }
//    }
//    
//    var iteration: Int {
//        return _iteration
//    }
//    
//    var funcResult: Double {
//        return _funcResult
//    }
//    
//    init(u1: Double, u2: Double, u3: Double, epsilon: Double) {
//        
//        self._u1 = u1
//        self._u2 = u2
//        self._u3 = u3
//        self._epsilon = epsilon
//    }
//    
//    func recursion() {
//        
//        
//        
//        _iteration += 1
//        checkForConvexity()
//        
//        _w = _u2 + ((_u3 - _u2) * (_u3 - _u2) * (function(u: _u1) - function(u: _u2)) - (_u2 - _u1) * (_u2 - _u1) * (function(u: _u3) - function(u: _u2))) / 2 * ((_u3 - _u2) * (function(u: _u1) - function(u: _u2)) + (_u2 - _u1) * (function(u: _u3) - function(u: _u2)))
//        
//        if _w < _u2 {
//            
//            if function(u: _w) < function(u: _u2) {
//                
//                //_u1 = _u1
//                _u2 = _w
//                _u3 = _u2
//            }
//            
//            if function(u: _w) > function(u: _u2) {
//                
//                _u1 = _w
//                //_u2 = _u2
//                //_u3 = _u3
//            }
//            
//            if function(u: _w) == function(u: _u2) {
//                
//                if function(u: _u1) > function(u: _u2) {
//                    
//                    //_u1 = _u1
//                    _u2 = _w
//                    _u3 = _u2
//                }
//                if function(u: _u2) > function(u: _u3) {
//                    
//                    _u1 = _w
//                    //_u2 = _u2
//                    //_u3 = _u3
//                }
//                
//            }
//            
//            recursion()
//        }
//        
//        if _w > _u2 {
//            
//            if function(u: _w) < function(u: _u2) {
//                
//                _u1 = _u2
//                _u2 = _w
//                // _u3 = _u3
//            }
//            
//            if function(u: _w) > function(u: _u2) {
//                
//                // _u1 = _u1
//                // _u2 = _u2
//                _u3 = _w
//            }
//            
//            if function(u: _w) == function(u: _u2) {
//                
//                if function(u: _u3) > function(u: _u2) {
//                    
//                    _u1 = _u2
//                    _u2 = _w
//                    //_u3 = _u3
//                }
//                
//                if function(u: _u1) > function(u: _u2) {
//                    
//                    // _u1 = _u1
//                    // _u2 = _u2
//                    _u3 = _w
//                }
//            }
//            
//            recursion()
//        }
//        
//        if _w == _u2 {
//            
//            var delta = (_u3 - _u1) / 4
//            print(delta)
//            print(_epsilon)
//            while delta >= _epsilon {
//                if function(u: _u2 - delta) < function(u: _u2) {
//                    _u2 = _u2 - delta
//                    _funcResult = function(u: _u2)
//                } else if function(u: _u2 + delta) < function(u: _u2) {
//                    _u2 = _u2 + delta
//                    _funcResult = function(u: _u2)
//                } else {
//                    delta /= 2
//                }
//            }
//            
//            _funcResult = function(u: _u2)
//        } else {
//            recursion()
//        }
//        
//    }
//    
//        
//    private func function(u: Double) -> Double {
//        
//        //return pow(u,2)
//        return (pow(u, 5) - (1/3) * pow(u,3) - 4 * u + 5)
//    }
//    
//    
//    private func secondDerivative(u: Double) -> Double {
//        
//        
//        //return 1
//        return (20 * pow(u, 3) - 2 * u)
//    }
//
//
//    
//    private func checkForConvexity() {
//        
//        let deltaM = function(u: _u1) - function(u: _u2)
//        let deltaP = function(u: _u3) - function(u: _u2)
//        
//        if deltaM <= 0 && deltaP <= 0 && deltaM + deltaP < 0 {
//            _u2 += 0.0001
//        }
//    }
//
//    
//}

















