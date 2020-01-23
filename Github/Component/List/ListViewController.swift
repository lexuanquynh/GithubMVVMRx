//
//  ListViewController.swift
//  Ahihidongoc
//
//  Created by Le Xuan Quynh on 2020/01/23.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        listTableView.delegate = self
        listTableView.dataSource = self
        
    }


}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }


}
