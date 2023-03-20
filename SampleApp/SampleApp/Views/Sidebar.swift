import SwiftUI
import UniformTypeIdentifiers
import UTTypeHardwareIcons

struct Sidebar: View {
    @State private var query = ""

    var body: some View {
        List {
            Section(ProcessInfo.processInfo.hostName) {
                SidebarRow(model: .current)
            }
            
            ForEach(DeviceModelCollection.all.filter(query: query)) { collection in
                Section(collection.name) {
                    ForEach(collection.devices) { model in
                        SidebarRow(model: model)
                    }
                }
            }
        }
        .searchable(text: $query, placement: .automatic)
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}
