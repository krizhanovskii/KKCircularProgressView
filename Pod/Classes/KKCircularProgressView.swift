//
//  CircleLableProgressView.swift
//  UniversalFootApp
//
//  Created by Krizhanovskii on 4/6/16.
//  Copyright © 2016 krizhanovskii. All rights reserved.
//

import UIKit
import KDCircularProgress


public class KKCircularProgressView: UIView {

    
    /* variables for animating */
    private var counter = 0
    private var timer = NSTimer()
    private var percentToDone = 0
    
    private var circleProgres = KDCircularProgress()
    private var percentLbl = UILabel()
    private var margins = CGFloat(10)
    
    
    
    public var labelColor : UIColor = .whiteColor() {
        willSet(color) {
            percentLbl.textColor = color
        }
    }
    
    public var trackThinkest : CGFloat  = KDCircularProgress().trackThickness {
        willSet(value) {
            circleProgres.trackThickness = value
        }
    }
    
    public var trackColor : UIColor = KDCircularProgress().trackColor {
        willSet(color) {
            print("set color")
            circleProgres.setColors(color)
        }
    }
    
    public var progressThickness : CGFloat  = KDCircularProgress().progressThickness {
        willSet(value) {
            circleProgres.progressThickness = value
        }
    }
    
    public var progressColors : [UIColor] = KDCircularProgress().progressColors {
        willSet(colors) {
            circleProgres.progressColors = colors
        }
    }
    
    
    public var angle : Double = KDCircularProgress().angle {
        willSet(value) {
            circleProgres.angle = value
        }
    }
    
    
    public var startAngle : Double = -90 {
        willSet(value) {
            circleProgres.startAngle = value
        }
    }
    
    
    public var clockwise : Bool = KDCircularProgress().clockwise {
        willSet(value) {
            circleProgres.clockwise = value
        }
    }
    
    
    public var roundedCorners : Bool = KDCircularProgress().roundedCorners {
        willSet(value) {
            circleProgres.roundedCorners = value
        }
    }
    
    
    public var gradientRotateSpeed : CGFloat  = KDCircularProgress().gradientRotateSpeed {
        willSet(value) {
            circleProgres.gradientRotateSpeed = value
        }
    }
    
    
    public var glowAmount : CGFloat  = KDCircularProgress().gradientRotateSpeed {
        willSet(value) {
            circleProgres.glowAmount = value
        }
    }
    
    
    public var glowMode : KDCircularProgressGlowMode  = KDCircularProgress().glowMode {
        willSet(value) {
            circleProgres.glowMode = value
        }
    }
    
    
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
        self.circleProgres.angle = self.angle
        self.circleProgres.startAngle = self.startAngle
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
        percentLbl.text = "0 %"
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
        counter += 1
        self.percentLbl.text = "\(counter) %"
        if counter == percentToDone {
            timer.invalidate()
            counter == 0
        }
    }
    
    
    public func startAnimatingWithDuration(duration : Double,toPercent percent:Int) {
        self.timer.invalidate()
        self.percentToDone = percent
        let timerTick = Double(duration/Double(percent))
        
        let angleValue = 360*Double(percent)/100
        
        self.circleProgres.animateToAngle(angleValue, duration: duration) { (flag) in
            print("complite")
        }
        timer = NSTimer.scheduledTimerWithTimeInterval(timerTick, target: self, selector: #selector(self.timerAction), userInfo: nil, repeats: true)
        
    }
 
}
