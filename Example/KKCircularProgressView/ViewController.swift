//
//  ViewController.swift
//  KKCircularProgressView
//
//  Created by k_krizhanovskii on 04/07/2016.
//  Copyright (c) 2016 k_krizhanovskii. All rights reserved.
//

import UIKit
import KKCircularProgressView
import KDCircularProgress


class ViewController: UIViewController {
    private var bigCircleView = KKCircularProgressView()
    private var litcleCircleView = KKCircularProgressView()
    private var kdCircle = KDCircularProgress()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.view.backgroundColor = .grayColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.addBigCicleWithAnimationfromZero()
        self.addSmallCircleFromTo()

    }
    
    
    private func addBigCicleWithAnimationfromZero() {

        bigCircleView.frame = CGRectMake(20, 100, 200, 200)
        self.view.addSubview(bigCircleView)
        
        bigCircleView.trackColor = .orangeColor()
        bigCircleView.trackColor = UIColor.orangeColor()
        bigCircleView.trackThickness = 0.1
        bigCircleView.progressThickness = 0.1
        bigCircleView.glowMode = .NoGlow
        bigCircleView.labelColor = .orangeColor()
        bigCircleView.startPercent = 10
        bigCircleView.startAnimatingWithDuration(3, toPercent: 50)
    }
    
    
    private func addSmallCircleFromTo() {
        litcleCircleView.frame = CGRectMake(150, self.view.frame.height - 200, 100, 100)
        self.view.addSubview(litcleCircleView)
        
        litcleCircleView.trackColor = .whiteColor()
        litcleCircleView.trackColor = UIColor.orangeColor()
        litcleCircleView.trackThickness = 0.1
        litcleCircleView.progressThickness = 0.1
        litcleCircleView.glowMode = .NoGlow
        litcleCircleView.labelColor = .purpleColor()
        litcleCircleView.startPercent = 90
        litcleCircleView.startAnimatingWithDuration(3, fromPercent: 90, toPercent: 10)
    }

}

