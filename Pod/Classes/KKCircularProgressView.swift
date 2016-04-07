//
//  CircleLableProgressView.swift
//  UniversalFootApp
//
//  Created by Krizhanovskii on 4/6/16.
//  Copyright © 2016 krizhanovskii. All rights reserved.
//

import UIKit
import Foundation
import KDCircularProgress

/*
    KDCircularProgress taken from https://github.com/kaandedeoglu/KDCircularProgress . Look for more information
 */

public class KKCircularProgressView: UIView {

    
    private var isReverse : Bool = false
    
    /* variables for animating */
    private var counter = 0
    private var timer = NSTimer()
    private var percentToDone = 0
    
    private var circleProgres = KDCircularProgress()
    private var percentLbl = UILabel()
    private var margins = CGFloat(10)
    private var startPercent = 0
    
    
    /* Start percent from */
    public var startPercetn : Int = 0{
        willSet(value) {
            let valueConverted = max(0,min(value,100))
            self.circleProgres.angle = self.angleFromPercents(valueConverted)
            self.percentLbl.text = "\(valueConverted) %"
            
        }
    }
    /* Text color of Percent label */
    public var labelColor : UIColor = .whiteColor() {
        willSet(color) {
            percentLbl.textColor = color
        }
    }
    
    /*
     The thickness of the background track. Between 0 and 1. Default is 0.5
     */
    public var trackThinkest : CGFloat  = KDCircularProgress().trackThickness {
        willSet(value) {
            circleProgres.trackThickness = value
        }
    }
    
    
    /*
     The color of the background track. Default is UIColor.blackColor().
     */
    public var trackColor : UIColor = KDCircularProgress().trackColor {
        willSet(color) {
            print("set color")
            circleProgres.setColors(color)
        }
    }
    
    
    /*
     The thickness of the progress. Between 0 and 1. Default is 0.4
     */
    public var progressThickness : CGFloat  = KDCircularProgress().progressThickness {
        willSet(value) {
            circleProgres.progressThickness = value
        }
    }
    
    
    
    /*
     The colors used to generate the gradient of the progress. A gradient is used only if there is more than one color. A fill is used otherwise. The default is a white fill.
     */
    public var progressColors : [UIColor] = KDCircularProgress().progressColors {
        willSet(colors) {
            circleProgres.progressColors = colors
        }
    }
    
    
    /*
     Clockwise if true, Counter-clockwise if false. Default is true.
     
     */
    public var clockwise : Bool = KDCircularProgress().clockwise {
        willSet(value) {
            circleProgres.clockwise = value
        }
    }
    
    /*
     When true, the ends of the progress track will be drawn with a half circle radius. Default is false.
     */
    public var roundedCorners : Bool = KDCircularProgress().roundedCorners {
        willSet(value) {
            circleProgres.roundedCorners = value
        }
    }
    
    /*
     Describes how many times the underlying gradient will perform a 2π rotation for each full cycle of the progress. Integer values recommended. Default is 0.
     */
    public var gradientRotateSpeed : CGFloat  = KDCircularProgress().gradientRotateSpeed {
        willSet(value) {
            circleProgres.gradientRotateSpeed = value
        }
    }
    
    /*
     The intensity of the glow. Between 0 and 1.0. Default is 1.0.
     
     */
    public var glowAmount : CGFloat  = KDCircularProgress().gradientRotateSpeed {
        willSet(value) {
            circleProgres.glowAmount = value
        }
    }
    
    /*
     .Forward - The glow increases proportionaly to the angle. No glow at 0 degrees and full glow at 360 degrees.
     
     .Reverse - The glow increases inversely proportional to the angle. Full glow at 0 degrees and no glow at 360 degrees.
     
     .Constant - Constant glow.
     
     .NoGlow - No glow
     
     The default is .Forward
     */
    
    public var glowMode : KDCircularProgressGlowMode  = KDCircularProgress().glowMode {
        willSet(value) {
            circleProgres.glowMode = value
        }
    }
    
