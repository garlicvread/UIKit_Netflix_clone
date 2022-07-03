//
//  HomeViewController.swift
//  uikitNetflix
//
//  Created by 김제필 on 7/3/22.
//

import UIKit

class HomeViewController: UIViewController {

    private let homeFeatureTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)

        table.register(CollectionViewForTableViewCell.self, forCellReuseIdentifier: CollectionViewForTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeatureTable)

        homeFeatureTable.delegate = self
        homeFeatureTable.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeatureTable.frame = view.bounds
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }

    func tableView(_ tableview: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = "Hello World!"  // only for testing
//        cell.backgroundColor = .red
//        return cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewForTableViewCell.identifier, for: indexPath) as? CollectionViewForTableViewCell else {
            return UITableViewCell()
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
