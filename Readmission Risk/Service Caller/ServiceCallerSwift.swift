//
//  ServiceCallerSwift.swift
//  NSURLSessionSwift
//
//  Created by sismac001 on 07/03/17.
//  Copyright © 2017 SparxIt. All rights reserved.
//

import UIKit

@objc protocol ServiceCallerDelegate:class {
    
    @objc optional func responseData(dict:Dictionary<String, AnyObject>, requestName: String)
    @objc optional func getError(error:Error, requestName:String)
    @objc optional func makeGETAPI(_ requestName:String,urlString:String,success:@escaping (_ dict:Dictionary<String,AnyObject>,_ requestName:String)->Void,failure:@escaping (_ error:Error,_ requestName:String)->Void)
    @objc optional func makePostAPI(_ dict: Dictionary<String, Any>, requestName: String,urlString:String,postString:String,success:@escaping (_ dict:Dictionary<String,AnyObject>,_ requestName:String)->Void,failure:@escaping (_ error:Error,_ requestName:String)->Void)
}

class ServiceCallerSwift: NSObject {
    
    var delegate:ServiceCallerDelegate!
    
    func makeGETAPI(_ requestName:String,urlString:String,success:@escaping (_ dict:Dictionary<String,AnyObject>,_ requestName:String)->Void,failure:@escaping (_ error:Error,_ requestName:String)->Void){
        let configuration = URLSessionConfiguration .default
        let session = URLSession(configuration: configuration)
        
        var request = URLRequest(url: URL(string: urlString as String)!)
        request.httpMethod = "GET"
        request.timeoutInterval = 30
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) in
            
            if(error != nil){
                print("error")
                failure(error!,requestName)
            }else{
//                do{
//                    let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String : AnyObject]
//                    success(json,requestName)
//
//                }catch let error as NSError{
//                    print(error)
//                    failure(error,requestName)
//                }
                
                do {
                    let object = try JSONSerialization.jsonObject(with: data!, options:.allowFragments)
                    if let json = object as? [String: AnyObject] {
                        success(json,requestName)
                    }
                    else if let json = object as? Array<Dictionary<String,AnyObject>>
                    {
                        if json.count > 0
                        {
                            success(json[0],requestName)
                        }
                        else
                        {
                            success([:],requestName)
                        }
                    }
                    
                } catch let error as NSError{
                    // Handle Error
                    failure(error,requestName)
                }
            }
        })
        dataTask.resume()
    }
    
    
    func makePostAPI(_ dict: Dictionary<String, Any>, requestName: String,urlString:String,postString:String,success:@escaping (_ dict:Dictionary<String,AnyObject>,_ requestName:String)->Void,failure:@escaping (_ error:Error,_ requestName:String)->Void) {
        
        let configuration = URLSessionConfiguration .default
        let session = URLSession(configuration: configuration)
       
        
        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = "POST"
       // request.httpBody = postString.data(using: .utf8)
        
        
        do {
            let data = try JSONSerialization.data(withJSONObject:dict)
            let dataString = String(data: data, encoding: .utf8)!
            request.httpBody = dataString.data(using: .utf8)
            // do other stuff on success
            print("Request", dataString)

        } catch {
            print("JSON serialization failed: ", error)
        }
        request.timeoutInterval = 30
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
      //  request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            if(error != nil){
                print("error")
                failure(error!,requestName)
            }else{
                
                do {
                    let object = try JSONSerialization.jsonObject(with: data!, options:.allowFragments)
                    if let json = object as? [String: AnyObject] {
                        
                        print("RESPONSE-->",json)
                        
                        success(json,requestName)
                    }
                    else if let json = object as? Array<Dictionary<String,AnyObject>>
                    {
                        print("RESPONSE-->",json)

                        if json.count > 0
                        {
                            success(json[0],requestName)
                        }
                        else
                        {
                            success([:],requestName)
                        }
                    }
                    
                } catch let error as NSError{
                    // Handle Error
                    failure(error,requestName)
                }
            }
        }
        dataTask.resume()
    }

    
    func makeGETAPI(_ requestName:String,urlString:String) {
        
        let configuration = URLSessionConfiguration .default
        let session = URLSession(configuration: configuration)
        
        //let urlString = String(format: "http://10.0.4.4/SIS359/appdata/jsondata.php?task=homeData")
        //print("url string is \(urlString)")

        var request = URLRequest(url: URL(string: urlString as String)!)
        request.httpMethod = "GET"
        request.timeoutInterval = 30
        
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) in
            
            if(error != nil){
                print("error")
            }else{
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String : AnyObject]
                    self.delegate.responseData!(dict: json, requestName: requestName)
                    
                    
                }catch let error as NSError{
                    print(error)
                    self.delegate.getError!(error: Error.self as! Error, requestName: requestName)
                }
            }
        })
        dataTask.resume()
    }
    
    func makePostAPI(_ dict: Dictionary<String, Any>, requestName: String,urlString:String,postString:String) {
        
        let configuration = URLSessionConfiguration .default
        let session = URLSession(configuration: configuration)
        
        //let urlString = String(format: "http://10.0.4.4/SIS359/appdata/jsondata.php?task=login")
        //print("url string is \(urlString)")
        
        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = "POST"
        request.timeoutInterval = 30
        
        //let postString = "email=manish@gmail.com&password=123456&&task=login"
        request.httpBody = postString.data(using: .utf8)
        
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            if(error != nil){
                print("error")
            }else{
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String : AnyObject]
                    self.delegate.responseData!(dict: json, requestName: requestName)
                    
                    
                }catch let error as NSError{
                    print(error)
                    self.delegate.getError!(error: Error.self as! Error, requestName: requestName)
                }
            }
        }
        dataTask.resume()
    }
}

