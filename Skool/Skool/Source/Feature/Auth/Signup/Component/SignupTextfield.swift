import SwiftUI

struct SignupTextfield: View {
    let inputText: String
    @Binding var text: String
    let boolean: Bool
    var body: some View {
        TextField(inputText, text: $text)            
            .tint(.main)
            .padding()
            .frame(width: 345, height: 65)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(boolean ? Color.init(uiColor: .systemGray4) : Color.black, lineWidth: 1)
            }
            .hideKeyBoard()
    }
}
