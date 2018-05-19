//
//  SessionCellViewModel.swift
//  UIComponent
//
//  Created by Shunya Yamashita on 2018/05/19.
//

import Foundation

protocol SessionCellViewModelInputs {
    func configureWith(title: String)
}

protocol SessionCellViewModelOutputs {
    var title: String { get }
}

protocol SessionCellViewModelType {
    var inputs: SessionCellViewModelInputs { get }
    var outputs: SessionCellViewModelOutputs { get }
}

final class SessionCellViewModel: SessionCellViewModelInputs, SessionCellViewModelOutputs, SessionCellViewModelType {

    var inputs: SessionCellViewModelInputs { return self }
    var outputs: SessionCellViewModelOutputs { return self }

    // MARK: - SessionCellViewModelInputs

    var title: String = ""

    // MARK: - SessionCellViewModelOutputs

    func configureWith(title: String) {
        
    }
}
