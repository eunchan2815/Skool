//
//  HeaderView.swift
//  Skool
//
//  Created by dgsw30 on 1/3/25.
//

import SwiftUI

struct HeaderView: View {
    @ObservedObject var date: DateViewModel
    var body: some View {
        VStack {
            Section {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(date.currentWeek, id: \.self) { day in
                            VStack(spacing: 10) {
                                Text(date.extractDate(date: day, format: "eee"))
                                    .font(.krLight(14))
                                
                                Text(date.extractDate(date: day, format: "dd"))
                                    .font(.krLight(20))
                                    .frame(width: 70, height: 70)
                                    .background(date.isToday(date: day) ? Color.main : Color.sub2)
                                    .foregroundStyle(.white)
                                    .cornerRadius(35, corners: .allCorners)
                                    .padding(.top, date.isToday(date: day) ? 6 : 0)
                                    .shadow(radius: date.isToday(date: day) ? 3 : 0)
                            }
                            .onTapGesture {
                                withAnimation {
                                    date.currentDate = day
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            } header: {
                HStack {
                    Text(Date().formatted(date: .long, time: .omitted))
                        .foregroundStyle(.black)
                        .font(.krSemiBold(28))
                        .hLeading()
                }
                .padding()
            }
        }
    }
}
