//
//  PopularPhotosCollectionViewController.swift
//  Demo500px
//
//  Created by EsmaGO on 3/22/20.
//  Copyright © 2020 EsmaGO. All rights reserved.
//

import UIKit
import SDWebImage

protocol PopularPhotosDisplayLogic: class {
    /// Displays posts on the PopularPhotos Scene.
    func displayPhotos(_ viewModels: [PhotosModel.ViewModel.PhotoViewModel])
    /// Notifies  photo display to router of the PhotoDetail Scene.
    func displaySelectedPhoto()
}

class PopularPhotosCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    var interactor: PopularPhotosBusinessLogic?
    var router: (PopularPhotosRoutingLogic & PopularPhotosDataPassing)?
    
    var photos:[PhotosModel.ViewModel.PhotoViewModel] = [] {
        didSet {
            self.cellSizes = self.getCellSizes(for: photos)
        }
    }
    private var cellSizes:[CGSize] = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    private let reuseIdentifier = "PhotoCollectionViewCell"
    private let headerResuseIdentifier = "PhotoHeaderCollectionViewCell"
    
    
    // MARK: - Object lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addIndicator()
        interactor?.getPopularPhotos()
    }
    
    // MARK: - Helpers
    
    /// Adds activity indicator on collectionView.
    private func addIndicator() {
        let indicator = UIActivityIndicatorView(style: .whiteLarge)
        indicator.color = .black
        indicator.center = collectionView.center
        indicator.startAnimating()
        collectionView.backgroundView = indicator
    }
    
    private func getCellSizes(for photos: [PhotosModel.ViewModel.PhotoViewModel]) -> [CGSize] {
        var i = 0
        var sizes:[CGSize] = []
        
        let fullWidth = self.view.frame.size.width - 16
        
        while i < photos.count - 1 {
            let size1 = CGSize(width: CGFloat(photos[i].width),
                               height: CGFloat(photos[i].height))
            let size2 = CGSize(width: CGFloat(photos[i+1].width),
                               height: CGFloat(photos[i+1].height))
            
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
        if photos.count % 2 != 0 {
            guard let photo = photos.last else { return sizes }
            let height = fullWidth * CGFloat(photo.height) / CGFloat(photo.width)
            let size = CGSize(width: fullWidth, height: height)
            sizes.append(size)
        }
        return sizes
    }
    
    // MARK: - UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if section == 0 {
            return photos.count > 0 ?  1 : 0
        }
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerResuseIdentifier, for: indexPath) as? PhotoHeaderCollectionViewCell  {
                cell.setPhoto(photos[indexPath.row].imagePath)
                return cell
                
            }
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoCollectionViewCell  {
                cell.setPhoto(photos[indexPath.row].imagePath)
                cell.dropShadow()
                return cell
            }
        }
        
        return UICollectionViewCell()
    }
    
    // MARK: - UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        router?.showPhotoDetail(photos[indexPath.row] )
    }
    
}

extension PopularPhotosCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            let fullWidth = self.view.frame.size.width
            return CGSize(width: fullWidth, height: 370)
        } else {
            return cellSizes[indexPath.row]
        }
    }
    
}

extension PopularPhotosCollectionViewController: PopularPhotosDisplayLogic {
    func displayPhotos(_ viewModels: [PhotosModel.ViewModel.PhotoViewModel]) {
        self.photos = viewModels
        collectionView.backgroundView = nil
    }
    
    func displaySelectedPhoto() {
        
    }
}
