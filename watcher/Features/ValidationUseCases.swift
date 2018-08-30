//
//  ValidationUseCases.swift
//  watcher
//
//  Created by Raoni Valadares on 29/08/18.
//  Copyright © 2018 solo. All rights reserved.
//

import Foundation
import Domain
import NetworkPlataform
import Result

struct ValidationUseCases: Domain.ValidationUseCases {
	private let localDataProvider: LocalDataProvider
	
	public var userToken: String? {
		return localDataProvider.deviceToken?.token
	}
	
	init() {
		localDataProvider = LocalDataProvider()
	}
	
	func requestUserToken(completion: (Result<Void, ViewModelError>) -> Void) {//TODO: ViewModelError
		APIProvider().makeTokenNetwork().requestUserToken() { result in
			print(result)
			
			if let deviceToken = result.value {
				self.localDataProvider.deviceToken = deviceToken
			}
		}
	}
	
	func requestNewSession(completion: (Result<Void, ViewModelError>) -> Void) {//TODO: ViewModelError
		//authentication/session/new
		//resquestToken
	}
}

class LocalDataProvider {
	var deviceToken: RequestToken?
}
