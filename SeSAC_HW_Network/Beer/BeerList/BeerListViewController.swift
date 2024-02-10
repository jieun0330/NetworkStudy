//
//  BeerListViewController.swift
//  SeSAC_HW_Network
//
//  Created by 박지은 on 1/16/24.
//

import UIKit
import Alamofire

//Mark: - BeerViewController에 있는거랑 동일하니까 따로 빼서 같이 쓸 수 있는건가?
//struct BeerList: Decodable {
//    let name: String
//    let image_url: String
//    let description: String
//}

class BeerListViewController: UIViewController {
    
    @IBOutlet var beerListTableView: UITableView!
    
    let urlRequest = BeerAPI()
    var beerList: [Beer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beerListTableView.delegate = self
        beerListTableView.dataSource = self
        
        urlRequest.callRequest(url: .collection) { beerList in
            
            self.beerList = beerList
            self.beerListTableView.reloadData()
        }
        
        let xib = UINib(nibName: "BeerListTableViewCell", bundle: nil)
        beerListTableView.register(xib, forCellReuseIdentifier: "BeerListTableViewCell")
        
        
    }
    
    
    
    
    
    

}

extension BeerListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeerListTableViewCell")! as! BeerListTableViewCell
        
        
        
        cell.beerImage.kf.setImage(with: URL(string: beerList[indexPath.row].image_url))
        cell.beerName.text = beerList[indexPath.row].name
        cell.beerDescription.text = beerList[indexPath.row].description
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
