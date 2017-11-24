//
//  NetworkAPI.swift
//  Football Leagues
//
//  Created by Mohammad Shaker on 11/24/17.
//  Copyright © 2017 Mohammad Shaker. All rights reserved.
//

import UIKit
import Alamofire

class NetworkAPI: NSObject {
    
    // ======================================
    // ==== Post = JSON, Response = JSON ====
    // ======================================
    
    func postJSON(url: String!, parameters: [String: AnyObject]!, headers: [String: String]!, successBlock: @escaping (_ responseJsonValue: [String: AnyObject]?) -> Void, failureBlock: @escaping (_ error: String) -> Void)
    {
        ProgressUtility.showProgressView()
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers)
            .responseJSON { response in
                
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                switch response.result {
                case .success( _):
                    if let json = response.result.value {
                        print("JSON: \(json)")
                        successBlock(json as? [String : AnyObject])
                    }
                    else {
                        failureBlock(NSLocalizedString("Parsing Error", comment: ""))
                    }
                    
                case .failure(let error):
                    print("Request failed with error: \(error)")
                    failureBlock(error.localizedDescription)
                }
                
                ProgressUtility.dismissProgressView()
        }
    }
    
    
    // =======================================
    // ==== Get = Normal, Response = JSON ====
    // =======================================
    
    func get(url: String!, parameters: [String: AnyObject]!, headers: [String: String]!, successBlock: @escaping (_ responseJsonValue: [String: AnyObject]) -> Void, failureBlock: @escaping (_ error: String) -> Void)
    {
        ProgressUtility.showProgressView()
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).validate()
            .responseJSON { response in
                
                print(response.request as Any)  // original URL request
                print(response.response as Any) // URL response
                print(response.data as Any)     // server data
                print(response.result)   // result of response serialization
                
                switch response.result {
                case .success( _):
                    if let json = response.result.value {
                        print("JSON: \(json)")
                        successBlock(json as? [String : AnyObject] ?? [:])
                    }
                    else {
                        failureBlock(NSLocalizedString("Parsing Error", comment: ""))
                    }
                    
                case .failure(let error):
                    print("Request failed with error: \(error)")
                    failureBlock(NSLocalizedString("Request Failed", comment: "") + error.localizedDescription)
                }
                
                ProgressUtility.dismissProgressView()
        }
        
    }
    
    
    // =============================================
    // ==== Get = Normal, Response = JSON Array ====
    // =============================================
    
    func getJsonArray(url: String!, parameters: [String: AnyObject]!, headers: [String: String]!, successBlock: @escaping (_ responseJsonValue: [[String: AnyObject]]) -> Void, failureBlock: @escaping (_ error: String) -> Void)
    {
        ProgressUtility.showProgressView()
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).validate()
            .responseJSON { response in
                
                print(response.request as Any)  // original URL request
                print(response.response as Any) // URL response
                print(response.data as Any)     // server data
                print(response.result)   // result of response serialization
                
                switch response.result {
                case .success( _):
                    if let json = response.result.value {
                        print("JSON: \(json)")
                        successBlock(json as? [[String : AnyObject]] ?? [])
                    }
                    else {
                        failureBlock(NSLocalizedString("Parsing Error", comment: ""))
                    }
                    
                case .failure(let error):
                    print("Request failed with error: \(error)")
                    failureBlock(NSLocalizedString("Request Failed", comment: "") + error.localizedDescription)
                }
                
                ProgressUtility.dismissProgressView()
        }
        
    }
    
}
