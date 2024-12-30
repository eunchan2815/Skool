//
//  ResultSeat.swift
//  Skool
//
//  Created by dgsw30 on 12/27/24.
//

import SwiftUI

struct ResultSeat: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @Binding var number: String
    @State private var seats: [Int] = []
    var body: some View {
        VStack {
            ProgressBar(progress: .two)
            HStack {
                Text("자리배치가 완료되었어요!")
                    .font(.krMedium(20))
                Spacer()
            }
            .padding(.leading, 14)
            .padding(.vertical, 40)
            LazyVGrid(columns: columns) {
                ForEach(seats, id: \.self) { index in
                    ZStack {
                        Image(icon: .seatTable)
                            .resizable()
                            .frame(width: 78, height: 50)
                            .frame(height: 50)
                        Text("\(index)")
                            .font(.krMedium(22))
                    }
                }
            }
            .padding()
            
            HStack {
                Spacer()
                Button {
                    shuffleSeats()
                } label: {
                    Text("다시 뽑기")
                        .frame(width: 98, height: 30)
                        .font(.krMedium(15))
                        .background(.sub1)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding(.trailing, 20)
            .onAppear {
                updateSeats()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    shuffleSeats()
                }
            }
        }
        Spacer()
            .SkoolBackButton()
    }
    func shuffleSeats() {
        seats.shuffle()
    }
    
    func updateSeats() {
        if let num = Int(number), num > 0 {
            seats = Array(1...num)
        } else {
            seats = []
        }
    }
}
