//
//  SessionListViewModel.swift
//  StudySessionNavi
//
//  Created by Shunya Yamashita on 2018/05/19.
//

import Foundation
import RxSwift

protocol SessionListViewModelInputs {
    func decrementTargetMonth()
    func incrementTargetMonth()
    func getSessionList()
}

protocol SessionListViewModelOutputs {
    var numberOfSections: Int { get }
    var numberOfItemsInSection: Int { get }
    var sessionList: [Session] { get }
    var targetDate: Variable<Date> { get }
}

// 使用側はこの型を使用することでシンプルに扱える
protocol SessionListViewModelType {
    var inputs: SessionListViewModelInputs { get }
    var outputs: SessionListViewModelOutputs { get }
}

final class SessionListViewModel: SessionListViewModelType, SessionListViewModelInputs, SessionListViewModelOutputs {

    var inputs: SessionListViewModelInputs { return self }
    var outputs: SessionListViewModelOutputs { return self }

    // MARK: - HogeViewModelInputs

    let numberOfSections: Int = 1
    let numberOfItemsInSection: Int = 0
    let sessionList: [Session] = []
    var targetDate: Variable<Date> = Variable(Date())

    // MARK: - HogeViewModelOutputs

    func decrementTargetMonth() {
        targetDate.value.month -= 1
    }

    func incrementTargetMonth() {
        targetDate.value.month += 1
    }

    func getSessionList() {
        //        let dataStore = ConnpassDataStoreImpl()
        //        dataStore.search(keyword: "") { (result) in
        //            print(result)
        //        }
    }
}
