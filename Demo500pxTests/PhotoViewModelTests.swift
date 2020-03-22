//
//  PhotoViewModelTests.swift
//  Demo500pxTests
//
//  Created by EsmaGO on 3/23/20.
//  Copyright © 2020 EsmaGO. All rights reserved.
//

import XCTest

@testable import Demo500px
class PhotoViewModelTests: XCTestCase {

    func testPhotoViewModel() {
        let photo1 = Photo(id: 1, name: "Alaska", width: 1231, height: 3333, format: "jpg", imagePath: ["https://drscdn.500px.org/user_avatar/23101355/q%3D85_w%3D300_h%3D300/v2?webp=true&v=37&sig=d8761e01e11fcaaf4a5c9af4184a6dba2ad04be22cda242ae3dba3d6e8bd004c"], location: "Alaska, United States", user: User(fullName: "Esma Goktekin Ornek", imagePath: "https://drscdn.500px.org/user_avatar/23101355/q%3D85_w%3D100_h%3D100/v2?webp=true&v=37&sig=4e5a6acedd214c1caa71245f39c975168cb07a5ddad98956df84aa466ac7649e"))
        
        let photoResponse = PhotosModel.Response(photos: [photo1])
        let viewModels = photoResponse.getViewModel().photos
        XCTAssertNotNil(viewModels)
        
        let viewModel1 = viewModels![0]
        
        XCTAssertEqual(viewModel1.imageName, "Alaska")
        XCTAssertEqual(viewModel1.userFullName, "Esma Goktekin Ornek")
        XCTAssertEqual(viewModel1.location, "Alaska, United States")
        XCTAssertEqual(viewModel1.userImagePath, "https://drscdn.500px.org/user_avatar/23101355/q%3D85_w%3D100_h%3D100/v2?webp=true&v=37&sig=4e5a6acedd214c1caa71245f39c975168cb07a5ddad98956df84aa466ac7649e")
    }

}
