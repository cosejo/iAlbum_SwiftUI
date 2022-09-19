//
//  PhotosListViewModelTests.swift
//  iAlbum_SwiftUITests
//
//  Created by Carlos Osejo on 19/9/22.
//

import XCTest
@testable import iAlbum_SwiftUI

class PhotosListViewModelTests: XCTestCase {
    
    let responsePageOneFilename = "SuccessGetPhotosPageOne"
    let responsePageTwoFilename = "SuccessGetPhotosPageTwo"
    let responseDoublePageilename = "SuccessGetPhotosDoublePage"
    
    var viewModel: PhotosListViewModel!
    var mockNetworkManager: MockNetworkManager!
    var photosResponse: [Photo]!
    
    //MARK: Setup
    override func setUp() {
        photosResponse = []
    }
    
    override func tearDown() {
        photosResponse = []
    }
    
    func loadPhotosResponseData(filename: String) {
        do {
            let data = try getData(fromJSON: filename)
            photosResponse = try JSONDecoder().decode([Photo].self, from: data)
        } catch {
            photosResponse = []
        }
    }
    
    func setupViewModel(result: ResponseResult) {
        mockNetworkManager = MockNetworkManager(result: result, photosResponse: photosResponse)
        viewModel = PhotosListViewModel(networkManager: mockNetworkManager)
    }
    
    //MARK: Utils
    
    /**
     * Configure the Network Manager to respond successfully the request with the page one file
     */
    func givenGetPhotosPageOnceWillSucceed() {
        loadPhotosResponseData(filename: responsePageOneFilename)
        setupViewModel(result: .success)
    }
    
    /**
     * Configure the Network Manager to respond successfully the request with the page one, load photos and then respond successfully the next request with the page two file
     */
    func givenGetPhotosPageTwoWillSucceed() {
        givenGetPhotosPageOnceWillSucceed()
        viewModel.loadPhotos()
        loadPhotosResponseData(filename: responsePageTwoFilename)
        mockNetworkManager.photosResponse = photosResponse
    }
    
    /**
     * Configure the Network Manager to respond successfully both of the requests  with the page one and two, load photos and then respond successfully the next request with the double page file
     */
    func givenGetPhotosPageTwoAndReloadWillSucceed() {
        givenGetPhotosPageOnceWillSucceed()
        viewModel.loadPhotos()
        loadPhotosResponseData(filename: responsePageTwoFilename)
        mockNetworkManager.photosResponse = photosResponse
        viewModel.loadPhotos()
        loadPhotosResponseData(filename: responseDoublePageilename)
        mockNetworkManager.photosResponse = photosResponse
    }
    
    //MARK: Tests
    func testLoadPhotosSuccessfulPageOnce() {
        givenGetPhotosPageOnceWillSucceed()
        
        viewModel.loadPhotos()
        
        assert(!viewModel.error)
        assert(photosResponse.count == viewModel.photos.count)
        assert(viewModel.photosLimit == viewModel.photos.count)
    }
    
    func testLoadPhotosSuccessfulPageTwo() {
        givenGetPhotosPageTwoWillSucceed()
        
        viewModel.loadPhotos()
        
        assert(!viewModel.error)
        assert(photosResponse.count * 2 == viewModel.photos.count)
        assert(viewModel.photosLimit < viewModel.photos.count)
    }
    
    func testLoadPhotosErrorResponse() {
        setupViewModel(result: .failure)
        
        viewModel.loadPhotos()
        
        assert(!viewModel.error)
        assert(viewModel.photos.isEmpty)
        assert(photosResponse.count == viewModel.photos.count)
    }
    
    func testReloadPhotosSucessful() {
        givenGetPhotosPageTwoAndReloadWillSucceed()
        
        viewModel.reloadPhotos()
        
        
        assert(!viewModel.error)
        assert(photosResponse.count == viewModel.photos.count)
        assert(viewModel.photosLimit * 2 == viewModel.photos.count)
    }
}
