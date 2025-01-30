import SwiftUI

struct InputSeat: View {
    @State private var number = ""
    @State private var isValid = false
    
    var body: some View {
        NavigationView {
            VStack {
                ProgressBar(progress: .one)
                    .padding(.bottom, 40)
                HStack {
                    Text("인원 수를 입력해 주세요!")
                        .font(.krMedium(20))
                    Spacer()
                }
                .padding(.leading, 24)
                
                TextField("인원 수를 입력하세요", text: $number)
                    .keyboardType(.numberPad)
                    .onChange(of: number) { newValue, oldValue in
                        validateInput()
                    }
                    .tint(.main)
                    .padding()
                    .frame(width: 345, height: 65)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                    }
                    .hideKeyBoard()
                    .padding(.vertical, 18)
                
                HStack {
                    Spacer()
                    Text("*최대 20명까지 입력 가능해요!")
                        .font(.medium(12))
                        .foregroundStyle(.sub1)
                }
                .padding(.trailing, 30)
                
                Spacer()
                
                NavigationLink {
                    ResultSeat(number: $number)
                } label: {
                    Text("다음")
                        .font(.krMedium(22))
                        .foregroundStyle(.white)
                        .frame(width: 345, height: 65)
                        .background(isValid ? Color.main : Color.gray)
                        .cornerRadius(14)
                }
                .disabled(!isValid)
            }
            .SkoolView()
        }
    }
    
    private func validateInput() {
        if let intValue = Int(number), intValue > 0 && intValue <= 20 {
            isValid = true
        } else {
            isValid = false
        }
    }
}

#Preview {
    InputSeat()
}
