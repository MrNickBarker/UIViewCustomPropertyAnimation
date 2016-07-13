//
//  SWView.swift
//  UIViewCustomPropertyAnimation
//
//  Created by Nikola Lajic on 6/13/16.
//  Copyright © 2016 codecentric. All rights reserved.
//

import UIKit

class SWView: UIView {
    var percent: CGFloat {
        set {
            if let layer = layer as? SWLayer {
                layer.percent = newValue
            }
        }
        get {
            if let layer = layer as? SWLayer {
                return layer.percent
            }
            return 0.0
        }
    }
    
    override class func layerClass() -> AnyClass {
        return SWLayer.self
    }
    
    override func displayLayer(layer: CALayer) {
        if let pLayer = layer.presentationLayer() as? SWLayer {
            let width = CGRectGetWidth(frame) * (pLayer.percent / 100)
            percentView.frame = CGRectMake(0, 0, width, CGRectGetHeight(frame))
            label.text = String.init(format: "%.0f", floor(pLayer.percent))
        }
    }
    
    lazy var percentView: UIView = {
        let pv = UIView(frame: self.bounds)
        pv.backgroundColor = UIColor.redColor()
        self.addSubview(pv)
        return pv
    }()
    
    lazy var label: UILabel = {
        let lb = UILabel(frame: self.bounds)
        lb.textAlignment = .Center
        lb.font = UIFont.boldSystemFontOfSize(30)
        lb.textColor = UIColor.blackColor()
        self.addSubview(lb)
        return lb
    }()
}
