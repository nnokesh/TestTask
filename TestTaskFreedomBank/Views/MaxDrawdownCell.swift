//
//  FirstCell.swift
//  TestTaskFreedomBank
//
//  Created by Nursultan on 17.07.2023.
//

import UIKit

final class MaxDrawdownCell: UITableViewCell {
    
    static let identifier = "FirstCell"
       
    let dataLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Макс.просадка за все время"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    let percentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "-23,51%"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemRed
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(dataLabel)
        contentView.addSubview(percentLabel)

        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
        dataLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
        dataLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        dataLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        percentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
        percentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        percentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
        
      

