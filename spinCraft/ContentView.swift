import SwiftUI

enum Result: Int, Identifiable {
    var id: Int { rawValue }
    case success, failure
}

struct ContentView: View {
    
    @State private var symbols = [
        "eating", "love", "scary", "sleeping"
    ]
    @State private var index = [0, 1, 2, 3]
    @State private var counter = 10
    @State private var result: Result?
    
    var body: some View {
        ZStack {
            Image("sunshine")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 80) {
                
                // Title
                VStack {
                    HStack(spacing: 20) {
                        Image("fire")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50)
                        Text("SpinCraft")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Image("fire")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50)
                    }
                    
                    Text("Attempts Remaining: \(counter)")
                        .font(.title2)
                }
                
                // Icons
                VStack {
                    HStack(spacing: 40) {
                        Hexagon()
                            .fill(Color.white.opacity(0.5))
                            .frame(width: 100, height: 100)
                            .overlay(
                                Image(symbols[index[0]])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 65)
                            )
                            .shadow(color: .gray, radius: 5, x: 5, y: 5)
                        
                        Hexagon()
                            .fill(Color.white.opacity(0.5))
                            .frame(width: 100, height: 100)
                            .overlay(
                                Image(symbols[index[1]])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 65)
                            )
                            .shadow(color: .gray, radius: 5, x: 5, y: 5)
                    }
                    
                    Hexagon()
                        .fill(Color.white.opacity(0.5))
                        .frame(width: 100, height: 100)
                        .overlay(
                            Image(symbols[index[2]])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 65)
                        )
                        .shadow(color: .gray, radius: 5, x: 5, y: 5)
                    
                    HStack(spacing: 40) {
                        Hexagon()
                            .fill(Color.white.opacity(0.5))
                            .frame(width: 100, height: 100)
                            .overlay(
                                Image(symbols[index[3]])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 65)
                            )
                            .shadow(color: .gray, radius: 5, x: 5, y: 5)
                        
                        Hexagon()
                            .fill(Color.white.opacity(0.5))
                            .frame(width: 100, height: 100)
                            .overlay(
                                Image(symbols[index[0]])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 65)
                            )
                            .shadow(color: .gray, radius: 5, x: 5, y: 5)
                    }
                }
                
                
                // Spin button
                Button {
                    setIndex()
                    counter -= 1
                    result = getResult()
                } label: {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 250, height: 60)
                        .foregroundColor(.yellow)
                        .overlay(
                            Text("Spin")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        )
                }
                .shadow(color: .blue.opacity(0.5), radius: 1, y: 3)
                .alert(item: $result, content: { result -> Alert in
                    switch result {
                    case .failure:
                        return Alert(title: Text("Ooopppsss !"), message: Text("Better luck next time"), dismissButton: .cancel())
                    case .success:
                        return Alert(title: Text("Yahhh! you won"), message: Text("Born with the charm"), dismissButton: .cancel())
                    }
                })
            }
        }
    }
    
    func getResult() -> Result? {
        
        var same: Bool = true
        
        for i in 0..<(index.count - 1) {
            if index[i] != index[i+1] {
                same = false
            }
        }
        
        if same {
            counter = 10
            return .success
        }
        
        if counter == 0 {
            counter = 10
            return .failure
        }
        
        return nil
    }
    
    func setIndex() -> Void {
        for i in 0..<index.count {
            index[i] = Int.random(in: 0..<index.count)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
