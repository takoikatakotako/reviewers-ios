import Foundation

struct ReviewUseCase {
    private let firestoreRepository = FirestoreRepository()

    func fetchNewReviews() async throws -> [Review] {
        let firestoreReviews = try await firestoreRepository.fetchReviews(limit: 20)

        var reviews: [Review] = []
        for firestoreReview in firestoreReviews {
            let firestoreProfile: FirestoreProfile = try await firestoreRepository.fetchProfile(uid: firestoreReview.uid)
            let review = convertReview(firestoreReview: firestoreReview, firestoreProfile: firestoreProfile)
            reviews.append(review)
        }
        return reviews
    }

    func fetchNewUserReviews(uid: String) async throws -> [Review] {
        let firestoreReviews = try await firestoreRepository.fetchNewUserReviews(uid: uid, limit: 20)
        var reviews: [Review] = []
        for firestoreReview in firestoreReviews {
            let firestoreProfile: FirestoreProfile = try await firestoreRepository.fetchProfile(uid: firestoreReview.uid)
            let review = convertReview(firestoreReview: firestoreReview, firestoreProfile: firestoreProfile)
            reviews.append(review)
        }
        return reviews
    }

    func fetchReviewComments(reviewId: String) async throws -> [Comment] {
        let firestoreComments: [FirestoreComment] = try await firestoreRepository.fetchComments(reviewId: reviewId)

        var comments: [Comment] = []
        for firestoreComment in firestoreComments {
            let firestoreProfile: FirestoreProfile = try await firestoreRepository.fetchProfile(uid: firestoreComment.uid)
            let comment = convertReviewComment(firestoreComment: firestoreComment, firestoreProfile: firestoreProfile)
            comments.append(comment)
        }
        return comments
    }

    func deleteReview(reviewId: String) async throws {
        try await firestoreRepository.deleteReview(reviewId: reviewId)
    }

    private func convertReview(firestoreReview: FirestoreReview, firestoreProfile: FirestoreProfile) -> Review {
        let profile = Profile(id: firestoreProfile.id, nickname: firestoreProfile.nickname, profile: firestoreProfile.profile)
        let review = Review(
            id: firestoreReview.id,
            uid: firestoreReview.uid,
            profile: profile,
            code: firestoreReview.code,
            rate: firestoreReview.rate,
            comment: firestoreReview.comment,
            images: firestoreReview.images,
            createdAt: firestoreReview.createdAt,
            updatedAt: firestoreReview.updatedAt
        )
        return review
    }

    private func convertReviewComment(firestoreComment: FirestoreComment, firestoreProfile: FirestoreProfile) -> Comment {
        // プロフィールがある場合
        let comment = Comment(
            id: firestoreComment.id,
            uid: firestoreComment.uid,
            comment: firestoreComment.comment,
            createdAt: firestoreComment.createdAt,
            profile: Profile(id: firestoreComment.uid, nickname: firestoreProfile.nickname, profile: firestoreProfile.profile)
        )
        return comment
    }
}
