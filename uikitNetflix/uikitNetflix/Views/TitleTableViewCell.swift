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

    private let playTitleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
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
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlePosterUIImageView)
        contentView.addSubview(titleLables)
        contentView.addSubview(playTitleButton)

        applyConstraints()
    }

    private func applyConstraints() {
        let titlePosterUIImageViewContraints = [
            titlePosterUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlePosterUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            titlePosterUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            titlePosterUIImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let titleLableConstraints = [
            titleLables.leadingAnchor.constraint(equalTo: titlePosterUIImageView.trailingAnchor, constant:  20),
            titleLables.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ]

        NSLayoutConstraint.activate(titlePosterUIImageViewContraints)
        NSLayoutConstraint.activate(titleLableConstraints)
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
