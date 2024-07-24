import FirebaseFirestore

struct FirestoreRepository {
    func addReview(uid: String, code: String, rate: Int, comment: String, images: [String]) async throws {
        let db = Firestore.firestore()
        try await db.collection(FirestoreReview.collectionName).addDocument(data: [
            "uid": uid,
            "code": code,
            "rate": rate,
            "comment": comment,
            "images": images
            ]
        )
    }

    func fetchReviews() async throws -> [Review] {
        let db = Firestore.firestore()
        let querySnapshot = try await db.collection(FirestoreReview.collectionName).limit(to: 30).getDocuments()

        var reviews: [Review] = []
        for document in querySnapshot.documents {
            let firestoreReview = try FirestoreReview(document: document)
            let post = Review(
                id: firestoreReview.id,
                userName: firestoreReview.uid, 
                code: firestoreReview.code,
                rate: firestoreReview.rate,
                comment: firestoreReview.comment, 
                images: firestoreReview.images
            )
            reviews.append(post)
        }
        return reviews
    }
}
