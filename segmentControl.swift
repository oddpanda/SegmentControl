//
//  segmentControl.swift
//  Edinburgh Mums
//
//  Created by Shaun Gillon on 27/08/2015.
//  Copyright (c) 2015 Odd Panda Design Ltd. All rights reserved.
//

import UIKit

class segmentControlView: UISegmentedControl {

    var borderView: UIView!
    var segBackgroundColor : UIColor = UIColor.whiteColor()
    
    //border Variables
    var borderColor : UIColor = UIColor.greenColor()
    var borderHeight :CGFloat = 2
    
    //Font Variables
    var fontColour = UIColor(red: 102.0/255, green: 145.0/255, blue: 142.0/255, alpha: 1.0)
    var selectedFontColour = UIColor(red: 102.0/255, green: 145.0/255, blue: 142.0/255, alpha: 1.0)
    var fontType = UIFont(name: "AvenirNext-Regular", size: 14.0)

    override func drawRect(rect: CGRect) {
        
         self.setTitleTextAttributes([NSForegroundColorAttributeName: fontColour, NSFontAttributeName : fontType!], forState: .Normal)
         self.setTitleTextAttributes([NSForegroundColorAttributeName: selectedFontColour, NSFontAttributeName : fontType!], forState: .Selected)
        
        self.backgroundColor = segBackgroundColor
        self.tintColor = UIColor.clearColor()
        let segmentCount = self.numberOfSegments
        let width = self.frame.width
        let height = self.frame.height - 5
        
        let border = width/CGFloat(segmentCount)
        
        self.borderView = UIView(frame: CGRectMake(0, height, border, borderHeight))
        self.borderView.backgroundColor = borderColor
        self.addSubview(borderView)
        
    }

    func animateBorderToSegment(segment : Int){
        
        UIView.animateWithDuration(0.7, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: nil, animations: {
        
            let segmentCount = self.numberOfSegments
            let width = self.frame.width
            let border = width/CGFloat(segmentCount)
            let difference = CGFloat(segment) * border
            
            self.borderView.frame.origin.x = difference
            
        }, completion: nil)
        
    }

}
