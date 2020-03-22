//
//  PopularPhotosCollectionViewController.swift
//  Demo500px
//
//  Created by EsmaGO on 3/22/20.
//  Copyright © 2020 EsmaGO. All rights reserved.
//

import UIKit
import SDWebImage


private let reuseIdentifier = "PhotoCollectionViewCell"
private let headerResuseIdentifier = "PhotoHeaderCollectionViewCell"

class PopularPhotosCollectionViewController: UICollectionViewController {
    
    var photos:[Photo] = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
    }
    
    func getData() {
        DataServer().getPopularPhotos(request: PhotosModel.Request()) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let photosModel):
                self.photos = photosModel.photos
            case .failure(let error):
                print(error)
            }
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
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
                cell.setPhoto(photos[indexPath.row].imagePath[0])
                return cell
                
            }
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoCollectionViewCell  {
                     cell.setPhoto(photos[indexPath.row].imagePath[0])
                     return cell
            }
        }

        return UICollectionViewCell()
    }

    // MARK: - UICollectionViewDelegate


}

extension PopularPhotosCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let photoWidth = photos[indexPath.row].width
        let photoHeigth = photos[indexPath.row].height

        let ratio:CGFloat = CGFloat(photoHeigth) / CGFloat(photoWidth)
        let width = self.view.frame.width
        let height = width * ratio

        if indexPath.section == 0 {
             return CGSize(width: width, height: 370)
        } else {
             return CGSize(width: width, height: height)
        }
        
    }

}
