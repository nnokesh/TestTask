//
//  FirstViewController.swift
//  TestTaskFreedomBank
//
//  Created by Nursultan on 17.07.2023.
//

import UIKit
import Charts

/// View controller that displays a circle view with a pie chart and a table view.
final class CircleViewController: UIViewController {
    
    // MARK: - Properties
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private let customStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let headerView: UIView = {
        let headerView = UIView()
        return headerView
    }()
    
    private let headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.text = Constants.headerLabelText
        headerLabel.textColor = .lightGray
        return headerLabel
    }()
    
    private let customTableView: UIView = {
        let customTableView = UIView()
        customTableView.translatesAutoresizingMaskIntoConstraints = false
        customTableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        customTableView.layer.cornerRadius = 20
        customTableView.clipsToBounds = true
        customTableView.backgroundColor = .subviewBackgroundColor
        return customTableView
    }()
    
    private let customView: UIView = {
        let customView = UIView()
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.layer.cornerRadius = 20
        customView.backgroundColor = .subviewBackgroundColor
        return customView
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let sumLabel: UILabel = {
        let sumLabel = UILabel()
        sumLabel.text = Constants.sumLabelText
        sumLabel.font = UIFont(name: "Helvetica-Bold", size: 26)
        sumLabel.textColor = .black
        sumLabel.translatesAutoresizingMaskIntoConstraints = false
        return sumLabel
    }()
    
    private let stockSlider: UISlider = {
        let stockSlider = CustomSlider()
        stockSlider.minimumValue = 0
        stockSlider.maximumValue = 100
        stockSlider.value = 61.6
        stockSlider.minimumTrackTintColor = .darkGreen
        stockSlider.setThumbImage(UIImage(), for: .normal)
        stockSlider.translatesAutoresizingMaskIntoConstraints = false
        return stockSlider
    }()
    
    private let fundSlider: UISlider = {
        let fundSlider = CustomSlider()
        fundSlider.minimumValue = 0
        fundSlider.maximumValue = 100
        fundSlider.value = 32.4
        fundSlider.setThumbImage(UIImage(), for: .normal)
        fundSlider.minimumTrackTintColor = .brightGreen
        fundSlider.translatesAutoresizingMaskIntoConstraints = false
        return fundSlider
    }()
    
    private let obligationSlider: UISlider = {
        let obligationSlider = CustomSlider()
        obligationSlider.minimumValue = 0
        obligationSlider.maximumValue = 10
        obligationSlider.value = 1.6
        obligationSlider.setThumbImage(UIImage(), for: .normal)
        obligationSlider.minimumTrackTintColor = .lightGreen
        obligationSlider.translatesAutoresizingMaskIntoConstraints = false
        return obligationSlider
    }()
    
    private let stockLabel: UILabel = {
        let stockLabel = UILabel()
        stockLabel.text = Constants.stockLabelText
        stockLabel.textColor = .lightGray
        stockLabel.translatesAutoresizingMaskIntoConstraints = false
        return stockLabel
    }()
    
    private let fundLabel: UILabel = {
        let fundLabel = UILabel()
        fundLabel.text = Constants.fundLabelText
        fundLabel.textColor = .lightGray
        fundLabel.translatesAutoresizingMaskIntoConstraints = false
        return fundLabel
    }()
    
    private let obligationLabel: UILabel = {
        let obligationLabel = UILabel()
        obligationLabel.text = Constants.obligationLabelText
        obligationLabel.textColor = .lightGray
        obligationLabel.translatesAutoresizingMaskIntoConstraints = false
        return obligationLabel
    }()
    
    private let totalStockLabel: UILabel = {
        let totalStocksLabel = UILabel()
        totalStocksLabel.text = Constants.totalStocksLabelText
        totalStocksLabel.textColor = .lightGray
        totalStocksLabel.translatesAutoresizingMaskIntoConstraints = false
        return totalStocksLabel
    }()
    
    private let numberStockLabel: UILabel = {
        let numberStockLabel = UILabel()
        numberStockLabel.text = Constants.numberStockLabel
        numberStockLabel.translatesAutoresizingMaskIntoConstraints = false
        return numberStockLabel
    }()
    
    private let numberFundLabel: UILabel = {
        let numberFundLabel = UILabel()
        numberFundLabel.text = Constants.numberFundLabel
        numberFundLabel.translatesAutoresizingMaskIntoConstraints = false
        return numberFundLabel
    }()
    
    private let numberObligationLabel: UILabel = {
        let numberObligationLabel = UILabel()
        numberObligationLabel.text = Constants.numberObligationLabel
        numberObligationLabel.translatesAutoresizingMaskIntoConstraints = false
        return numberObligationLabel
    }()
    
    private let textDataStackView: UIStackView = {
        let textDataStackView = UIStackView()
        textDataStackView.axis = .vertical
        textDataStackView.spacing = 15
        textDataStackView.translatesAutoresizingMaskIntoConstraints = false
        return textDataStackView
    }()
    
    private let numberDataStackView: UIStackView = {
        let numberDataStackView = UIStackView()
        numberDataStackView.axis = .vertical
        numberDataStackView.spacing = 15
        numberDataStackView.alignment = .trailing
        numberDataStackView.translatesAutoresizingMaskIntoConstraints = false
        return numberDataStackView
    }()
    
    private let model = CompanyModel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .viewBackgroundColor
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        
        setupUI()
        createConstraints()
        createCircle()
    }
    
    // MARK: - UI Setup
    
    private func createCircle() {
        let pieChartView = PieChartView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        
        let entries = [
            PieChartDataEntry(value: 28.4, label: ""),
            PieChartDataEntry(value: 11, label: ""),
            PieChartDataEntry(value: 61.6, label: "")
        ]
        
        let dataSet = PieChartDataSet(entries: entries, label: "")
        dataSet.colors = [ .brightGreen, .lightGreen, .darkGreen]
        dataSet.sliceSpace = 5
        dataSet.formLineWidth = 10
        dataSet.valueLineWidth = 10
        dataSet.drawValuesEnabled = false
        
        let data = PieChartData(dataSet: dataSet)
        
        pieChartView.data = data
        pieChartView.highlightPerTapEnabled = false
        pieChartView.holeRadiusPercent = 0.82
        pieChartView.drawEntryLabelsEnabled = false
        pieChartView.legend.enabled = false
        pieChartView.translatesAutoresizingMaskIntoConstraints = false
        
        customView.addSubview(pieChartView)
        customView.addSubview(sumLabel)
        customView.addSubview(totalStockLabel)
        
        NSLayoutConstraint.activate([
            pieChartView.centerXAnchor.constraint(equalTo: customView.centerXAnchor),
            pieChartView.topAnchor.constraint(equalTo: customView.topAnchor, constant: 5),
            pieChartView.widthAnchor.constraint(equalToConstant: 250),
            pieChartView.heightAnchor.constraint(equalToConstant: 250),
            
            sumLabel.centerXAnchor.constraint(equalTo: pieChartView.centerXAnchor),
            sumLabel.topAnchor.constraint(equalTo: pieChartView.topAnchor, constant: 105),
            
            totalStockLabel.topAnchor.constraint(equalTo: sumLabel.bottomAnchor, constant: 5),
            totalStockLabel.centerXAnchor.constraint(equalTo: pieChartView.centerXAnchor),
            totalStockLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [stockLabel, fundLabel, obligationLabel].forEach { textDataStackView.addArrangedSubview($0) }
        [numberStockLabel, numberFundLabel, numberObligationLabel].forEach { numberDataStackView.addArrangedSubview($0) }
        
        customView.addSubview(textDataStackView)
        customView.addSubview(numberDataStackView)
        customView.addSubview(stockSlider)
        customView.addSubview(fundSlider)
        customView.addSubview(obligationSlider)
        
        customTableView.addSubview(tableView)
        headerView.addSubview(headerLabel)
        
        [customView, customTableView].forEach { customStackView.addArrangedSubview($0) }
        
        contentView.addSubview(customStackView)
    }
    
    private func createConstraints() {
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            customStackView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            customStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            customStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            customView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            customView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            customView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            customView.heightAnchor.constraint(equalToConstant: 390),
            
            textDataStackView.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 20),
            textDataStackView.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: -30),
            
            obligationSlider.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: -35),
            obligationSlider.leadingAnchor.constraint(equalTo: textDataStackView.trailingAnchor, constant: 60),
            
            fundSlider.bottomAnchor.constraint(equalTo: obligationSlider.topAnchor, constant: -33),
            fundSlider.leadingAnchor.constraint(equalTo: textDataStackView.trailingAnchor, constant: 60),
            
            stockSlider.bottomAnchor.constraint(equalTo: fundSlider.topAnchor, constant: -33),
            stockSlider.leadingAnchor.constraint(equalTo: textDataStackView.trailingAnchor, constant: 60),
            
            numberDataStackView.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: -30),
            numberDataStackView.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -20),
            
            customTableView.topAnchor.constraint(equalTo: customView.bottomAnchor, constant: 15),
            customTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            customTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            customTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            customTableView.heightAnchor.constraint(equalToConstant: 390),
            
            tableView.topAnchor.constraint(equalTo: customTableView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: customTableView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: customTableView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: customTableView.bottomAnchor),
            
            headerLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 8),
            headerLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            headerLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8)
        ])
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension CircleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            return UITableViewCell()
        }
        
        let row = indexPath.row
        let image = model.images[row]
        let name = model.nameCompany[row]
        let totalStock = model.totalStocks[row]
        let percentLabel = model.percentData[row]
        let percentLabelColor = model.percentTextColors[row]
        
        cell.logoImageView.image = image
        cell.nameLabel.text = name
        cell.totalLabel.text = totalStock
        cell.percentLabel.text = percentLabel
        cell.percentLabel.textColor = percentLabelColor
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped cell")
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

