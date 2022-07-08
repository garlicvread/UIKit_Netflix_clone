//
//  SearchViewController.swift
//  uikitNetflix
//
//  Created by 김제필 on 7/3/22.
//

import UIKit

class SearchViewController: UIViewController {
    private var titles: [Title] = [Title]()
    
    private let tableForDiscoveredTitles: UITableView = {
        let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always

        view.backgroundColor = .systemBackground

        view.addSubview(tableForDiscoveredTitles)

        // Set a delegate pattern + data source -> controller for the view
        // Implement the functions to pass the data and the number of rows
        tableForDiscoveredTitles.delegate = self
        tableForDiscoveredTitles.dataSource = self

        fetchDiscoveredMovies()
    }

    private func fetchDiscoveredMovies() {
        APICaller.shared.getDiscoveredMovie { [weak self] result in
            switch result {
                case .success(let titles):
                    self?.titles = titles
                    DispatchQueue.main.async {
                        self?.tableForDiscoveredTitles.reloadData()
                    }

                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


    // Layout for the tableForSearchTitles
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableForDiscoveredTitles.frame = view.bounds
    }
}


extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else {
            return UITableViewCell()
        }
       
        let title = titles[indexPath.row]
        let model = TitleViewModel(titleName: title.original_name ?? title.original_title ?? "Unknown title", posterURL: title.poster_path ?? "")
        
        cell.configure(with: model)
        return cell;
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
