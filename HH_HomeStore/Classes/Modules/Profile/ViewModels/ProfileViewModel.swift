// Created by Maxim Belokosov.
//

// MARK: - ProfileViewModel.swift

import Foundation

@MainActor
class ProfileViewModel: ObservableObject {
    // MARK: Internal

    @Published var userProfile: UserProfile?
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadProfile() async {
        isLoading = true
        errorMessage = nil

        do {
            let profile = try await loadFromJSON()
            userProfile = profile
        } catch {
            errorMessage = "Ошибка загрузки профиля: \(error.localizedDescription)"
        }
    }

    // MARK: Private

    private func loadFromJSON() async throws -> UserProfile {
        guard let url = Bundle.main.url(forResource: "profile", withExtension: "json") else {
            throw URLError(.badURL)
        }

        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(UserProfile.self, from: data)
    }
}
