import SwiftUI

struct SkoolTextField: View {
    let image: UIImage
    let inputText: String
    @Binding var bindingText: String
    
    var body: some View {
        HStack {
            if image == .password {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 20, height: 25)
                    .padding(.leading, 12)
            } else {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.leading, 12)
            }
            
            TextField(inputText, text: $bindingText)
                .font(.system(size: 15))
                .padding(.leading, 11)
                .frame(height: 50)
                .tint(.sub1)
                .font(.medium(14))
                .hideKeyBoard()
            
        }
        .frame(width: 300, height: 50)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(bindingText.isEmpty ? Color.init(uiColor: .systemGray4) : Color.sub1 , lineWidth: 1)
        )
        .padding(.vertical, 2)
    }
}
