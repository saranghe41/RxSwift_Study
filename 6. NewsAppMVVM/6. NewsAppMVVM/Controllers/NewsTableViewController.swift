//
//  ViewController.swift
//  6. NewsAppMVVM
//
//  Created by 김지은 on 2022/09/06.
//

import UIKit
import RxSwift
import RxCocoa

class NewsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navbarBackColor()
    }

    fileprivate func navbarBackColor() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        // background color 지정
        appearance.backgroundColor = UIColor(displayP3Red: 189/255, green: 195/255, blue: 199/255, alpha: 1.0)
        
        // largetitle color 지정
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        // scroll 시 title color 지정
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        self.navigationController?.navigationBar.standardAppearance = appearance;
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
    }
}
