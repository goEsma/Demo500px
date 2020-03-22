//
//  PhotoCellSizeable.swift
//  Demo500px
//
//  Created by EsmaGO on 3/23/20.
//  Copyright © 2020 EsmaGO. All rights reserved.
//

import UIKit

protocol PhotoCellSizeable {
    func getCellSizes(_ array: [Sizeable], for view: UIView) -> [CGSize]
}

extension PhotoCellSizeable {
    /// Enables conforming types to calculate cell sizes based on given `Sizeable` array.
    /// - Parameters:
    ///   - array: A `Sizeable` array that has width and height for each item.
    ///   - view: A `UIView`  provided, to calculate max width two cells can share.
    ///
    func getCellSizes(_ array: [Sizeable], for view: UIView) -> [CGSize] {
        var i = 0
        var sizes:[CGSize] = []
        
        // FIXME: Make this more generic. Right now the insets are set from the storyboard.
        let fullWidth = view.frame.size.width - 16
        
        while i < array.count - 1 {
            let size1 = CGSize(width: CGFloat(array[i].width),
                               height: CGFloat(array[i].height))
            let size2 = CGSize(width: CGFloat(array[i+1].width),
                               height: CGFloat(array[i+1].height))
            
            let ratio1 = size1.width / size1.height
            let ratio2 = size2.width / size2.height
            
            let width1 = fullWidth*ratio1/(ratio1+ratio2)
            let width2 = fullWidth*ratio2/(ratio1+ratio2)
            let height = fullWidth/(ratio1+ratio2)
            
            let newSize1 = CGSize(width: width1, height: height)
            let newSize2 = CGSize(width: width2, height: height)
            
            sizes.append(newSize1)
            sizes.append(newSize2)
            
            i += 2
        }
        if array.count % 2 != 0 {
            guard let photo = array.last else { return sizes }
            let height = fullWidth * CGFloat(photo.height) / CGFloat(photo.width)
            let size = CGSize(width: fullWidth, height: height)
            sizes.append(size)
        }
        return sizes
    }
}
