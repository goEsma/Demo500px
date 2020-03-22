//
//  PhotoDetailViewController.swift
//  Demo500px
//
//  Created by EsmaGO on 3/22/20.
//  Copyright © 2020 EsmaGO. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoDetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var userImageView: UIImageView!
    
    var viewModel: PhotosModel.ViewModel.PhotoViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        guard let viewModel = viewModel else { return }
        let url = URL(string: viewModel.imagePath)
        imageView?.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imageView.sd_setImage(with: url, completed: nil)
        
        let profileUrl = URL(string: viewModel.userImagePath)
        userImageView?.sd_imageIndicator = SDWebImageActivityIndicator.gray
        userImageView?.sd_setImage(with: profileUrl, completed: nil)
        
        titleLabel.text = "by \(viewModel.imageName)"
        
        var descriptionText = viewModel.userFullName
        if let location = viewModel.location, location != "" {
            descriptionText += " - " + location
        }
        
        descriptionLabel.text = descriptionText
    }

    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func didTap(_ sender: Any) {
        infoView.isHidden = !infoView.isHidden
        closeButton.isHidden = !closeButton.isHidden
    }
}
