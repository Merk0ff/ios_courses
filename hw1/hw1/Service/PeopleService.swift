//
// Created by Филипп Дукштау on 2019-03-16.
// Copyright (c) 2019 merk0ff. All rights reserved.
//

import Foundation

protocol PeopleService {
  func getPeoples(url inUrl: String?, _ completionHandler: @escaping (([People], String?) -> Void))
}
