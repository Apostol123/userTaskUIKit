//
//  TaskViewController.swift
//  UserTasksUIKit
//
//  Created by Apostol, Alexandru on 17/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    var presenter: TaskViewPresenterProtocol
    let tableView = UITableView()
    
    lazy var titleViewContainer: UIView = {
        let view = UIView(frame: .zero)
        let label = UILabel(frame: .zero)
        label.text = "Tasks"
        label.font = UIFont(name: "AvenirNext-Bold", size: 28)
        label.textAlignment = .center
        view.fill(view: label, edgeInset: UIEdgeInsets(top: 16, left: -16, bottom: 16, right: 0))
        return view
    }()
    
    let mainStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    var content: [TaskViewSection] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        view.backgroundColor = .white
        configureStackView()
        
    }
    
    func configureStackView() {
           view.addSubview(mainStackView)
           mainStackView.translatesAutoresizingMaskIntoConstraints = false
           mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: navigationController!.navigationBar.frame.height + 40).isActive = true
           mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
           mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
           mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -38).isActive = true
           mainStackView.addArrangedSubview(titleViewContainer)
           mainStackView.addArrangedSubview(tableView)
       }
    
    
    init(presenter: TaskViewPresenterProtocol) {
         self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TaskViewController: TaskViewControllerProtocol {
    func show(_ content: TaskViewPresenterModel) {
        self.content = content.section
    }
    
}

extension TaskViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        content.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = content[indexPath.row]
        switch item {
        case .todo(let title, let completed, let userID):
            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
            cell.textLabel?.text = title
            return cell
        }
       
      }
}
