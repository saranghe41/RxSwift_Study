//
//  AddTaskViewController.swift
//  3. GoodList
//
//  Created by 김지은 on 2022/08/25.
//

import Foundation
import UIKit
import RxSwift

class AddTaskViewController: UIViewController {
    @IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
    @IBOutlet weak var taskTitleTextField: UITextField!
    
    private let taskSubject = PublishSubject<Task>()
    var taskSubjectObservable: Observable<Task> {
        return taskSubject.asObservable()
    }
    
    @IBAction func save(_ sender: Any) {
        guard let priority = Priority(rawValue: self.prioritySegmentedControl.selectedSegmentIndex)
            , let title = self.taskTitleTextField.text else { return }
        
        let task = Task(title: title, priority: priority)
        taskSubject.onNext(task)
        self.dismiss(animated: true, completion: nil)
    }
}
