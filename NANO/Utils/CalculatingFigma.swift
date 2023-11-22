//
//  CalculatingFigma.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/22.
//

import Foundation
import UIKit


//MARK: - Declarartion
let screenSize: CGRect = UIScreen.main.bounds

func calculatingWidth(width: CGFloat) -> CGFloat {
    
    let figmaWidth = 390.0
    let screenWidth = screenSize.width
    
    let width = width * screenWidth / figmaWidth
    
    return width
}

func calculatingHeight(height: CGFloat) -> CGFloat {
    
    let figmaHeight = 844.0
    let screenHeight = screenSize.height
    let height = height * screenHeight / figmaHeight
    
    return height
}

