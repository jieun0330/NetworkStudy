//
//  LottoModel.swift
//  SeSAC_HW_Network
//
//  Created by 박지은 on 1/16/24.
//

import Foundation

struct Lotto: Decodable {
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
}
