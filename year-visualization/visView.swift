//
//  visView.swift
//  year-visualization
//
//  Created by David Kouřil on 04/05/15.
//  Copyright (c) 2015 dvdkouril. All rights reserved.
//

import UIKit

class visView: UIView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        let calendar = NSCalendar.currentCalendar()
        let date = NSDate()
        let components = calendar.components(.CalendarUnitMonth | .CalendarUnitYear | .CalendarUnitWeekOfYear | .CalendarUnitDay, fromDate: date)
        let weekNumber = components.weekOfYear
        let dayNumber = components.day
        
        var yearLabel: UILabel = UILabel(frame: CGRectMake(10, 10, 100, 50))
        yearLabel.textColor = UIColor.whiteColor()
        yearLabel.text = "2015"
        self.addSubview(yearLabel)
        
        var i = 0
        var xPos: Float = 0
        var yPos: Float = 0
        var padding: Float = 50
        while i < 365 {
            //let circle = SKShapeNode(circleOfRadius: 4)
            let col: CGColor
            if i <= ((weekNumber-1)*7 + dayNumber) {
                col = UIColor.purpleColor().CGColor
            } else {
                col = UIColor.whiteColor().CGColor
            }
            xPos = CFloat(i % 7)
            yPos = CFloat(i / 7)
            
            drawCircle(CFloat(padding + xPos*10), y: CFloat(padding + 50 + yPos*10), radius: CFloat(5), color: col)
            i++
        }
        
        println("drawRect")

    }
    
    func drawCircle(x: CFloat, y: CFloat, radius: CFloat, color: CGColor) {
        var context:CGContextRef = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(context, color)
        var rectangle: CGRect = CGRectMake(CGFloat(x), CGFloat(y), CGFloat(radius), CGFloat(radius))
        CGContextFillEllipseInRect(context, rectangle)
        CGContextFillPath(context)
    }


}
