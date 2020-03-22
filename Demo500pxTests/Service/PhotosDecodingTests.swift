//
//  PhotosDecodingTests.swift
//  Demo500pxTests
//
//  Created by EsmaGO on 3/21/20.
//  Copyright © 2020 EsmaGO. All rights reserved.
//

import XCTest

@testable import Demo500px
class PhotosDecodingTests: XCTestCase {
    
    override func setUp() {
    }
    
    override func tearDown() {
    }
    
    func testPhotosResponse() throws {
        let bundle = Bundle(for: PhotosDecodingTests.self)
        let url = bundle.url(forResource: "Photos", withExtension: "json").unsafelyUnwrapped
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let photos = try decoder.decode(PhotosModel.Response.self, from:data).photos
            
            XCTAssertEqual(photos[0].id, 1012605653)
            XCTAssertEqual(photos[0].width, 1484)
            XCTAssertEqual(photos[0].height, 1800)
            XCTAssertEqual(photos[0].format, "jpg")
            XCTAssertEqual(photos[0].location, "New York, NY, USA")
            XCTAssertEqual(photos[0].imagePath[0], "https://drscdn.500px.org/photo/1012605653/q%3D50_h%3D450/v2?sig=b6ab36e68842573e6444c03a08ce8c007164db962045b4c3e0549b0d270034e0")
            
            
            XCTAssertEqual(photos[1].id, 1012619843)
            XCTAssertEqual(photos[1].width, 1600)
            XCTAssertEqual(photos[1].height, 878)
            XCTAssertEqual(photos[1].format, "jpg")
            XCTAssertEqual(photos[1].location, "Atlantic Ocean")
            XCTAssertEqual(photos[1].imagePath[0], "https://drscdn.500px.org/photo/1012619843/q%3D50_h%3D450/v2?sig=4562d4f14b78f72015e64539f55cdda0468a77817360e270c0fe9acb74f49619")
            
            
            XCTAssertEqual(photos[2].id, 1012595189)
            XCTAssertEqual(photos[2].width, 6000)
            XCTAssertEqual(photos[2].height, 3375)
            XCTAssertEqual(photos[2].format, "jpg")
            XCTAssertEqual(photos[2].location, "Alqueva, Portugal")
            XCTAssertEqual(photos[2].imagePath[0], "https://drscdn.500px.org/photo/1012595189/q%3D50_h%3D450/v2?sig=d9f497e5a5f4cd32fd624f5abf6465a2db99f24356df918615779768a8faf05d")
        } catch {
            XCTFail()
        }
    }
    
}
