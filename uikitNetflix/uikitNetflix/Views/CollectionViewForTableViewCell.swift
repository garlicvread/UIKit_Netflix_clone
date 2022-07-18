//
//  CollectionViewForTableViewCell.swift
//  uikitNetflix
//
//  Created by 김제필 on 7/3/22.
//

import UIKit

class CollectionViewForTableViewCell: UITableViewCell {

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

    static let identifier = "CollectionViewForTableViewCell"

    private var titles: [Title] = [Title]()  // Initialize the array to be an empty array for now.

    private let collectionView: UICollectionView = {  // 2. update the title array here.
        // This array is updating in async function. -> 3.
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 144, height: 200)
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        contentView.addSubview(collectionView)

        collectionView.delegate = self
        collectionView.dataSource = self
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }

    // A new function configure: to feed the title for each section
    public func configure(with titles: [Title]) {
        self.titles = titles  // 1. retrieving titles within the HomeViewController.swift -> 2.
        DispatchQueue.main.async { [weak self] in  // 3. need to reload the data for the collectionView inside the main thread. -> .async
            self?.collectionView.reloadData()
        }
    }
}

extension CollectionViewForTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//        cell.backgroundColor = .cyan
//        return cell

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {
            return UICollectionViewCell()  // returning normal collectionViewCell.
        }

        guard let model = titles[indexPath.row].poster_path else {
            return UICollectionViewCell()
        }
//        cell.configure(with: titles[indexPath.row].poster_path)  // access to the configure created earlier.
        cell.configure(with: model)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)

        let title = titles[indexPath.row]
        guard let titleName = title.original_title ?? title.original_name else {
            return
        }

        APICaller.shared.getMovie(with: titleName + " trailer") { result in
            switch result {
                case .success(let videoElement):
                    print(videoElement.id)

                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
}
