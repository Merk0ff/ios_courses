//
// Created by Филипп Дукштау on 2019-03-16.
// Copyright (c) 2019 merk0ff. All rights reserved.
//

import Foundation

struct PeopleInfo: Decodable {
  let next: String
  let results: [People]
}
