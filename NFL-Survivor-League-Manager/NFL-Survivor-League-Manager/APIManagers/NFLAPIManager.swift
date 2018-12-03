//
//  NFLAPIManager.swift
//  NFL-Survivor-League-Manager
//
//  Created by Jacob Frick on 11/23/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import Foundation

class NFLAPIManager {
    static let baseURL = "https://api.mysportsfeeds.com/v2.0/pull/nfl/2018-regular/games.json"
    static let apiKey = "5b674b93-58b5-4ed8-80f8-1548e9"
    static let password = "MYSPORTSFEEDS"
    
    static func grabFullNFLSeason(completion: @escaping(Schedule?, Error?) -> ()) {
        let passwordString = "\(NFLAPIManager.apiKey):\(NFLAPIManager.password)"
        let passwordData = passwordString.data(using: String.Encoding.ascii)
        let base64Pass = passwordData?.base64EncodedString()
        let base64Password = base64Pass!
        //print(base64Password)
        let url = URL(string: NFLAPIManager.baseURL)!
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Authorization" : "Basic \(String(describing: base64Password))"]
        let session = URLSession(configuration: config, delegate: nil, delegateQueue: OperationQueue.main)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let gamesArrayOfDictionarys = dataDictionary["games"] as? [[String : Any]]
                //print(gamesArrayOfDictionarys)
                let schedule = Schedule(gamesArrayOfDictionarys!)
                completion(schedule, nil)
            }
            if let error = error {
                print(error.localizedDescription)
                completion(nil, error)
            }
        }
        task.resume()
    }
}
