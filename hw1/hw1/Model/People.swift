//
//  People.swift
//  hw1
//
//  Created by Филипп Дукштау on 15/03/2019.
//  Copyright © 2019 merk0ff. All rights reserved.
//

import Foundation

struct People: Decodable {
  let name: String?
  let height: String
  let films: [String]
}
