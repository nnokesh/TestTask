//
//  CustomCell.swift
//  TestTaskFreedomBank
//
//  Created by Nursultan on 18.07.2023.
//

import UIKit


///A custom table view cell for displaying information about a specific item.
 final class CustomCell: UITableViewCell {
    
    // MARK: - Properties
    
    /// The reuse identifier for the custom cell.
    static let identifier = "CustomCell"
    
    /// The image view for displaying the logo of the item.
    let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "LogoNetflix"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    /// The label for displaying the name of the item.
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica-Bold", size: 16)
        return label
    }()
    
    /// The label for displaying additional details about the item.
    let totalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        return label
    }()
    
    /// The stack view for arranging the data labels vertically.
    let dataStackView: UIStackView = {
        let dataStackView = UIStackView()
        dataStackView.axis = .vertical
        dataStackView.spacing = 3
        dataStackView.translatesAutoresizingMaskIntoConstraints = false
        return dataStackView
    }()
    
    /// The label for displaying the wallet value of the item.
    let walletLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.numberWalletLabel
        let attributedString = NSMutableAttributedString(string: label.text ?? "")
        let boldFont = UIFont(name: "Helvetica-Bold", size: 16)
        attributedString.addAttributes([.font: boldFont ?? ""], range: NSRange(location: 0, length: 5))
        let regularFont = UIFont.systemFont(ofSize: 14)
        attributedString.addAttributes([.font: regularFont], range: NSRange(location: 6, length: 3))
        label.attributedText = attributedString
        return label
    }()
    
    /// The label for displaying the percentage value of the item.
    let percentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGreen
        return label
    }()
    
    /// The stack view for arranging the number labels vertically.
    let numberStackView: UIStackView = {
        let numberStackView = UIStackView()
        numberStackView.axis = .vertical
        numberStackView.spacing = 3
        numberStackView.alignment = .trailing
        numberStackView.translatesAutoresizingMaskIntoConstraints = false
        return numberStackView
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        contentView.addSubview(logoImageView)
        contentView.addSubview(dataStackView)
        contentView.addSubview(numberStackView)
        
        [nameLabel, totalLabel].forEach { dataStackView.addArrangedSubview($0) }
        
        [walletLabel, percentLabel].forEach { numberStackView.addArrangedSubview($0) }
    }
    
    // MARK: - Constraint Setup
    
    private func makeConstraints() {
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
