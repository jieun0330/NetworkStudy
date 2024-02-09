//
//  BeerAPI.swift
//  SeSAC_HW_Network
//
//  Created by 박지은 on 2/9/24.
//

import Foundation
import Alamofire

class BeerAPI {
    
    func callRequest(completionHandler: @escaping ([Beer]) -> Void) {
        let url = "https://api.punkapi.com/v2/beers/random"
        
        AF
            .request(url)
            .responseDecodable(of: [Beer].self) { response in
                switch response.result {
                case .success(let success): // success: [Beer]
                    
                    completionHandler(success)
                    
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
    }
}
