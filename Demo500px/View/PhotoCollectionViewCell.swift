//
//  PhotoCollectionViewCell.swift
//  Demo500px
//
//  Created by EsmaGO on 3/22/20.
//  Copyright © 2020 EsmaGO. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell, PhotoLoader {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}


