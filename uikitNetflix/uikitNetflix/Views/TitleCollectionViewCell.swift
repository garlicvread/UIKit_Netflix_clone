//
//  TitleCollectionViewCell.swift
//  uikitNetflix
//
//  Created by 김제필 on 7/6/22.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    static let identifier = "TitleCollectionViewCell"

    // imageView to show the posters
    // closure(anonuymous function, lambda function) pattern
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill  // fill the entire cell regardless the size of the cell.
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }

    // 3rd party library to retrieve/cache the poster images
    // When dequeue a cell from the collectionView -> update the poster for each cell: public function

    public func configure(with model: String) {
//        guard let url = URL(string: model) else {return}
//        posterImageView.sd_setImage(with: url, completed: nil)
//        print(model)
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else {return}
        posterImageView.sd_setImage(with: url, completed: nil)
    }
}
