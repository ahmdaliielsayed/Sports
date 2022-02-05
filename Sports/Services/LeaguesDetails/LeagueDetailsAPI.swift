//
//  LeagueDetailsAPI.swift
//  Sports
//
//  Created by Mohamed Adel on 2/4/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation
protocol LeagueDetailsAPIProtocol {
     func getLeagueDetails(leagueId:String,complention:@escaping (Swift.Result<EventResult?,NSError>)->Void)
}


class LeagueDetailsAPI:BaseAPI<LeagueDetailsInteractor>,LeagueDetailsAPIProtocol{
    
    func getLeagueDetails(leagueId:String,complention:@escaping (Swift.Result<EventResult?,NSError>)->Void){
        self.fetchData(target: LeagueDetailsInteractor.getLeagueDetails(leagueId: leagueId), responseClass: EventResult.self) { result in
            complention(result)
        }
    }
}
