//
//  CustomCell.swift
//  TestTaskFreedomBank
//
//  Created by Nursultan on 17.07.2023.
//

import UIKit

final class CustomCell: UITableViewCell {
    
    static let identifier = "CustomCell"
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "LogoNetflix"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "NFLX.US"
        label.font = UIFont(name: "Helvetica-Bold", size: 16)
        return label
    }()
    
    let totalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "6 шт по 300,40"
        label.textColor = .lightGray
        return label
    }()
    
    let dataStackView: UIStackView = {
        let dataStackView = UIStackView()
        dataStackView.axis = .vertical
        dataStackView.spacing = 3
        dataStackView.translatesAutoresizingMaskIntoConstraints = false
        return dataStackView
    }()
    
    let walletLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2 090,80 $"
        let attributedString = NSMutableAttributedString(string: label.text ?? "")
        let boldFont = UIFont(name: "Helvetica-Bold", size: 16)
        attributedString.addAttributes([.font: boldFont ?? ""], range: NSRange(location: 0, length: 5))
        let regularFont = UIFont.systemFont(ofSize: 14)
        attributedString.addAttributes([.font: regularFont], range: NSRange(location: 6, length: 3)) //
        label.attributedText = attributedString
        return label
    }()
    
    let percentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "+0,10 (0,41%)"
        label.textColor = .systemGreen
        return label
    }()
    
    let numberStackView: UIStackView = {
        let numberStackView = UIStackView()
        numberStackView.axis = .vertical
        numberStackView.spacing = 3
        numberStackView.alignment = .trailing
        numberStackView.translatesAutoresizingMaskIntoConstraints = false
        return numberStackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(logoImageView)
        contentView.addSubview(dataStackView)
        contentView.addSubview(numberStackView)

        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeConstraints() {
        
        [nameLabel, totalLabel].forEach { dataStackView.addArrangedSubview($0) }
        [walletLabel, percentLabel].forEach { numberStackView.addArrangedSubview($0) }


    NSLayoutConstraint.activate([
        logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
        logoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
        logoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
        dataStackView.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 15),
        dataStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        numberStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
        numberStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
        
