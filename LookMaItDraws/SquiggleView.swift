//
//  SquiggleView.swift
//  LookMaItDraws
//
//  Created by Student on 11/26/17.
//  Copyright © 2017 Matthew Woolery. All rights reserved.
//

import UIKit

class SquiggleView: UIView {
    
    
    // array of our lines that are drawn
    var squiggle:[UIBezierPath] = []
    // list of colors that the buttons corrospond to
    var colors:[UIColor] = [UIColor.black, UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.blue, UIColor.purple]
    // button sets this to fetch the color from colors array
    var colorIndex:Int = 0
    // current color of the line that is being drawn.
    var currentColor:[UIColor] = []
    //index to be used for
    var num = 0
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // make a new UIBezierPath
        squiggle.append(UIBezierPath())
        // move to location to start line
        squiggle[num].move(to: (touches.first!.location(in: self)))
        // used to keeps track of the color of the line
        currentColor.append(colors[colorIndex])
        setNeedsDisplay()
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // add lines between points
        squiggle[num].addLine(to: touches.first!.location(in: self))
       
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // increment num
        num = num + 1
        setNeedsDisplay()
    }
    
 
    override func draw(_ rect: CGRect) {
        // make sure it is not empty to avoid an exception
        if squiggle.count == 0 {
            return
        }
        // draw the paths
        for i in 0...squiggle.count - 1 {
            currentColor[i].setStroke()
            squiggle[i].stroke()
        }
        

 
        
        
    }
    //buttons set color index
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
    // resets everything so it is blank again
    @IBAction func clearBTN(_ sender: Any) {
        squiggle = []
        currentColor = []
        num = 0
        colorIndex = 0
        setNeedsDisplay()
    }
    
}

