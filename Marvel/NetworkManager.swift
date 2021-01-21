//
//  NetworkManager.swift
//  Marvel
//
//  Created by Josefina Perez on 19/01/2021.
//  Copyright © 2021 Julieta Fernández Irujo. All rights reserved.
//

import Foundation
import Alamofire
import CryptoKit
import SwiftyJSON

class NetworkManager {
    
    static let shared = NetworkManager()
    
    var publicKey: String = "0af2dd9014b30cebbc8d2b1c27ae079b"
    var privateKey: String = "4c3ef6340b8fc600962380aef1ae473aa842dd30"
    var timeStamp: String = "1"
    
    func getUrl(path: String) -> String {
        let host = "https://gateway.marvel.com/"
        let parameters = "?apikey=\(publicKey)&hash=\(createHash())&ts=\(timeStamp)"
        return "\(host)\(path)\(parameters)"
    }
    
    func createHash() -> String {
        return "b9beb64bc6bc3fdbc277954ac8cb9892"
       
//       return String(decoding: MD5.hashFunction.digest("\(timeStamp)+\(privateKey)+\(publicKey)".data(using: .utf16) ?? Data()), as: UTF16.self)
    }
    
    func getCharacters(completionHandler: @escaping (_ characters: [Character], _ error: Error?) -> Void) {
        let url = getUrl(path: "v1/public/characters")
        AF.request(url).validate().responseJSON(completionHandler: { response in
            
            if let error = response.error {
                completionHandler([], error)
            }
            
            else if let value = response.value {
                var json = JSON(value)
                var jsonChar = json["data"]["results"].arrayValue
                var arrayChar: [Character] = []
                
                for item in jsonChar {
                    let character = Character(json: item)
                    arrayChar.append(character)
                }
                
                completionHandler(arrayChar,nil)
            }
        })
        
    }
    
    func getEvents(completionHandler: @escaping (_ events: [Event], _ error: Error?) -> Void) {
        
        let url = getUrl(path: "/v1/public/events")
        AF.request(url).validate().responseJSON(completionHandler: { response in
            
            if let error = response.error {
                completionHandler([], error)
            }
            
            else if let value = response.value {
                var json = JSON(value)
                var jsonEvents = json["data"]["results"].arrayValue
                var arrayEvents: [Event] = []

                for item in jsonEvents {
                    let event = Event(json: item)
                    arrayEvents.append(event)
                }
                completionHandler(arrayEvents, nil)
            }
        })
        
    }
    
}
