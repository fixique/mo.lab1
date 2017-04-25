//
//  Newton.swift
//  MO.Lab1
//
//  Created by Vlad Krupenko on 14.03.17.
//  Copyright © 2017 fixique. All rights reserved.
//
import Foundation
class Newton
{
    private var n: Int = 1
    private var u: Double
    private var epsilon: Double
    private var right: Double
    private var uX: Double = 0.0
    
    private var JResult = 0.0
    
    var _n: Int {
        return n
        
    }
    
    var _uX: Double {
        return uX
        
    }
    
    var _u: Double {
        get {
            return u
        } set {
            u = newValue
        }
    }
    
    var _right: Double {
        get {
            return right
        } set {
            right = newValue
        }
    }
    
    var _epsilon: Double {
        get {
            return epsilon
        } set {
            epsilon = newValue
        }
    }
    
    var _JResult: Double {
        return JResult
        
    }
    
    init(u: Double, right: Double, epsilon: Double) {
        self.u = u
        self.right = right
        self.epsilon = epsilon
        
    }
    
    
    func algorithm() {
        //let GS: GoldenSection = GoldenSection(left: u, right: right, epsilon: 0.01)
        //GS.algorithm()
        // u = GS._x
        
        if abs(JFirstDeriv(u: u)) <= epsilon {
            uX = u
            JResult = J(u: uX)
            
        } else {
            u = u - JFirstDeriv(u: u) / JSecondDeriv(u: u)
            n += 1
            algorithm()
            
        }
    }
    
    private func J(u: Double) -> Double {
        //let function = pow(u,5) - 1/3 * pow(u,3) - 4 * u + 5
        let function = u*u - u - 2
        return function
        
    }
    
    private func JFirstDeriv(u: Double) -> Double {
        let function = 2 * u - 1
        //let function = 5 * pow(u,4) - pow(u,2) - 4
        
        return function
        
    }
    
    private func JSecondDeriv(u: Double) -> Double {
        let function = 2.0
        //let function = 20 * pow(u,3) - 2 * u
        
        return function
        
    }
}

