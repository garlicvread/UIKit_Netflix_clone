//
//  TitleTableViewCell.swift
//  uikitNetflix
//
//  Created by 김제필 on 7/7/22.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

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

    static let identifier = "TitleTableViewCell"

    private let playButtonForTitles: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
//        button.setImage(UIImage(systemName: "play.circle"), for: .normal)
        button.setImage(image, for: .normal)  // image above is passed here
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()

    private let titleLables: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let titlePosterUIImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true  // Prevent the poster images overflow the container.
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlePosterUIImageView)
        contentView.addSubview(titleLables)
        contentView.addSubview(playButtonForTitles)

        applyConstraints()
    }

    private func applyConstraints() {
        let titlePosterUIImageViewContraints = [
            titlePosterUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlePosterUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            titlePosterUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            titlePosterUIImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let titleLableConstraints = [
            titleLables.leadingAnchor.constraint(equalTo: titlePosterUIImageView.trailingAnchor, constant:  20),
            titleLables.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ]

        let playButtonForTitlesConstraints = [
            playButtonForTitles.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            playButtonForTitles.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ]

        NSLayoutConstraint.activate(titlePosterUIImageViewContraints)
        NSLayoutConstraint.activate(titleLableConstraints)
        NSLayoutConstraint.activate(playButtonForTitlesConstraints)
    }

    public func configure(with model: TitleViewModel) {
//        guard let url = URL(string: model.posterURL) else {
//            return
//        }

        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL ?? "")") else {
            return
        }

        titlePosterUIImageView.sd_setImage(with: url, completed: nil)
        titleLables.text = model.titleName
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
