//
//  SWViewController.swift
//  UIViewCustomPropertyAnimation
//
//  Created by Nikola Lajic on 6/13/16.
//  Copyright © 2016 codecentric. All rights reserved.
//

import UIKit

class SWViewController: UIViewController {
    private static let kAnimDuration = 2.0
    @IBOutlet var animView: SWView?
    
    @IBAction func defaultAnimation(sender: AnyObject) {
        self.animView?.percent = 0
        UIView.animateWithDuration(SWViewController.kAnimDuration) {
            self.animView?.percent = 100.0
        }
    }
    
    @IBAction func easeOutAnimation(sender: AnyObject) {
        self.animView?.percent = 0
        UIView.animateWithDuration(SWViewController.kAnimDuration,
                                   delay: 0.0,
                                   options:[.CurveEaseOut, .Autoreverse],
                                   animations: {
                                    self.animView?.percent = 100.0
            },
                                   completion: { finished in
                                    if finished == true {
                                        self.animView?.percent = 0
                                    }
            }
        )
    }
    
    @IBAction func springAnimation(sender: AnyObject) {
        self.animView?.percent = 0
        UIView.animateWithDuration(SWViewController.kAnimDuration, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.6, options: [], animations: {
            self.animView?.percent = 100.0
            }, completion: nil)
    }
}
