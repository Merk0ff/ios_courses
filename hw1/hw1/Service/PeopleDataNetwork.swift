//
// Created by Филипп Дукштау on 2019-03-16.
// Copyright (c) 2019 merk0ff. All rights reserved.
//

import Alamofire
import Foundation

class PeopleDataNetwork: PeopleService {
  func getPeoples(url inUrl: String?, _ completionHandler: @escaping (([People], String?) -> Void)) {
    var peoples = [People]()
    guard var url = inUrl else {
      return
    }

    request(url).responseData {
      switch $0.result {
      case let .success(data):
        let jsonDecoder = JSONDecoder()

        if let people = try? jsonDecoder.decode(PeopleInfo.self, from: data) {
          peoples.append(contentsOf: people.results)
          url = people.next
          completionHandler(peoples, url)
        } else {
          print("FUCK")
        }

      case let .failure(error):
        print("Error: \(error)")
        return
      }
    }
  }
}
