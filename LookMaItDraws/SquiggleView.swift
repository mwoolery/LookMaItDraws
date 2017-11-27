//
//  SquiggleView.swift
//  LookMaItDraws
//
//  Created by Student on 11/26/17.
//  Copyright © 2017 Matthew Woolery. All rights reserved.
//

import UIKit

class SquiggleView: UIView {
    
    
    var dots:[CGPoint] = []
    var squiggle:[[CGPoint]] = []
    var colors:[UIColor] = [UIColor.black, UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.blue, UIColor.purple]
    var colorIndex:Int = 0
    var currentColor:[Int] = []
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dots.append(touches.first!.location(in: self))
        currentColor.append(colorIndex)
        setNeedsDisplay()
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        dots.append(touches.first!.location(in: self))
        currentColor.append(colorIndex)
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        dots.append(touches.first!.location(in: self))
        squiggle.append(dots)
        currentColor.append(colorIndex)
        
        dots = []
        setNeedsDisplay()
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        if squiggle.count == 0 {
            return
        }
        if squiggle[0].count == 0{
            return
        }
        let bezier = UIBezierPath()
        
        for line in 0...squiggle.count - 1 {
            
            bezier.move(to:squiggle[line][0])
            for dot in 0...squiggle[line].count - 1{
                bezier.addLine(to: squiggle[line][dot])
                
            }
            let colorSetting = currentColor[line]
            print(colorSetting)
            colors[colorSetting].setStroke()
            bezier.stroke()
        }
        
        //        for dot in dots {
//            bezier.addLine(to: dot)
//
//        }
 
        
        
    }
    
    @IBAction func purpleBTN(_ sender: Any) {
        colorIndex = 6
    }
    @IBAction func blueBTN(_ sender: Any) {
       colorIndex = 5
    }
    @IBAction func greenBTN(_ sender: Any) {
        colorIndex = 4
    }
    @IBAction func yellowBTN(_ sender: Any) {
        colorIndex = 3
    }
    @IBAction func orangeBTN(_ sender: Any) {
        colorIndex = 2
    }
    @IBAction func redBTN(_ sender: Any) {
        colorIndex = 1
    }
    
}

