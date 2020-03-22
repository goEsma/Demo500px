//
//  AppRouter.swift
//  Demo500px
//
//  Created by EsmaGO on 3/22/20.
//  Copyright © 2020 EsmaGO. All rights reserved.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}

final class AppRouter: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    
    init(with rootVC: UINavigationController) {
        navigationController = rootVC
    }
    
    func start() {
        showPopularPhotosScene()
    }
    
    func showPopularPhotosScene() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let popularPhotoVC = storyboard.instantiateViewController(withIdentifier: "PopularPhotosCollectionViewController") as? PopularPhotosCollectionViewController else { return }
        
        let interactor = PopularPhotosInteractor()
        let presenter = PopularPhotosPresenter()
        let router = PopularPhotosRouter()
        
        popularPhotoVC.interactor = interactor
        popularPhotoVC.router = router
        interactor.presenter = presenter
        presenter.viewController = popularPhotoVC
        router.viewController = popularPhotoVC
        router.dataStore = interactor
        
        navigationController.pushViewController(popularPhotoVC, animated: true)
    }
}
