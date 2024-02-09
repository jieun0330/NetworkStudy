//
//  BeerListViewController.swift
//  SeSAC_HW_Network
//
//  Created by 박지은 on 1/16/24.
//

import UIKit
import Alamofire

//Mark: - BeerViewController에 있는거랑 동일하니까 따로 빼서 같이 쓸 수 있는건가?
struct BeerList: Decodable {
    let name: String
    let image_url: String
    let description: String
}

class BeerListViewController: UIViewController {
    
    @IBOutlet var beerListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beerListTableView.delegate = self
        beerListTableView.dataSource = self
        
    }
    
    func callRequest() {
        let url = "https://api.punkapi.com/v2/beers"
        
        AF
            .request(url, method: .get)
            .responseDecodable(of: [BeerList].self) { response in
                switch response.result {
                case .success(let success):
                    print(success)
                case .failure(let failure):
                    print(failure)
                }
            }
    }
}

extension BeerListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeerListTableViewCell")!
        
        return cell
    }
}
