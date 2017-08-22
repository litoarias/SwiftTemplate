//
//  TemplateSwift3Tests.swift
//  TemplateSwift3Tests
//
//  Created by Hipolito Arias on 17/08/2017.
//  Copyright © 2017 Hipolito Arias. All rights reserved.
//

import XCTest

import OHHTTPStubs
import Alamofire
import ObjectMapper

@testable import TemplateSwift3

class TemplateSwift3Tests: XCTestCase {
      
    
    var networkService: RealNetworkRequest = {
        let session = NetworkSessionManager.shared
        let sessionmanger = session.sessionManager.session
        sessionmanger.configuration.urlCache = nil
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        let sM = SessionManager(configuration: configuration)
        OHHTTPStubs.setEnabled(true, for: configuration)
        return RealNetworkRequest(sessionManager: session)
    }()
    
    func testAlamofireGetPostsSuccess() {
        
        stub(condition: isMethodGET() && isHost("jsonplaceholder.typicode.com") && isPath("/posts")) { request -> OHHTTPStubsResponse in
            
            guard let path = OHPathForFile("posts.json", type(of: self)) else {
                preconditionFailure("Could not find expected file in test bundle")
            }
            
            return OHHTTPStubsResponse(
                fileAtPath: path,
                statusCode: 200,
                headers: ["Content-Type":"application/json"]
            )
        }
        
        let successExpectation = self.expectation(description: "success called")
        networkService.request(router: DemoRouter.postsA(), adapter: nil) { (result) in
            switch result {
            case .success(.array (let response)):
                XCTAssertNotNil(response)
                successExpectation.fulfill()
            default:
                XCTFail()
            }
        }
        
        waitForExpectations(timeout: 1.0, handler: nil)
        
        OHHTTPStubs.removeAllStubs()
    }
    
    func testAlamofireGetPostsFailure() {
        
        stub(condition: isMethodGET() && isHost("jsonplaceholder.typicode.com") && isPath("/posts")) { request -> OHHTTPStubsResponse in
            
            return OHHTTPStubsResponse(
                error: NSError( domain: "test", code: 42, userInfo: [:] )
            )
        }
        
        let successExpectation = self.expectation(description: "failure called")
        networkService.request(router: DemoRouter.postsA(), adapter: nil) { (result) in
            switch result {
            case .success(.array (_)):
                XCTFail()
            default:
                successExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 1.0, handler: nil)
        
        OHHTTPStubs.removeAllStubs()
    }
    
}
