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
    var squiggle:[[CGPoint]] = [[]]
    var currentColor:UIColor = UIColor.black
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dots.append(touches.first!.location(in: self))
        
        setNeedsDisplay()
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        dots.append(touches.first!.location(in: self))
        
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        dots.append(touches.first!.location(in: self))
        
        setNeedsDisplay()
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        if dots.count == 0 {
            return
        }
        let bezier = UIBezierPath()
        bezier.move(to:dots[0])
        for dot in dots {
            bezier.addLine(to: dot)
            
        }
 
        currentColor.setStroke()
        bezier.stroke()
        
    }
    
    @IBAction func purpleBTN(_ sender: Any) {
        currentColor = UIColor.purple
    }
    @IBAction func blueBTN(_ sender: Any) {
       currentColor = UIColor.blue
    }
    @IBAction func greenBTN(_ sender: Any) {
        currentColor = UIColor.green
    }
    @IBAction func yellowBTN(_ sender: Any) {
        currentColor = UIColor.yellow
    }
    @IBAction func orangeBTN(_ sender: Any) {
        currentColor = UIColor.orange
    }
    @IBAction func redBTN(_ sender: Any) {
        currentColor = UIColor.red
    }
    
}

