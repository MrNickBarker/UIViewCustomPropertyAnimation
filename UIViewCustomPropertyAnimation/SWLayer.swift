//
//  SWLayer.swift
//  UIViewCustomPropertyAnimation
//
//  Created by Nikola Lajic on 6/13/16.
//  Copyright © 2016 codecentric. All rights reserved.
//

import UIKit

class SWLayer: CALayer {
    @NSManaged var percent: CGFloat
    
    override init() {
        super.init()
    }
    
    override init(layer: AnyObject) {
        super.init(layer: layer)
        if let layer = layer as? SWLayer {
            percent = layer.percent
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private class func isCustomAnimKey(key: String) -> Bool {
        return key == "percent"
    }
    
    override class func needsDisplayForKey(key: String) -> Bool {
        if self.isCustomAnimKey(key) {
            return true
        }
        return super.needsDisplayForKey(key)
    }
    
    override func actionForKey(event: String) -> CAAction? {
        if SWLayer.isCustomAnimKey(event) {
            if let animation = super.actionForKey("backgroundColor") as? CABasicAnimation {
                animation.keyPath = event
                if let pLayer = presentationLayer() {
                    animation.fromValue = pLayer.percent
                }
                animation.toValue = nil
                return animation
            }
            setNeedsDisplay()
            return nil
        }
        return super.actionForKey(event)
    }
}
