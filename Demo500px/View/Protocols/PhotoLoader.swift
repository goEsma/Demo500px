//
//  PhotoLoader.swift
//  Demo500px
//
//  Created by EsmaGO on 3/23/20.
//  Copyright © 2020 EsmaGO. All rights reserved.
//

import SDWebImage

/// Gives async photo loading capability to conforming types.
/// - Hides `SDWebImage` dependency from its conformers.
protocol PhotoLoader {
    var imageView: UIImageView! { get }
    func setPhoto(_ url: String)
    func setPhoto(_ url: String, on imageView: UIImageView)
}

extension PhotoLoader {
    func setPhoto(_ url: String) {
        guard let imageUrl = URL(string: url) else { return }
        imageView?.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imageView?.sd_setImage(with: imageUrl)
    }
    
    func setPhoto(_ url: String, on imageView: UIImageView) {
        guard let imageUrl = URL(string: url) else { return }
        imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imageView.sd_setImage(with: imageUrl)
    }
}
