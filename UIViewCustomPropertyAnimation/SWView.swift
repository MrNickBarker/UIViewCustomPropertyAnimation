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
    
	override class var layerClass: AnyClass {
        return SWLayer.self
    }
    
    override func display(_ layer: CALayer) {
		if let pLayer = layer.presentation() as? SWLayer {
            let width = frame.width * (pLayer.percent / 100)
			percentView.frame = CGRect(x: 0, y: 0, width: width, height: frame.height)
            label.text = String.init(format: "%.0f", floor(pLayer.percent))
        }
    }
    
    lazy var percentView: UIView = {
        let pv = UIView(frame: self.bounds)
		pv.backgroundColor = UIColor.red
        self.addSubview(pv)
        return pv
    }()
    
    lazy var label: UILabel = {
        let lb = UILabel(frame: self.bounds)
		lb.textAlignment = .center
		lb.font = UIFont.boldSystemFont(ofSize: 30)
        lb.textColor = UIColor.black
        self.addSubview(lb)
        return lb
    }()
}
