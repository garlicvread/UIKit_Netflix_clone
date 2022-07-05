//
//  HomeViewController.swift
//  uikitNetflix
//
//  Created by 김제필 on 7/3/22.
//

import UIKit

class HomeViewController: UIViewController {

    let titlesForEachSection: [String] = [
        "Trending Movies",
        "Trending TV",
        "Popular",
        "Upcoming Movies",
        "Top Rated"
    ]

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

        configureNavigationBar()

//        homeFeatureTable.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 400))
        let headerView = TopHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeFeatureTable.tableHeaderView = headerView
        
        fetchData()
    }

    private func configureNavigationBar() {
        var image = UIImage(named: "logo")
        image = image?.withRenderingMode(.alwaysOriginal)

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        navigationController?.navigationBar.tintColor = .white
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeatureTable.frame = view.bounds
    }

    private func fetchData() {
//        APICaller.shared.getTrendingMoviesList { _ in
//
//        }

//        APICaller.shared.getTrendingMoviesList { results in
//            switch results {
//            case .success(let movies):
//                print(movies)
//            case .failure(let error):
//                print(error)
//            }
//        }
//
//        APICaller.shared.getTrendingTVList { _ in
//        }
//
//        APICaller.shared.getUpcomingMovies { _ in
//
//        }

//        APICaller.shared.getPopularList { _ in
//
//        }
        
//        APICaller.shared.getTopRatedList { _ in
//
//        }
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return titlesForEachSection.count
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

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(
            x: header.bounds.origin.x + 20,
            y: header.bounds.origin.y,
            width: 100,
            height: header.bounds.height
        )
        header.textLabel?.textColor = .white
//        header.textLabel?.text = header.textLabel?.text?.lowercased()
        header.textLabel?.text = header.textLabel?.text?.capitalizeTheFirstLetter()
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titlesForEachSection[section]
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset

        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
}
