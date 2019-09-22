//
//  JSONDecode.swift
//  PennLabsiOSChallenge
//
//  Created by Sam Brause on 9/22/19.
//  Copyright © 2019 Sam Brause. All rights reserved.
//

import Foundation
import UIKit

class JSONDecode {
    static func parseJSON(url:URL, callback: @escaping (DiningDocument) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print(error!)
            }else{
                if let urlContent = data {
                    do{
                        
                        let user = try JSONDecoder().decode(DiningDocument.self, from: urlContent)
                        callback(user)
                    }catch{
                        print("Json Processing Failed")
                    }
                }
            }
        }
        task.resume();
    }
}
