//
//  PhotoHeaderCollectionViewCell.swift
//  Demo500px
//
//  Created by EsmaGO on 3/22/20.
//  Copyright © 2020 EsmaGO. All rights reserved.
//

import SDWebImage

class PhotoHeaderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.translatesAutoresizingMaskIntoConstraints = true
    }
    
    func setPhoto(_ url: String) {
        guard let imageUrl = URL(string: url) else { return }
        imageView?.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imageView?.sd_setImage(with: imageUrl)
    }
}
