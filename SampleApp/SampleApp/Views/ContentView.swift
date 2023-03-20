import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            Sidebar()
        } detail: {
            EmptyView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