    /*
     The color of the center of the circle. Default is UIColor.clearColor().
     
     */
    public var progressInsideFillColor : UIColor = .clearColor() {
        willSet(color) {
            circleProgres.progressInsideFillColor = color
        }
    }
    
    
    
    public override init(frame:CGRect) {
        var _frame = frame
        _frame.size.width = min(frame.width,frame.height)
        _frame.size.height = min(frame.width,frame.height)
        super.init(frame: _frame)
        
        self.circleProgres.frame = bounds
        self.circleProgres.trackColor = self.trackColor
        self.circleProgres.trackThickness = self.trackThinkest
        self.circleProgres.angle = 360*Double(self.startPercetn)/100
        self.circleProgres.startAngle = -90
        self.circleProgres.glowMode = self.glowMode
        self.circleProgres.glowAmount = self.glowAmount
        self.circleProgres.progressColors = self.progressColors
        self.circleProgres.progressThickness = self.progressThickness
        self.circleProgres.progressInsideFillColor = self.progressInsideFillColor
        self.circleProgres.gradientRotateSpeed = self.gradientRotateSpeed
        self.circleProgres.roundedCorners = self.roundedCorners
        self.circleProgres.clockwise = self.clockwise
        
        
        let minVal = min(bounds.width, bounds.height)
        self.percentLbl.frame = CGRectMake(margins, margins, minVal - margins*2, minVal - margins*2)
        
        percentLbl.text = "\(self.startPercetn) %"
        percentLbl.textAlignment = .Center
        percentLbl.textColor = labelColor
        percentLbl.font = UIFont.systemFontOfSize(percentLbl.frame.width/3.3)
        
        self.addSubview(self.circleProgres)
        self.circleProgres.addSubview(self.percentLbl)
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    /* animation actions */
    @objc private func timerAction() {
        if isReverse {
            counter -= 1
            
        } else {
            counter += 1
            
        }
        self.percentLbl.text = "\(counter) %"
        if counter == percentToDone {
            timer.invalidate()
            counter == 0
        }
    }
    
    
    
    /* start animating percent changes from 0 to  percent */
    public func startAnimatingWithDuration(duration : Double,toPercent percent:Int) {
        self.timer.invalidate()
        let toPercentConverted = max(0,min(percent,100))
        
        self.percentToDone = toPercentConverted
        let timerTick = Double(duration/Double(percent))
        
        let angleTo = self.angleFromPercents(toPercentConverted)
        
        self.circleProgres.animateToAngle(angleTo, duration: duration) { (flag) in
        }
        timer = NSTimer.scheduledTimerWithTimeInterval(timerTick, target: self, selector: #selector(self.timerAction), userInfo: nil, repeats: true)
        
    }
    
    /* start animating percent changes from  to  percent */
    public func startAnimatingWithDuration(duration : Double, fromPercent:Int, toPercent:Int) {
        
        self.timer.invalidate()
        let fromPercentConverted =  max(0,min(fromPercent,100))
        let toPercentConverted = max(0,min(toPercent,100))
        
        
        
        counter = fromPercentConverted
        self.percentToDone = toPercentConverted
        
        
        if toPercent > fromPercent {
            isReverse = false
        } else {
            isReverse = true
        }
        
        let timerTick = duration/abs(Double(toPercentConverted) - Double(fromPercentConverted))
        timer = NSTimer.scheduledTimerWithTimeInterval(timerTick, target: self, selector: #selector(self.timerAction), userInfo: nil, repeats: true)
        
        
        
        let angleFrom =  self.angleFromPercents(fromPercentConverted)
        let angleTo = self.angleFromPercents(toPercentConverted)
        
        self.circleProgres.animateFromAngle(angleFrom, toAngle: angleTo, duration: duration) { (flag) in
        }
        
        
    }
    
    
    private func angleFromPercents(percent:Int) -> Double {
        return 360*Double(percent)/100
    }
}
