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
            XCTAssertEqual(photos[0].name, "Maya")
            XCTAssertEqual(photos[0].user.fullName, "Sean Archer")
            XCTAssertEqual(photos[0].user.imagePath, "https://drscdn.500px.org/user_avatar/777395/q%3D85_w%3D300_h%3D300/v2?webp=true&v=59&sig=191cb2b0c262728622ed985a893aab9b7d79de4bc78b423725e63044343957b3")
            
            
            XCTAssertEqual(photos[1].id, 1012619843)
            XCTAssertEqual(photos[1].width, 1600)
            XCTAssertEqual(photos[1].height, 878)
            XCTAssertEqual(photos[1].format, "jpg")
            XCTAssertEqual(photos[1].location, "Atlantic Ocean")
            XCTAssertEqual(photos[1].imagePath[0], "https://drscdn.500px.org/photo/1012619843/q%3D50_h%3D450/v2?sig=4562d4f14b78f72015e64539f55cdda0468a77817360e270c0fe9acb74f49619")
            XCTAssertEqual(photos[1].name, "Shell Beach")
            XCTAssertEqual(photos[1].user.fullName, "Greg Boratyn")
            XCTAssertEqual(photos[1].user.imagePath, "https://drscdn.500px.org/user_avatar/570437/q%3D85_w%3D300_h%3D300/v2?webp=true&v=7&sig=1a692925655fae709146040d7115df7ae1eee03bcab82f79f4754dedfc1dc326")
            
            
            XCTAssertEqual(photos[2].id, 1012595189)
            XCTAssertEqual(photos[2].width, 6000)
            XCTAssertEqual(photos[2].height, 3375)
            XCTAssertEqual(photos[2].format, "jpg")
            XCTAssertEqual(photos[2].location, "Alqueva, Portugal")
            XCTAssertEqual(photos[2].imagePath[0], "https://drscdn.500px.org/photo/1012595189/q%3D50_h%3D450/v2?sig=d9f497e5a5f4cd32fd624f5abf6465a2db99f24356df918615779768a8faf05d")
            XCTAssertEqual(photos[2].name, "the power of the universe")
            XCTAssertEqual(photos[2].user.fullName, "Luís Casaca")
            XCTAssertEqual(photos[2].user.imagePath, "https://drscdn.500px.org/user_avatar/23101355/q%3D85_w%3D300_h%3D300/v2?webp=true&v=37&sig=d8761e01e11fcaaf4a5c9af4184a6dba2ad04be22cda242ae3dba3d6e8bd004c")
        } catch {
            XCTFail()
        }
    }
    
}
