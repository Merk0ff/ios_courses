//
//  ViewController.swift
//  hw1
//
//  Created by Филипп Дукштау on 16/03/2019.
//  Copyright © 2019 merk0ff. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
  private let peopleDataNetwork: PeopleService = PeopleDataNetwork()
  private var peoples = [People]()
  private var url: String? = "https://swapi.co/api/people/"

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.dataSource = self
    tableView.rowHeight = 100

    guard let url = url else {
      return
    }

    peopleDataNetwork.getPeoples(url: url) { characters, url in

      self.peoples.append(contentsOf: characters)
      self.url = url

      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }

    return
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return peoples.count
  }

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell

    cell?.nameLabel?.text = peoples[indexPath.row].name
    //cell?.nameLabel?.sizeToFit()

    return cell!
  }
}
