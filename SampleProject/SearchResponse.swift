//
//  SearchResponse.swift
//  SampleProject
//
//  Created by kurokawahirokazu on 2020/08/30.
//  Copyright © 2020 kurokawahirokazu. All rights reserved.
//

import Foundation

struct SearchResponse<Item: Decodable>: Decodable {

    let totalCount: Int
    let items: [Item]
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}
