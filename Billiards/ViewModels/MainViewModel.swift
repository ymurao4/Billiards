//
//  MainViewModel.swift
//  Billiards
//
//  Created by 村尾慶伸 on 2021/01/07.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    
    @Published var numOfParticipants: Double = 4.0
    @Published var numOfBalls: Double = 3.0
    @Published var isValidated: Bool = true
    @Published var balls: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"]
    @Published var playerOrder: Int = 0
    
    private var cancellable: Set<AnyCancellable> = []
    
    
    init() {
        
        Publishers.CombineLatest($numOfParticipants, $numOfBalls)
            .receive(on: RunLoop.main)
            .map { (p, b) in
                
                return p * b <= 15
            }
            .assign(to: \.isValidated, on: self)
            .store(in: &cancellable)
    }
    
    func shuffleNumbers() {
        
        balls.shuffle()
    }
    
    func showMyNumbers() -> String {
        
        switch playerOrder {
        case 0:
            return "\(balls[0...2])"
        case 1:
            return ""
        case 2:
            return ""
        case 3:
            return ""
        case 4:
            return ""
        case 5:
            return ""
        default:
            return ""
        }
    }
    
    func getNumbers() {
        
        
    }
}