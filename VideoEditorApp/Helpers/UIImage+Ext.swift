//
//  UIImage+Ext.swift
//  VideoEditorApp
//
//  Created by 张 on 2024/7/23.
//

import Foundation
import SwiftUI

extension UIImage{
    
    /// Resize image
    /// Return new UIImage with needed size and scale
    func resize(to size: CGSize, scale: CGFloat = 1.0) -> UIImage{
        let format = UIGraphicsImageRendererFormat.default()
        format.scale = scale
        let renderer = UIGraphicsImageRenderer(size: size, format: format)
        return renderer.image { _ in draw(in: CGRect(origin: .zero, size: size))}
    }
    
}

