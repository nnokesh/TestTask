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
    
    var pieChartView: PieChartView!
    
    let headerView: UIView = {
        let headerView = UIView()
        return headerView
    }()

    let headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.text = "Портфель"
        headerLabel.textColor = .lightGray
        return headerLabel
    }()
    
    let customTableView: UIView = {
        let customTableView = UIView()
        customTableView.translatesAutoresizingMaskIntoConstraints = false
        customTableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        customTableView.layer.cornerRadius = 20
        customTableView.clipsToBounds = true
        return customTableView
    }()
    
    let customView: UIView = {
        let customView = UIView()
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.layer.cornerRadius = 20
        customView.backgroundColor =  .white
        return customView
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let sumLabel: UILabel = {
        let sumLabel = UILabel()
        sumLabel.text = "3 660 $"
        sumLabel.font = UIFont(name: "Helvetica-Bold", size: 26)
        sumLabel.textColor = .black
        sumLabel.translatesAutoresizingMaskIntoConstraints = false
        return sumLabel
    }()
    
    let stockSlider: UISlider = {
        let stockSlider = CustomSlider()
        stockSlider.minimumValue = 0
        stockSlider.maximumValue = 100
        stockSlider.value = 61.6
        stockSlider.minimumTrackTintColor = UIColor(red: 46/255, green: 132/255, blue: 82/255, alpha: 1)
        stockSlider.setThumbImage(UIImage(), for: .normal)
        stockSlider.translatesAutoresizingMaskIntoConstraints = false
        return stockSlider
    }()
    
    let fundSlider: UISlider = {
        let fundSlider = CustomSlider()
        fundSlider.minimumValue = 0
        fundSlider.maximumValue = 100
        fundSlider.value = 32.4
        fundSlider.setThumbImage(UIImage(), for: .normal)
        fundSlider.minimumTrackTintColor = UIColor(red: 78/255, green: 188/255, blue: 115/255, alpha: 1)
        fundSlider.translatesAutoresizingMaskIntoConstraints = false
        return fundSlider
    }()
    
    let obligationSlider: UISlider = {
        let obligationSlider = CustomSlider()
        obligationSlider.minimumValue = 0
        obligationSlider.maximumValue = 10
        obligationSlider.value = 1.6
        obligationSlider.setThumbImage(UIImage(), for: .normal)
        obligationSlider.minimumTrackTintColor = UIColor(red: 133/255, green: 212/255, blue: 143/255, alpha: 1)
        obligationSlider.translatesAutoresizingMaskIntoConstraints = false
        return obligationSlider
    }()
    
    let stockLabel: UILabel = {
        let stockLabel = UILabel()
        stockLabel.text = "Акции"
        stockLabel.textColor = .lightGray
        stockLabel.translatesAutoresizingMaskIntoConstraints = false
        return stockLabel
    }()
    
    let fundLabel: UILabel = {
        let fundsLabel = UILabel()
        fundsLabel.text = "Фонды"
        fundsLabel.textColor = .lightGray
        fundsLabel.translatesAutoresizingMaskIntoConstraints = false
        return fundsLabel
    }()
    
    let obligationLabel: UILabel = {
        let obligationLabel = UILabel()
        obligationLabel.text = "Облигации"
        obligationLabel.textColor = .lightGray
        obligationLabel.translatesAutoresizingMaskIntoConstraints = false
        return obligationLabel
    }()
    
    let totalStockLabel: UILabel = {
        let totalStocksLabel = UILabel()
        totalStocksLabel.text = "5 акций"
        totalStocksLabel.textColor = .lightGray
        totalStocksLabel.translatesAutoresizingMaskIntoConstraints = false
        return totalStocksLabel
    }()
    
    let numberStockLabel: UILabel = {
        let numberStockLabel = UILabel()
        numberStockLabel.text = "61,6%"
        numberStockLabel.translatesAutoresizingMaskIntoConstraints = false
        return numberStockLabel
    }()
    
    let numberFundLabel: UILabel = {
        let numberFundLabel = UILabel()
        numberFundLabel.text = "32,4%"
        numberFundLabel.translatesAutoresizingMaskIntoConstraints = false
        return numberFundLabel
    }()
    
    let numberObligationLabel: UILabel = {
        let numberObligationLabel = UILabel()
        numberObligationLabel.text = "5%"
        numberObligationLabel.translatesAutoresizingMaskIntoConstraints = false
        return numberObligationLabel
    }()
    
    let textDataStackView: UIStackView = {
        let textDataStackView = UIStackView()
        textDataStackView.axis = .vertical
        textDataStackView.spacing = 15
        textDataStackView.translatesAutoresizingMaskIntoConstraints = false
        return textDataStackView
    }()
    
    let numberDataStackView: UIStackView = {
        let numberDataStackView = UIStackView()
        numberDataStackView.axis = .vertical
        numberDataStackView.spacing = 15
        numberDataStackView.alignment = .trailing
        numberDataStackView.translatesAutoresizingMaskIntoConstraints = false
        return numberDataStackView
    }()
    
    let model = Models()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor =  UIColor(red: 0.9686275125, green: 0.9686275125, blue: 0.9686275125, alpha: 1)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        
        createCircle()
        
        setupUI()
        
        createConstraints()
    }
    
    // MARK: - Setup Methods
    
    private func createCircle() {
        pieChartView = PieChartView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        
        let entries = [
            PieChartDataEntry(value: 28.4, label: ""),
            PieChartDataEntry(value: 11, label: ""),
            PieChartDataEntry(value: 61.6, label: "")
        ]
        
        let dataSet = PieChartDataSet(entries: entries, label: "")
        dataSet.colors = [NSUIColor(red: 78/255, green: 188/255, blue: 115/255, alpha: 1), NSUIColor(red: 133/255, green: 212/255, blue: 143/255, alpha: 1), NSUIColor(red: 46/255, green: 132/255, blue: 82/255, alpha: 1)]
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
    }
    
    private func setupUI() {
        [stockLabel, fundLabel, obligationLabel].forEach { textDataStackView.addArrangedSubview($0) }
        [numberStockLabel, numberFundLabel, numberObligationLabel].forEach { numberDataStackView.addArrangedSubview($0) }
        
        view.addSubview(tableView)
        view.addSubview(customView)
        view.addSubview(customTableView)
        view.addSubview(stockSlider)
        
        customView.addSubview(pieChartView)
        customView.addSubview(textDataStackView)
        customView.addSubview(numberDataStackView)
        customView.addSubview(fundSlider)
        customView.addSubview(obligationSlider)
        customView.addSubview(stockSlider)
        customView.addSubview(fundSlider)
        customView.addSubview(obligationSlider)
        
        headerView.addSubview(headerLabel)
        
        customTableView.addSubview(tableView)
        
        pieChartView.addSubview(sumLabel)
        pieChartView.addSubview(totalStockLabel)
    }
    
    private func createConstraints() {
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            customView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            customView.heightAnchor.constraint(equalToConstant: 390),
            
            pieChartView.centerXAnchor.constraint(equalTo: customView.centerXAnchor),
            pieChartView.topAnchor.constraint(equalTo: customView.topAnchor, constant: 5),
            pieChartView.widthAnchor.constraint(equalToConstant: 250),
            pieChartView.heightAnchor.constraint(equalToConstant: 250),
            
            sumLabel.centerXAnchor.constraint(equalTo: pieChartView.centerXAnchor),
            sumLabel.topAnchor.constraint(equalTo: pieChartView.topAnchor, constant: 105),
            
            totalStockLabel.topAnchor.constraint(equalTo: sumLabel.bottomAnchor, constant: 5),
            totalStockLabel.centerXAnchor.constraint(equalTo: pieChartView.centerXAnchor),
            totalStockLabel.heightAnchor.constraint(equalToConstant: 20),
            
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
            
            customTableView.topAnchor.constraint(equalTo: customView.bottomAnchor, constant: 20),
            customTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            customTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            customTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            
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
        
        let image = model.images[indexPath.row]
        cell.logoImageView.image = image
        
        let name = model.nameCompany[indexPath.row]
        cell.nameLabel.text = name
        
        let totalStock = model.totalStocks[indexPath.row]
        cell.totalLabel.text = totalStock
        
        let percentLabel = model.percentData[indexPath.row]
        cell.percentLabel.text = percentLabel
        
        let percentLabelColor = model.percentTextColors[indexPath.row]
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
