//
//  CustomSlider.swift
//  TestTaskFreedomBank
//
//  Created by Nursultan on 17.07.2023.
//

import UIKit

class CustomSlider: UISlider {
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        var newBounds = super.trackRect(forBounds: bounds)
        newBounds.size.height = 6
        newBounds.origin.y = (bounds.size.height - newBounds.size.height) / 2 
        newBounds.size.width = 80
        return newBounds
    }
}
