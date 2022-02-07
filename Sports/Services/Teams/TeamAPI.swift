//
//  TeamAPI.swift
//  Sports
//
//  Created by Mohamed Adel on 2/6/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation

protocol TeamAPIProtocol {
    
}


class TeamAPI : BaseAPI<TeamInteractor>{
    
    func getTeamsData(leagueName:String,complention:@escaping(Swift.Result<TeamResult?,NSError>) -> Void){
        self.fetchData(target: TeamInteractor.getTeamsData(leagueName: leagueName), responseClass: TeamResult.self) { (result) in
            complention(result)
        }
    }
}
