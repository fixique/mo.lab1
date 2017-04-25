//
//  MainVC.swift
//  MO.Lab1
//
//  Created by Vlad Krupenko on 13.03.17.
//  Copyright © 2017 fixique. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var leftBoundField: UITextField!
    @IBOutlet weak var rightBoundField: UITextField!
    @IBOutlet weak var capacityField: UITextField!
    @IBOutlet weak var deviationField: UITextField!
    
    @IBOutlet weak var iterationHL: UILabel!
    @IBOutlet weak var funcResultHL: UILabel!
    @IBOutlet weak var dotHL: UILabel!
    
    @IBOutlet weak var iterationGS: UILabel!
    @IBOutlet weak var funcResultGS: UILabel!
    @IBOutlet weak var dotGS: UILabel!
    
    @IBOutlet weak var iterationP: UILabel!
    @IBOutlet weak var funcResultP: UILabel!
    @IBOutlet weak var dotP: UILabel!
    
    @IBOutlet weak var iterationN: UILabel!
    @IBOutlet weak var funcResultN: UILabel!
    @IBOutlet weak var dotN: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func startPressed(_ sender: Any) {
        
        let leftBound = Double(leftBoundField.text!)!
        let rightBound = Double(rightBoundField.text!)!
        let capacity = Double(capacityField.text!)!
        let deviation = Double(deviationField.text!)!
        
        let HL: HalfLine = HalfLine(left: leftBound, right: rightBound, capacity: capacity, deviation: deviation)
        //HL.recursion()
        
        iterationHL.text = "\(HL.iteration)"
        funcResultHL.text = "\(HL.funcResult)"
        dotHL.text = "\(HL.uResult)"
        
        let GS: GoldenSection = GoldenSection(left: leftBound, right: rightBound, deviation: capacity)
        //GS.recursion()
        
        iterationGS.text = "\(GS.iteration)"
        funcResultGS.text = "\(GS.funcResult)"
        dotGS.text = "\(GS.uResult)"
        
        let P: Parabola = Parabola(u1: leftBound, u2: (rightBound + leftBound) / 2, u3: rightBound, e: deviation)
        //P.algorithm()
        
        iterationP.text = "\(P._n)"
        funcResultP.text = "\(P._JResult)"
        dotP.text = "\(P._u2)" 
        
        let N: Newton = Newton(u: leftBound, capacity: deviation)
        N.recursion()
        
        iterationN.text = "\(N.iteration)"
        funcResultN.text = "\(N.funcResult)"
        dotN.text = "\(N.u)"
        
    }


}

