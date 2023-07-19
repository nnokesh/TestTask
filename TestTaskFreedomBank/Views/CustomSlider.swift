//
//  CustomSlider.swift
//  TestTaskFreedomBank
//
//  Created by Nursultan on 17.07.2023.
//

import UIKit

///A custom slider control that modifies the appearance of the track.

final class CustomSlider: UISlider {
    
    // MARK: - Customization
    
    /**
     Overrides the default track rectangle for the slider control.
     
     - Parameter bounds: The bounding rectangle of the slider control.
     - Returns: A modified track rectangle with a custom height and width.
     */
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        var newBounds = super.trackRect(forBounds: bounds)
        newBounds.size.height = 6
        newBounds.origin.y = (bounds.size.height - newBounds.size.height) / 2
        newBounds.size.width = 80
        return newBounds
    }
}
