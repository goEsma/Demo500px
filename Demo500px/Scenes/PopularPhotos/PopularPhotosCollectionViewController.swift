//
//  PopularPhotosCollectionViewController.swift
//  Demo500px
//
//  Created by EsmaGO on 3/22/20.
//  Copyright © 2020 EsmaGO. All rights reserved.
//

import UIKit

protocol PopularPhotosDisplayLogic: class {
    /// Displays posts on the PopularPhotos Scene.
    func displayPhotos(_ viewModels: [PhotosModel.ViewModel.PhotoViewModel])
    /// Notifies  photo display to router of the PhotoDetail Scene.
    func displaySelectedPhoto()
}

class PopularPhotosCollectionViewController: UICollectionViewController, PhotoCellSizeable {

    // MARK: - Properties
    var interactor: PopularPhotosBusinessLogic?
    var router: (PopularPhotosRoutingLogic & PopularPhotosDataPassing)?
    
    var photos:[PhotosModel.ViewModel.PhotoViewModel] = [] {
        didSet {
            self.cellSizes = getCellSizes(photos, for: self.view)
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
