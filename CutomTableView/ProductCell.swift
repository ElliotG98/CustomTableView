//
//  ProductCell.swift
//  CutomTableView
//
//  Created by Elliot Glaze on 20/09/2019.
//  Copyright © 2019 Elliot Glaze. All rights reserved.
//

import UIKit

protocol ProductCellDelegate {
    func increaseNumber(cell: ProductCell, number: Int)
    func decreaseNumber(cell: ProductCell, number: Int)
}

class ProductCell: UITableViewCell {
    var delegate : ProductCellDelegate?
    let minValue = 0
    
    var product : Product? {
        didSet {
            productImage.image = product?.productImage
            productNameLabel.text = product?.productName
            productDescriptionLabel.text = product?.productDesc
        }
    }
    
    private let productNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    private let productDescriptionLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    private let decreaseButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "minus"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        return btn
    }()
    private let increaseButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "plus"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        return btn
    }()
    var productQuantity: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.text = "1"
        label.textColor = .black
        return label
    }()
    private let productImage: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "soap"))
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()
    
    @objc func decreaseFunc() {
        changeQuantity(by: -1)
    }
    @objc func increaseFunc() {
        changeQuantity(by: 1)
    }
    func changeQuantity(by amount: Int) {
        var quantity = Int(productQuantity.text!)!
        quantity += amount
        if quantity < minValue {
            quantity = 0
            productQuantity.text = "0"
        }else {
            productQuantity.text = "\(quantity)"
        }
        delegate?.decreaseNumber(cell: self, number: quantity)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(productImage)
        addSubview(productNameLabel)
        addSubview(productDescriptionLabel)
        addSubview(decreaseButton)
        addSubview(productQuantity)
        addSubview(increaseButton)
        
        productImage.anchor(top: topAnchor, left: leadingAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: 0, enableInsets: false)
        productNameLabel.anchor(top: topAnchor, left: productImage.trailingAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        productDescriptionLabel.anchor(top: productNameLabel.bottomAnchor, left: productImage.trailingAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        
        let stackView = UIStackView(arrangedSubviews: [decreaseButton, productQuantity, increaseButton])
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.spacing = 5
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: productNameLabel.trailingAnchor, bottom: bottomAnchor, right: trailingAnchor, paddingTop: 15, paddingLeft: 5, paddingBottom: 15, paddingRight: 10, width: 0, height: 70, enableInsets: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
