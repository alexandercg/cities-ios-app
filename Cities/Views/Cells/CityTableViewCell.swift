//
//  CityTableViewCell.swift
//  Cities
//
//  Created by Alexander Camacho on 3/14/19.
//  Copyright © 2019 FixieDev. All rights reserved.
//

import UIKit
import Kingfisher

class CityTableViewCell: UITableViewCell {
    
    private let defaultImage = UIImage(named: "default-image")
    private var city: City?
    private var isCollapsed = true
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .cardBackground
        return view
    }()
    
    private lazy var cityImageView: UIImageView = {
        let imageView = UIImageView(image: defaultImage)
        imageView.backgroundColor = .cityImageBackground
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.backgroundColor = .cardBackground
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .caption1)
        label.numberOfLines = 2
        label.backgroundColor = .cardBackground
        label.textColor = .appLightGray
        label.text = "No description found"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        contentView.addSubview(cardView)
        cardView.addSubview(cityImageView)
        cardView.addSubview(titleLabel)
        cardView.addSubview(descriptionLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with city: City, isCollapsed: Bool = true) {
        self.city = city
        self.isCollapsed = isCollapsed
        titleLabel.text = "\(city.name), \(city.country)"
        descriptionLabel.text = city.description ?? "No description found"
        
        if let imageURL = city.imageURL {
            cityImageView.kf.setImage(with: imageURL, placeholder: UIImage(named: "default-image"), options: nil, progressBlock: nil) { [weak self] (_, error, _, _) in
                guard let self = self else { return }
                self.cityImageView.contentMode = (error == nil) ? .scaleAspectFill : .scaleAspectFit
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        descriptionLabel.text = nil
        cityImageView.contentMode = .scaleAspectFit
        cityImageView.image = defaultImage
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cardView.frame = contentView.bounds.inset(by: CityTableDesignConstants.paddings)
        
        cityImageView.frame = cardView.bounds.inset(by: CityTableDesignConstants.paddings)
        let widthWithMargin = cardView.frame.width - (CityTableDesignConstants.paddings.left + CityTableDesignConstants.paddings.right)
        cityImageView.frame = CGRect(x: CityTableDesignConstants.paddings.left,
                                     y: CityTableDesignConstants.paddings.top,
                                     width: widthWithMargin,
                                     height: 150)
        
        var offsetY = cityImageView.frame.maxY + CityTableDesignConstants.spacing
        titleLabel.frame = CGRect(x: CityTableDesignConstants.paddings.left,
                                  y: offsetY,
                                  width: widthWithMargin,
                                  height: CityTableDesignConstants.titleHeight)
        offsetY += titleLabel.frame.height
        
        if isCollapsed {
            descriptionLabel.frame = CGRect(x: CityTableDesignConstants.paddings.left,
                                            y: offsetY,
                                            width: widthWithMargin,
                                            height: CityTableDesignConstants.descriptionHeight)
            
            setupCardView()
        } else {
            cardView.backgroundColor = .white
            titleLabel.backgroundColor = .white
            descriptionLabel.backgroundColor = .white
            descriptionLabel.numberOfLines = 0
            descriptionLabel.frame = CGRect(x: CityTableDesignConstants.paddings.left,
                                            y: offsetY,
                                            width: widthWithMargin,
                                            height: city?.description?.height(withConstrainedWidth: widthWithMargin, font: .preferredFont(forTextStyle: .caption1)) ?? CityTableDesignConstants.descriptionHeight)
        }
        
    }
    
    private func setupCardView() {
        cardView.layer.masksToBounds = false
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = 0.2
        cardView.layer.shadowOffset = CGSize(width: -1, height: 1)
        cardView.layer.shadowRadius = 4
        cardView.layer.shadowPath = UIBezierPath(rect: cardView.bounds).cgPath
        cardView.layer.shouldRasterize = true
        cardView.layer.rasterizationScale = UIScreen.main.scale
    }
    
    static func calculeHeight(_ width: CGFloat? = nil, city: City? = nil) -> CGFloat {
        var height = CityTableDesignConstants.defaultHeight
        guard let width = width, let city = city else {
            return height
        }
        height -= 40
        height += city.description?.height(withConstrainedWidth: width, font: .preferredFont(forTextStyle: .caption1)) ?? 0
        
        return height
    }
    
}

enum CityTableDesignConstants {
    static let defaultHeight: CGFloat = 271
    static let paddings = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    static let spacing: CGFloat = 8
    static let titleHeight: CGFloat = 20
    static let descriptionHeight: CGFloat = 40
}
