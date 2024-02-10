//
//  BeerListTableViewCell.swift
//  SeSAC_HW_Network
//
//  Created by 박지은 on 1/16/24.
//

import UIKit

class BeerListTableViewCell: UITableViewCell {

    @IBOutlet var beerImage: UIImageView!
    @IBOutlet var beerName: UILabel!
    @IBOutlet var beerDescription: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        beerName.numberOfLines = 0
        beerName.font = UIFont.systemFont(ofSize: 12)
        beerName.textAlignment = .center
        
        beerDescription.numberOfLines = 0
        beerDescription.font = UIFont.systemFont(ofSize: 10)
        
    }

}
